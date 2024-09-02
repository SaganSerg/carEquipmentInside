CREATE TABLE users
(
    user_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_username VARCHAR(50) NOT NULL, -- не делаю с флагом unique чтобы два раза не делать сортировку и лишний раз не было риска сломать сервер
    user_hashed_password BLOB NOT NULL,
    user_salt BLOB NOT NULL,
    

    time_ TIMESTAMP DEFAULT(NOW()),
    delete_ SMALLINT DEFAULT 0
)
ENGINE=INNODB;

/* INSERT INTO sessions (user_id) VALUES () */
CREATE TABLE sessions
(
    session_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    session_closed SMALLINT DEFAULT 0, 
    
    user_id INT UNSIGNED NOT NULL,

    time_ TIMESTAMP DEFAULT(NOW()),
    delete_ SMALLINT DEFAULT 0,

    -- FOREIGN KEY (user_id) REFERENCES user_id(users) -- не буду связывать ключи в таблицах, чтобы снизить вероятность поломки
)
ENGINE=INNODB;

CREATE TABLE devices
(
    device_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    device_type TEXT NOT NULL, -- архитектура приложения должна быть сделана так, чтобы на момент резервирования ID сервер уже должен знать какой тип устройства регестрируется.
    deviceid_reserved  SMALLINT DEFAULT 1, -- данное поле говорит о том, что данный id ПРОСТО зарезервирован, и пока никакие конкретные устройства не регестрировались

    session_id INT UNSIGNED NOT NULL,

    time_ TIMESTAMP DEFAULT(NOW()),
	delete_ SMALLINT DEFAULT 0,

    -- FOREIGN KEY (session_id) REFERENCES session_id(sessions) -- не буду связывать ключи в таблицах, чтобы снизить вероятность поломки
)
ENGINE=INNODB;

/* 
Каждый вид устройства придется выносить в отдельную таблицу т.е. вот сейчас у нас есть устройства сенсоры для нагрузки на ось. А потом возможно будут нужны, уже для другого сервиса другие датчики и они будут уже хранится в другой таблице
*/
/* SELECT device_id */
CREATE TABLE axleloadsensors
(
    axleloadsensor_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    axleloadsensor_role TEXT,
    axleloadsensor_mac CHAR(17) NOT NULL,
    axleloadsensor_date CHAR(10),
    axleloadsensor_productversion TEXT,
    
    device_id INT UNSIGNED NOT NULL, -- не делаю с флагом unique чтобы два раза не делать сортировку и лишний раз не было риска сломать сервер

    time_ TIMESTAMP DEFAULT(NOW()),
	delete_ SMALLINT DEFAULT 0,

    -- FOREIGN KEY (device_id) REFERENCES device(device_id) -- не буду связывать ключи в таблицах, чтобы снизить вероятность поломки
)
ENGINE=INNODB;