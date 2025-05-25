*** Settings ***
Library        SeleniumLibrary
Resource        ../resources/keywords_criarUsuario.resource
Documentation  Keywords relacioandas a feature de Listar Usuários


*** Variables ***
#Criar Usuário
${textEmployeeInformation}   xpath=//h5[contains(@class, 'oxd-table-filter-title') and normalize-space(.)='Employee Information']
${employeeNameSearch}        xpath=//input[@placeholder='Type for hints...']
${SearchButton}              xpath=//button[@type='submit' and normalize-space(.)='Search']


*** Keywords ***
Pesquisar pelo Nome de Usuário Cadastrado na busca de usuarios
    Wait Until Element Is Visible    ${textEmployeeInformation}    timeout=15s
    Element Should Contain           ${textEmployeeInformation}    Employee Information
    Execute JavaScript    document.body.style.zoom='80%'
    Input Text    ${employeeNameSearch}    ${nome_completo}
    Capture Page Screenshot
    Click Element    ${SearchButton}

Validar Usuário da lista pelo Nome Cadastrado
  Wait Until Element Is Visible    (//div[contains(@class, 'oxd-table-row--clickable')])[1]    timeout=15s
  Capture Page Screenshot
  ${nomeTabela}=    Get Text    xpath=(//div[@class="oxd-table-cell oxd-padding-cell"])[3]/div
  Should Be Equal    ${nomeTabela}    ${nome_completo}
  Capture Page Screenshot