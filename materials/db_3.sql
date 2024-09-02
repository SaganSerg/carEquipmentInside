/* axleload_inner */

DROP database axleload_inner;
-- посмотреть базы данный SHOW databases;
-- поcмотреть таблицы в базе данных USE chiptuning; SHOW tables;
-- посмотреть структуру таблицы DESC называние_таблицы 
-- SELECT quantity_discount_order_left FROM quantity_discount WHERE discount_id = ? ORDER BY quantity_discount_id DESC LIMIT 1
-- ALTER TABLE device ADD device_common_id INT UNSIGNED NOT NULL;
CREATE DATABASE axleload_inner CHARACTER SET utf8mb4 COLLATE = utf8mb4_unicode_ci;
CREATE USER 'admin_axleload_inner'@'localhost' IDENTIFIED BY 'Vagon_3611'; 
GRANT SELECT, INSERT, UPDATE  ON axleload_inner.* TO 'admin_axleload_inner'@'localhost';

ALTER USER 'admin_axleload_inner'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Vagon_3611';

USE axleload_inner;

CREATE TABLE users
(
    user_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_username VARCHAR(50) NOT NULL UNIQUE,
    user_hashed_password BLOB NOT NULL,
    user_salt BLOB NOT NULL,
    user_email VARCHAR(50) NOT NULL,

    comment_ TEXT,
    time_ TIMESTAMP DEFAULT(NOW()),
    delete_ SMALLINT DEFAULT 0
)
ENGINE=INNODB;

/* INSERT INTO sessions (user_id) VALUES () */
CREATE TABLE sessions -- наличие сессий в таблице говорит о том, что сессия открыта. Если же она помечена delete_ 1, то значит сессия закрыта.
(
    session_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    -- session_closed SMALLINT DEFAULT 0, -- когда сессия закрывается это поле обновляю на 1 -- я думаю это поле не нужно. Когда сессия закрывается, то она просто удалятеся
    
    user_id INT UNSIGNED NOT NULL,

    comment_ TEXT,
    time_ TIMESTAMP DEFAULT(NOW()),
    delete_ SMALLINT DEFAULT 0,

    FOREIGN KEY (user_id) REFERENCES users(user_id)
)
ENGINE=INNODB;

CREATE TABLE devices -- данная таблица нужна для того, чтобы у всех устройств была сквозная идентификайция
(
    device_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    device_type TEXT NOT NULL, -- архитектура приложения должна быть сделана так, чтобы на момент резервирования ID сервер уже должен знать какой тип устройства регестрируется, поэтому проблем чтобы заполнить это поле быть не должно.
    device_jastreserved SMALLINT DEFAULT 1, -- в этом поле хранится информация о том, что данный id ПРОСТО зарегестрирован т.е. никакой реальный девайс не привязан т.е. имеется ввиду, что данная метка будет иметь значение 1, пока не придет окончательный ответ от клиента о том, что все датчики прошиты и сессию можно закрывать.

    session_id INT UNSIGNED NOT NULL,

    comment_ TEXT,
    time_ TIMESTAMP DEFAULT(NOW()),
	delete_ SMALLINT DEFAULT 0,

    FOREIGN KEY (session_id) REFERENCES sessions(session_id)
)
ENGINE=INNODB;

/* 
Каждый вид устройства придется выносить в отдельную таблицу т.е. вот сейчас у нас есть устройства сенсоры для нагрузки на ось. А потом возможно будут нужны, уже для другого сервиса другие датчики и они будут уже хранится в другой таблице
*/
/* SELECT device_id */
CREATE TABLE axleloadsensors -- при формировании qr-кода нужно зашивать еще и принадлежность датчика к сервису
(
    axleloadsensor_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    axleloadsensor_role TEXT,
    axleloadsensor_mac CHAR(17),
    axleloadsensor_date VARCHAR(19), -- данное поле переменной длины сделано на всякий случай -- вдруг в дату добавятся и дрегие данные предполагается что могут быть часы минуты секунды
    axleloadsensor_productversion TEXT,

    device_id INT UNSIGNED NOT NULL UNIQUE,

    comment_ TEXT,
    time_ TIMESTAMP DEFAULT(NOW()),
	delete_ SMALLINT DEFAULT 0,

    FOREIGN KEY (device_id) REFERENCES devices(device_id)
)
ENGINE=INNODB;


DROP database axleload_inner_sessions;
CREATE DATABASE axleload_inner_sessions;
CREATE USER 'admin_axleload_inner_sessions'@'localhost' IDENTIFIED BY 'Vagon_3611';
GRANT SELECT, INSERT, UPDATE, DELETE  ON axleload_inner_sessions.* TO 'admin_axleload_inner_sessions'@'localhost';
ALTER USER 'admin_axleload_inner_sessions'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Vagon_3611';

USE axleload_inner_sessions;

CREATE TABLE `sessions` 
(
  `session_id` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` mediumtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB;