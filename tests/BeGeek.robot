*Settings*
Documentation       BeGeek test suite

Resource            ${EXECDIR}/resources/Base.robot

Test Setup          Start Session
Test Teardown       Finish Session

*Test Cases*
Be a Geek

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

Short Description

    ${user}     Factory User       short_desc
    Do Login    ${user}

    Go To Geek Form
    Fill Geek Form  ${user}[geek_profile]
    Submit Geek Form
    Alert Span Should Be    A descrição deve ter no minimo 80 caracteres

Long Description
 
    ${user}     Factory User        long_desc
    Do Login    ${user}
    
    Go To Geek Form
    Fill Geek Form  ${user}[geek_profile]
    Submit Geek Form
    Alert Span Should Be    A descrição deve ter no máximo 255 caracteres

Wrong Parameter
    [Tags]      wrong_parameter
    [Template]  Geek with Wrong Parameter
    1   ${EMPTY}        200         O Whatsapp deve ter 11 digitos contando com o DDD
    2   11              200         O Whatsapp deve ter 11 digitos contando com o DDD
    3   1198765432      200         O Whatsapp deve ter 11 digitos contando com o DDD
    4   11999999999     200         Informe a descrição do seu trabalho
    5   11999999999     ${EMPTY}    Valor hora deve ser numérico
    6   11999999999     150x        Valor hora deve ser numérico
    7   11999999999     xpto        Valor hora deve ser numérico
    8   11999999999     180!        Valor hora deve ser numérico


*Keywords*
Geek with Wrong Parameter
    [Arguments]     ${number_of_execution}      ${whatsapp}     ${cost}     ${expected_message}     

     ${geek_profile}    Create Dictionary
     ...                whats=${whatsapp}
    #  ...                desc=Formato seu computador, instalo o sistema operacional (Linux e Windows) e todos as ferramentas que você gosta de usar
     ...                printer_repair=Sim      work=Remoto     cost=${cost}

    IF  ${number_of_execution} == 1   
        ${user}     Factory User         login
        Do Login  ${user}
        Go To Geek Form
    END

    IF  '${expected_message}' == 'Informe a descrição do seu trabalho'
        Set To Dictionary   ${geek_profile}     desc    ${EMPTY}
    ELSE 
        Set To Dictionary   ${geek_profile}     desc    Formato seu computador, instalo o sistema operacional (Linux e Windows) e todos as ferramentas que você gosta de usar  
    END

    
    # IF  ${expected_message}     ==  Informe a descrição do seu trabalho
    #     ${geek_profile}[desc]   Set Variable    ${EMPTY}
    # END

    # ${geek_profile}[desc]   Set Variable If     ${number_of_execution}==4   ${EMPTY} 
    # Evaluate    ${geek_profile}[desc]   xpto 
    # Log To Console  ${geek_profile}[desc]   

    Fill Geek Form  ${geek_profile}
    Submit Geek Form
    Alert Span Should Be    ${expected_message}

