# 📦 Instalação e Dependências

Este projeto utiliza o **Robot Framework** para automação de testes Web (com Selenium) e API (com Requests).  
Abaixo estão listadas todas as dependências necessárias para configurar e executar o projeto localmente.

---

## ✅ Requisitos do Ambiente

- **Python**: `3.13.3`  
  [🔗 Download Python](https://www.python.org/downloads/release/python-3133/)

- **Google Chrome**: instalado na máquina  
  > Versão usada nos testes: `136.0.198.0`

- **ChromeDriver**: `136.0.7103.113`  
  [🔗 Baixar ChromeDriver (Chrome for Testing)](https://googlechromelabs.github.io/chrome-for-testing/)  
  O executável `chromedriver.exe` deve estar em uma pasta incluída na variável de ambiente `PATH`  
  (ex: dentro da pasta `Scripts` do Python).

---

## 📦 Instalação das Dependências

Instale as bibliotecas com os comandos abaixo:

```bash
# Instala ou atualiza o Robot Framework
pip install -U robotframework

# Instala ou atualiza a biblioteca para testes Web
pip install -U robotframework-seleniumlibrary

# Instala ou atualiza a biblioteca para testes de API REST
pip install -U robotframework-requests
