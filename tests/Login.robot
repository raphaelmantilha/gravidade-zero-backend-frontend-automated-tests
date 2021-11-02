*Settings*
Documentation       Login test suite

Resource            ${EXECDIR}/resources/Base.robot

Test Setup          Start Session
Test Teardown       Finish Session

*Test Cases*
User login

    ${user}                 Factory User Login
  
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

Empty Email
    [Tags]  desafio

     ${user}       Create Dictionary       email=                       password=pwd123

    Go To Login Page
    Fill Credentials  ${user}
    Submit Credentials
    Validate One Empty Field  E-mail obrigatório

Empty Password
    [Tags]  desafio

     ${user}       Create Dictionary       email=raphael.mantilha@gmail.com     password=

    Go To Login Page
    Fill Credentials  ${user}
    Submit Credentials
    Validate One Empty Field  Senha obrigatória

Empty Email and Empty Password
    [Tags]  desafio

     ${user}       Create Dictionary       email=                       password=

    Go To Login Page
    Fill Credentials  ${user}
    Submit Credentials
    Validate Two Empty Fields  E-mail obrigatório  Senha obrigatória




