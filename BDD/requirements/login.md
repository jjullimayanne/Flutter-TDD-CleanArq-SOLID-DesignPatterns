####Feature Login:
- ##### Como cliente:
    - Quero poder acessar minha conta e me manter logado para que eu possa ver e responder enquetes de forma rápida. 
- ##### Cenário: Credenciais válidas:
     - Dado que o cliente informou credenciais válidas 
     - Quando solicitar para fazer login
     - Então o sistema deve enviar o usuário para a tela de pesquisas e manter o usuário conectado.

- ##### Cenário: Credenciais válidas:
   - Dado que o cliente informou credenciais inválidas.
   - Quando solicitar para fazer login
   - Entao o sistema. deve retornar uma mensagem de erro. 