const oneHour = 60 * 60 // в секундах
const oneMinutesMMSecond = 60 * 1000 // в миллисекундах
const oneHourMMSecond = oneHour * 1000 // в миллисекундах
const oneDaySecond = oneHour * 24 // в секундах
const oneDayMMSecond = oneDaySecond * 1000 // в миллисекундах
// const sessionTerminateTimeSecond = oneDaySecond * 1 // это время в течении которого Клиенту можно обращаться в рамках конкретной сессии
const sessionTerminateTimeSecond = oneHour * 1 / 4 // это потом надо будет исправить
module.exports = { 
    credentials: require(`./.credentials.${process.env.NODE_ENV || 'development'}`), 
    // это БД с данными
    host: 'localhost', 
    user: 'admin_axleload_inner', 
    password: 'Vagon_3611',
    database: 'axleload_inner',
    // это БД с сессиями
    sessionHost: 'localhost',
    sessionUser: 'admin_axleload_inner_sessions',
    sessionPassword: 'Vagon_3611',
    sessionDatabase: 'axleload_inner_sessions',

    innerClientTokenExpire: sessionTerminateTimeSecond, // 1 день
    longTokenExpire: oneDaySecond * 90, // 90 дней
    tokenExpire: oneDaySecond * 30, // 30 дней
    emailTokenExpire: oneDaySecond * 3, // 3 дня
    domen: 'localhost',
    yourEmail: 'sagan.sergei.mih@yandex.ru', // здесь должен быть реальный адрес с которого делается отправка, 
    httpProtocol: 'http',
    sessionCookiesExpirationMM: oneDayMMSecond * 1,  // 1 день
    // cleanConnectionsTime: oneDayMMSecond * 1, // 1 day
    cleanConnectionsTime: oneMinutesMMSecond * 2, // 
    sessionTerminateTime: 1000 * sessionTerminateTimeSecond,
    
    // отправка почты
    smtpKey: 'wgsfizmubelvmdly', // это ключ для сервера отправки почты в данном случае на яндексе
    smtpHost: 'smtp.yandex.ru',
    smtpPort: 465,
    smtpUser: 'sagan.sergei.mih',

    // это строка, которая подставляется, если не известен user-agent
    unknownUserAgent: 'unknown',

    // это имена свойств, которые хранятся у каждого Sensor в сервисе "нагрузка на ось"
    sensorPropertyNameList: [
        {jsonName: "DEVICE_TYPE", dbName: 'devicetype'},
        {jsonName: "ID", dbName: 'id'},
        {jsonName: "ROLE", dbName: 'role'},
        {jsonName: "NAME", dbName: 'name'},
        {jsonName: "MAC", dbName: 'mac'},
        {jsonName: "DATE", dbName: 'date'},
        {jsonName: "PRODUCT-VERSION", dbName: 'productversion'}
    ]

}
