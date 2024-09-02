

// Это JSON, который сервер получает от клиента при первом запросе
/* URL c этим запросом будет таким /axleload/sensorsRegistration/getIDs  */
let firstRequest = {
  "username": "someusername",
  "password": "somepassword",
  "requiredNumberOfIDs": 14
}
/* Ответ если все хорошо */
let firstResponseAllRight = {
  "result": 'OK',
  "discription": "All right",
  "responseCode": "1000", // первая цифра это шаг(этап) нулевой шаг --- это ответ применимый для любого шага, вторая цифра (успешно - 0, ошибка - 1 ), третья и четвертые цифры --- это код ошибки
  "token": "lkj;lkj;lkj;kj",
  "IDs": [12, 13, 14, 87]
}
/* Ответ если логин или пароль не верные */
let firstResponseLogOrPassWrong = {
  "result": 'Error',
  "discription": "Login or password is incorrect",
  "responseCode": "1101"
}
/* Ответ если в логике работы сервера произошел сбой */
let firstResponseSomethingWentWrong = {
  "result": 'Error',
  "discription": "Something went wrong",
  "responseCode": "1102"
}
/* Ответ если в структуре JSON есть ошибки */
let firstResponseJSONWrong = {
  "result": "Error",
  "discrioption": "JSON structure is wrong",
  "responseCode": "1103"
}

/* Ответ если ошибочный URL */
let otherResponseURLWrong = {
  "result": "Error",
  "discrioption": "URL is wrong",
  "responseCode": "0100"
}

// Это JSON, который сервер получает от клиента при втором запросе
/* URL c этим запросом будет таким /axleload/sensorsRegistration/register */
let secondRequire = {
  "Token": "lkljlkjlkjlkjlkj",
  "Sensors": [
      {
        "ID": "777",
        "ROLE": "Master",
        "MAC": "AA:99:09:FC:02:FE",
        "DATE": "2024-03-25",
        "PRODUCT-VERSION": "BLE_TK2700-1.3.0"
      },
      {
        "ID": "778",
        "ROLE": "Slave",
        "MAC": "AA:99:0A:FC:02:FE",
        "DATE": "2024-03-25",
        "PRODUCT-VERSION": "BLE_TK2700-1.3.0"
      },
      {
        "ID": "779",
        "ROLE": "Slave",
        "MAC": "AA:99:0B:FC:02:FE",
        "DATE": "2024-03-25",
        "PRODUCT-VERSION": "BLE_TK2700-1.3.0"
      }
    ]
}
/* Ответ если ошибочный токен */
let otherResponseTokenWrong = {
  "result": "Error",
  "discrioption": "Token is wrong",
  "responseCode": "0101"
}
/* Ответ если в заявке на регистрацию указаны идентификаторы, которые не были зарезервированы для данной сессии */
let secondResponseIDWrong = {
  "result": "Error",
  "discrioption": "IDs is wrong",
  "responseCode": "2100",
  "details": {
    'right': [12, 13, 14],
    'wrong': [15, 16, 17]
  }
}
/* Ответ если все хорошо */
let secondResponseAllRight = {
  "result": 'OK',
  "discription": "All right",
  "responseCode": "2000"
}

// Это JSON, который сервер получает от клиента при третьем запросе
/* URL c этим запросом будет таким /axleload/sensorsRegistration/notificationOfReadiness */
let thirdRequire = {
  "Token": "lkljlkjlkjlkjlkj",
  "ReadyProductsID": [12, 14] // этот массив может быть даже пустым
}

/* Ответ если все хорошо */
let thirdResponseAllRight = {
  "result": "OK",
  "discription": "All right",
  "responseCode": "3001",
  "RegisteredProductsID": [12, 13],
  "ReRegisteredProductsID": [34] // данный массив, в штатном режиме должен быть пустой, потому что если он непустой, то это означает, что какой-то датчик под данным id регестрируется повторно
}
