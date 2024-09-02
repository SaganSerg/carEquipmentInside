module.exports = {
    step0_Error_URLWrong: {
        "result": "Error",
        "discrioption": "URL is wrong",
        "responseCode": "0100"
    },
    step0_Error_somethingWrong: {
        "result": 'Error',
        "discription": "Something went wrong",
        "responseCode": "0102"
    },
    step0_Error_tokenWrong: {
        "result": "Error",
        "discrioption": "Token is wrong",
        "responseCode": "0101"
    },
    step0_Error_JSONstructureWrong: {
        "result": "Error",
        "discrioption": "JSON structure is wrong",
        "responseCode": "0103"
    },
    step0_Error_tokenMissed: {
        "result": "Error",
        "discrioption": "Token missed",
        "responseCode": "0104",
    },
    step1_OK: {
        "result": 'OK',
        "discription": "All right",
        "responseCode": "1000",
        "token": null,
        "IDs": null
    },
    step1_Error_loginOrPassIncorrect: {
        "result": 'Error',
        "discription": "Login or password is incorrect",
        "responseCode": "1101"
    },
    step1_Error_requiredNumberOfIDsLessThanZero: {
        "result": 'Error',
        "discription": "The required quantity is less than zero",
        "responseCode": "1102"
    },
    step1_Error_requestingNumberOfIdentifiers: {
        "result": 'Error',
        "discription": "Error requesting number of identifiers",
        "responseCode": "1103"
    },
    step2_Error_IDsWrong: {
        "result": "Error",
        "discrioption": "IDs is wrong",
        "responseCode": "2100",
        "details": {
            'right': null,
            'wrong': null
        }
    },
    step2_OK: {
        "result": 'OK',
        "discription": "All right",
        "responseCode": "2000"
    },

    step3_OK:
    {
        "result": "OK",
        "discription": "All right",
        "responseCode": "3001",
        "RegisteredProductsID": null,
        "ReRegisteredProductsID": null
    },
    step3_Error_notIDs:
    {
        "result": "Error",
        "discrioption": "This is not ids",
        "responseCode": "3100"
    },
    step3_Error_IDsNotReserved:
    {
        "result": "Error",
        "discrioption": "IDs is not reserved",
        "responseCode": "3101",
        "rejectedIDs": null
    },
    ster3_Error_IDsIsNotUnic:
    {
        "result": "Error",
        "discrioption": "IDs is not unic",
        "responseCode": "3102"
    }

}