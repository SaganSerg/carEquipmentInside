CREATE TABLE users
(
    user_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_username VARCHAR(50) NOT NULL UNIQUE,
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

    FOREIGN KEY (user_id) REFERENCES user_id(users)
)
ENGINE=INNODB;

/* 
Я завел отдельную таблицу, потому что получается что id девайса это как бы отдельная сущность с которой возможны манипуляции в частности ее резервирование
INSERT INTO deviceid (deviceid_id, deviceid_reserved, session_id) VALUES (), (), ()
*/
CREATE TABLE deviceid 
(
    deviceid_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    deviceid_reserved  SMALLINT DEFAULT 1, -- по умолчаню стоти 1, потому что по умолчанию, если мы делаем запись в этой таблице, то значит что мы резервируем id
    session_id INT UNSIGNED NOT NULL,

    time_ TIMESTAMP DEFAULT(NOW()),
	delete_ SMALLINT DEFAULT 0,

    FOREIGN KEY (session_id) REFERENCES session_id(sessions)
)
ENGINE=INNODB;

CREATE TABLE devices
(
    device_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	deviceid_id INT UNSIGNED NOT NULL UNIQUE, -- по идее придется проверять на уникальность
	device_type TEXT NOT NULL,

	time_ TIMESTAMP DEFAULT(NOW()),
	delete_ SMALLINT DEFAULT 0,
	
    FOREIGN KEY (deviceid_id) REFERENCES deviceid(deviceid_id)
)
ENGINE=INNODB;

/* 
Каждый вид устройства придется выносить в отдельную таблицу т.е. вот сейчас у нас есть устройства сенсоры для нагрузки на ось. А потом возможно будут нужны, уже для другого сервиса другие датчики и они будут уже хранится в другой таблице
*/
CREATE TABLE axleloadsensors
(
    axleloadsensor_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    axleloadsensor_role TEXT,
    axleloadsensor_mac CHAR(17) NOT NULL,
    axleloadsensor_date CHAR(10),
    axleloadsensor_productversion TEXT,
    deviceid_id INT UNSIGNED NOT NULL UNIQUE,

    time_ TIMESTAMP DEFAULT(NOW()),
	delete_ SMALLINT DEFAULT 0,

    FOREIGN KEY (deviceid_id) REFERENCES deviceid(deviceid_id)
)
ENGINE=INNODB;
