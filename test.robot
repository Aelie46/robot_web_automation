*** Settings ***
Resource    ../keywords/pages/import.robot
Library    String

*** Test Cases ***
TC01
    ${RANDOM}=    Generate Random String    6
    ${EMAIL}=     Set Variable    test${RANDOM}@gmail.com
    
    common.Open doppio-training website
    register_feature.Register    ${EMAIL}
    logout_feature.logout
    login_feature.login    ${EMAIL}
    search_feature.Search
    addToCart_feature.addToCart
    delivery_feature.delivery    ${EMAIL}
    selectPayment.click next
    paymentDetail_feature.paymentDetail
    paymentSuccess.Click continue shopping
    checkOrder_feature.checkOrder

    Sleep    4s
