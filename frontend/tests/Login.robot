*Settings*
Documentation       Login test suite

Resource            ${EXECDIR}/resources/Base.robot

Test Setup          Start Session
Test Teardown       After Test

*Test Cases*
User login
    [Tags]          smoke_test
    
    ${user}                 Factory User    login
  
    Go To Login Page
    Fill Credentials    ${user}      
    Submit Credentials
    User Should Be Logged In    ${user}

Incorrect Pass
    [Tags]  inc_pass          

    ${user}       Create Dictionary       email=raphael.mantilha@gmail.com  password=abc123

    Go To Login Page
    Fill Credentials  ${user}
    Submit Credentials
    Modal Content Should Be     Usuário e/ou senha inválidos.

User not found
    [Tags]  user_404          

    ${user}       Create Dictionary       email=raphael.mantilha@404.net  password=abc123

    Go To Login Page
    Fill Credentials  ${user}
    Submit Credentials
    Modal Content Should Be     Usuário e/ou senha inválidos.

Incorrect Email
    [Tags]  inc_email          

    ${user}       Create Dictionary       email=raphael.mantilha.com.br  password=abc123

    Go To Login Page
    Fill Credentials  ${user}
    Submit Credentials
    Should Be Type Email

Required Email
    [Tags]  desafio

     ${user}       Create Dictionary       email=${EMPTY}                       password=pwd123

    Go To Login Page
    Fill Credentials  ${user}
    Submit Credentials
    Alert Span Should Be  E-mail obrigatório

Required Password
    [Tags]  desafio

     ${user}       Create Dictionary       email=raphael.mantilha@gmail.com     password=${EMPTY}

    Go To Login Page
    Fill Credentials  ${user}
    Submit Credentials
    Alert Span Should Be    Senha obrigatória

Required Fields
    [Tags]  desafio

     @{expected_alerts}      Create List
    ...                     E-mail obrigatório 
    ...                     Senha obrigatória

    Go To Login Page
    Submit Credentials
    Alert Spans Should Be   ${expected_alerts}




