*** Settings ***
Library            SeleniumLibrary
Library            String
Library            BuiltIn
Library            FakerLibrary
Documentation      Keywords usadas para geração de dados randômicos

*** Keywords ***

# Keywords de Dados randomicos para Cadastro de Usuários
Gerar Dados Randomicos Para Novo Usuario
    ${first_name}=    FakerLibrary.First Name
    ${middle_name}=   FakerLibrary.First Name
    ${last_name}=     FakerLibrary.Last Name

    Set Suite Variable    ${first_name}
    Set Suite Variable    ${middle_name}
    Set Suite Variable    ${last_name}

Gerar Email Aleatorio
    ${prefix}=    Generate Random String    8    [LETTERS]
    ${domain}=    Set Variable    exemplo.com
    ${email}=     Catenate    SEPARATOR=@    ${prefix}    ${domain}
    [Return]      ${email}

Gerar Senha Aleatoria
    ${maiuscula}=      Generate Random String    1    [UPPER]
    ${minuscula}=      Generate Random String    1    [LOWER]
    ${numero}=         Generate Random String    1    [NUMBERS]
    ${especial}=       Generate Random String    1    @$%*!?
    ${restante}=       Generate Random String    6    [LETTERS][NUMBERS]
    ${senha}=          Catenate    ${maiuscula}${minuscula}${numero}${especial}${restante}
    [Return]           ${senha}

Gerar Dados Randomicos Para Login
    ${email}=     Gerar Email Aleatorio
    ${senha}=     Gerar Senha Aleatoria
    Set Suite Variable    ${EMAIL_RANDOMICO}    ${email}
    Set Suite Variable    ${SENHA_RANDOMICA}    ${senha}
