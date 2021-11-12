*Settings*
Documentation       Signup Test Suite

Resource            ${EXECDIR}/resources/Base.robot

Test Setup          Start Session
Test Teardown       Finish Session

*Test Cases*
Register a new user
    
    ${user}         Factory User    faker

    Go To Signup Form   
    Fill Signup Form   ${user}
    Submit Signup Form
    User Should Be Registered 

Duplicate user
    [Tags]          attempt_signup

    ${user}                 Factory User    faker
    Add User From Database  ${user}  

    Go To Signup Form 
    Fill Signup Form   ${user}
    Submit Signup Form
    Modal Content Should Be  Já temos um usuário com o e-mail informado.

Wrong Email 
    [Tags]          attempt_signup

    ${user}         Factory User    wrong_email
        
    Go To Signup Form 
    Fill Signup Form   ${user}
    Submit Signup Form
    Alert Span Should Be  O email está estranho

Required Fields
    [Tags]          attempt_signup      required_fields

    @{expected_alerts}      Create List
    ...                     Cadê o seu nome?   
    ...                     E o sobrenome?
    ...                     O email é importante também!
    ...                     Agora só falta a senha!

    Go To Signup Form 
    Submit Signup Form
    Alert Spans Should Be   ${expected_alerts}

Short Password
    [Tags]          attempt_signup      short_pass
    [Template]      Signup With Short Pass
    1
    12
    123
    1234
    abc1
    a1
    a2b
    -1
    a3b#!

*Keywords*
Signup With Short Pass
    [Arguments]         ${short_pass}

    ${user}         Create Dictionary
    ...             name=Raphael                        lastname=Mantilha
    ...             email=raphael.mantilha@gmail.com    password=${short_pass}

    Go To Signup Form 
    Fill Signup Form   ${user}
    Submit Signup Form
    Alert Span Should Be    Informe uma senha com pelo menos 6 caracteres