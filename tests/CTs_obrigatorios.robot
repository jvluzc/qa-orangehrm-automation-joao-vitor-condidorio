*** Settings ***
Resource        ../resources/keywords_login.resource
Resource        ../resources/keywords_criarUsuario.resource
Resource        ../resources/keywords_listarUsuarios.resource
Resource        ../resources/keywords_dadosRandomicos.resource
Test Setup      Abrir o navegador e Acessar url
Test Teardown   Fechar o navegador
Documentation   Casos de Testes Obrigatórios para o Teste Tenico

*** Test Cases ***

CT1: Login bem-sucedido com as credenciais fornecidas
  Aguardar tela de login visível
  Digitar e-mail e senha
    ...    Adminasd   
    ...    admin123
  Clicar no botão ENTRAR
  Validar que estou na area logada do sistema

CT2: Sair do sistema após o login
  Aguardar tela de login visível
  Digitar e-mail e senha
    ...    Admin   
    ...    admin123
  Clicar no botão ENTRAR
  Validar que estou na area logada do sistema
  Logout do sistema
  Aguardar tela de login visível

CT3: Login inválido com mensagem de erro validada
  Aguardar tela de login visível
  Digitar e-mail e senha
    ...    UsuárioInválido321
    ...    SenhaInválida321
  Clicar no botão ENTRAR
  Validar mensagem de erro para credenciais inválidas

CT4: Cadastro de novo funcionário através do menu PIM > Adicionar Funcionário
  Aguardar tela de login visível
  Digitar e-mail e senha
    ...    Admin   
    ...    admin123
  Clicar no botão ENTRAR
  Validar que estou na area logada do sistema
  Selecionar opção 'PIM' no menu de navegação e validar redirecionamento para a tela PIM
  Acessar a tela de criação de novo usuário
  Gerar Dados Randomicos Para Novo Usuario
  Criar Novo Usuário
    ...    ${first_name}
    ...    ${middle_name}
    ...    ${last_name}
    ...    ${employee_id}
    ...    ${username}
    ...    ${password}
    ...    ${password_confirm}
  Validar mensagem de usuário criado com sucesso

CT5: Busca pelo funcionário recém-cadastrado no PIM > Lista de Funcionários
  Aguardar tela de login visível
  Digitar e-mail e senha
    ...    Admin   
    ...    admin123
  Clicar no botão ENTRAR
  Validar que estou na area logada do sistema
  Selecionar opção 'PIM' no menu de navegação e validar redirecionamento para a tela PIM
  Acessar a tela de criação de novo usuário
  Gerar Dados Randomicos Para Novo Usuario
  Criar Novo Usuário
    ...    ${first_name}
    ...    ${middle_name}
    ...    ${last_name}
    ...    ${employee_id}
    ...    ${username}
    ...    ${password}
    ...    ${password_confirm}
  Validar mensagem de usuário criado com sucesso
  Selecionar opção 'PIM' no menu de navegação e validar redirecionamento para a tela PIM
  Pesquisar pelo Nome de Usuário Cadastrado na busca de usuarios
  Validar Usuário da lista pelo Nome Cadastrado