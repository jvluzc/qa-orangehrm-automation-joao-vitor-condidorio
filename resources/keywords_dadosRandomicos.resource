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
    ${employee_id}=   Generate Random Employee ID
    ${username}=      Set Variable    ${first_name}${last_name}_User
    ${password}=      Generate Senha Segura

    Set Suite Variable    ${first_name}
    Set Suite Variable    ${middle_name}
    Set Suite Variable    ${last_name}
    Set Suite Variable    ${employee_id}
    Set Suite Variable    ${username}
    Set Suite Variable    ${password}
    Set Suite Variable    ${password_confirm}    ${password}

Generate Random Employee ID
    ${id}=    Generate Random String    12    [NUMBERS]
    ${full_id}=    Set Variable    ID${id}
    [Return]    ${full_id}

Generate Senha Segura
    ${senha}=    Generate Random String    8    [LETTERS][NUMBERS]
    ${senha_final}=    Set Variable    ${senha}Ab@!
    [Return]    ${senha_final}
