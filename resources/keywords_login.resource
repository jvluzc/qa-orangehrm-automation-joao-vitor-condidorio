*** Settings ***
Library        SeleniumLibrary
Documentation  Keywords relacionados a feature de LOGIN

*** Variables ***
# Login
${urlBase}         https://opensource-demo.orangehrmlive.com
${usernameInput}   xpath=//input[@name='username']
${passwordInput}   css=input[name='password']
${loginButton}     css=button[type="submit"]
# Home
${areaUsuario}     css=.oxd-userdropdown-name

*** Keywords ***
Abrir o navegador e Acessar url
  # pra abir o navegador é só substituir a primeira linha abaixo por = Open Browser  browser=chrome
  # pra não abir o navegador é só substituir a primeira linha abaixo por = Open Browser    ${urlBase}    headlesschrome
  #Open Browser    ${urlBase}    chrome    options=add_argument(--headless)
  Open Browser    ${urlBase}    chrome
  Maximize Browser Window

Fechar o navegador
  Close Browser

Aguardar tela de login visível
  Wait Until Element Is Visible    ${loginButton}
  Capture Page Screenshot

Digitar e-mail e senha
  [Arguments]    ${email}    ${senha}
  Wait Until Element Is Visible    ${usernameInput}    timeout=15s
  Input Text                       ${usernameInput}    ${email}
  Input Password                   ${passwordInput}    ${senha}
  Capture Page Screenshot

Clicar no botão ENTRAR
  Wait Until Element Is Visible    ${loginButton}
  Click Button                     ${loginButton}

Validar que estou na area logada do sistema
  Wait Until Element Is Visible    xpath=//h6[contains(@class, 'oxd-topbar-header-breadcrumb-module')]    timeout=10s
  Element Text Should Be           xpath=//h6[contains(@class, 'oxd-topbar-header-breadcrumb-module')]    Dashboard
  Capture Page Screenshot

Validar mensagem de erro para credenciais inválidas
  Wait Until Element Is Visible  xpath=//p[text()='Invalid credentials']    timeout=15s
  Element Text Should Be         xpath=//p[text()='Invalid credentials']    Invalid credentials
  Capture Page Screenshot

Logout do sistema
  Click Element    ${areaUsuario}
  Wait Until Element Is Visible    xpath=//a[text()='Logout']    timeout=10s
  Click Element    xpath=//a[text()='Logout']
  Wait Until Element Is Visible    ${loginButton}    timeout=15s
  Capture Page Screenshot