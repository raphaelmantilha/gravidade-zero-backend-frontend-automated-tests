*Settings*
Documentation       BeGeek test suite

Resource            ${EXECDIR}/resources/Base.robot

Test Setup          Start Session
Test Teardown       After Test

*Test Cases*
Be a Geek
    [Tags]          smoke_test
    
    #Dado que eu tenho um usuário comum
    ${user}     Factory User    be_geek

    #Faço login na plataforma Getgeeks
    Do Login  ${user}

    #Quando submeto o formulário para me tornar um Geek (prestador de serviços)
    Go To Geek Form
    Fill Geek Form  ${user}[geek_profile]
    Submit Geek Form
    
    #Então devo ver a mensagem de sucesso
    Geek Form Should Be Success