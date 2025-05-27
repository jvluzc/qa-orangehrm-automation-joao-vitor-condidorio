
# Projeto de Automação com Robot Framework

Automação de testes para aplicação **OrangeHRM** usando Robot Framework com SeleniumLibrary e FakerLibrary para geração de dados randômicos.

---

## Estrutura do Projeto

- **resources/**  
  Contém arquivos com keywords específicas, organizadas por funcionalidades (login, criação de usuário, listagem de usuários, dados randômicos, etc).

- **tests/**  
  Casos de teste escritos em Robot Framework, integrando os keywords dos resources.

- **results/**  
  Pasta onde os relatórios, logs e screenshots gerados após a execução dos testes são armazenados (esta pasta está no `.gitignore`).

- **.gitignore**  
  Ignora a pasta `results/` para não versionar arquivos gerados durante os testes.

---

## Bibliotecas Utilizadas

- [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/) - Automação de testes web via Selenium.
- [FakerLibrary](https://github.com/boakley/robotframework-fakerlibrary) - Geração de dados randômicos para testes.
- [String](https://robotframework.org/robotframework/latest/libraries/String.html) - Manipulação de strings.
- [BuiltIn](https://robotframework.org/robotframework/latest/libraries/BuiltIn.html) - Palavras-chave internas do Robot Framework.

---

## Como Executar os Testes

1. Clone o repositório:

```bash
git clone <url-do-repositorio>
cd <nome-do-repositorio>
```

2. Instale as dependências:

```bash
pip install robotframework
pip install robotframework-seleniumlibrary
pip install robotframework-fakerlibrary
pip install selenium
```

3. Execute os testes (na pasta raiz do projeto):

```bash
robot -d results tests/
```

Isso executará todos os testes da pasta `tests/` e salvará os relatórios na pasta `results/`.

---

## Testes Implementados

- **CT1:** Login bem-sucedido com credenciais válidas.
- **CT2:** Logout após login bem-sucedido.
- **CT3:** Login inválido com validação de mensagem de erro.
- **CT4:** Cadastro de novo funcionário pelo menu PIM.
- **CT5:** Busca do funcionário recém-cadastrado na lista de usuários.

---

## Boas Práticas

- A pasta `results/` está no `.gitignore` para evitar versionamento dos arquivos gerados.
- Uso de keywords customizados para melhor reaproveitamento e organização.
- Geração de dados randômicos para evitar conflitos em testes de cadastro.
- Captura de screenshots em passos chave para facilitar análise de falhas.

---

## Contato

Em caso de dúvidas ou sugestões, entre em contato:  
João Vitor Condidorio - joaovitorluz010@gmail.com