*** Settings ***
Library        SeleniumLibrary
Documentation  Keywords relacioandas a feature de Criação de Novo Usuário

*** Variables ***
#Menu de Navegação
${Pim}         xpath=//a[contains(@class, 'oxd-main-menu-item') and contains(., 'PIM')]
#Criar Usuário
${addButton}           xpath=//button[contains(@class, 'oxd-button') and contains(., 'Add')]
${textAddEmployee}     xpath=//h6[text()='Add Employee']
${firstNameInput}       xpath=//input[@name='firstName']
${middleNameInput}     xpath=//input[@name='middleName']
${lastNameInput}       xpath=//input[@name='lastName']
${saveButton}           xpath=//button[@type='submit' and contains(., 'Save')]
${msgSucess}            xpath=//p[text() = 'Success']


*** Keywords ***
Selecionar opção 'PIM' no menu de navegação e validar redirecionamento para a tela PIM
  Wait Until Element Is Visible    xpath=//a[contains(@class, 'oxd-main-menu-item') and contains(., 'PIM')]    timeout=10s
  Element Should Contain           xpath=//a[contains(@class, 'oxd-main-menu-item') and contains(., 'PIM')]    PIM
  Capture Page Screenshot
  Click Element    ${Pim}
  Wait Until Element Is Visible    xpath=//h6[contains(@class, 'oxd-topbar-header-breadcrumb-module')]    timeout=10s
  Element Text Should Be           xpath=//h6[contains(@class, 'oxd-topbar-header-breadcrumb-module')]  PIM
  Capture Page Screenshot

Acessar a tela de criação de novo usuário
  Click Button    ${addButton}
  Wait Until Element Is Visible    ${textAddEmployee}   timeout=10s
  Element Should Contain           ${textAddEmployee}   Add Employee
  Capture Page Screenshot

Criar Novo Usuário
    [Arguments]    ${first_name}    ${middle_name}    ${last_name}
    ${nome_completo}=    Set Variable    ${first_name} ${middle_name}
    Set Suite Variable    ${nome_completo}
    Input Text       ${firstNameInput}          ${first_name}
    Input Text       ${middleNameInput}        ${middle_name}
    Input Text       ${lastNameInput}          ${last_name}
    Capture Page Screenshot
    Click Button     ${saveButton}

Validar mensagem de usuário criado com sucesso
  Wait Until Element Is Visible  ${msgSucess}    timeout=15s
  Element Text Should Be         ${msgSucess}    Success
  Capture Page Screenshot