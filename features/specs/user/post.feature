#language:pt

Funcionalidade: Cadastro
    Sendo um aplicação que recebeu dados do usuário
    Posso solicitar uma requisição do tipo POST
    Para que os dados deste usuário sejam de fato cadastrados no sistema

    @cad
    Cenário: Cadastro simplificado

    Dado que o usuário informou os seguintes dados:
        | name     | graziele           |
        | email    | graaziele@teste.io |
        | password | 123456             |
    Quando eu faço uma solicitação POST para o serviço user
    Então o código de resposta HTTP deve ser igual "200"
    E no corpo da resposta deve conter o ID do usuário

    Esquema do Cenário: Campos não enviados

    Dado que o usuário informou os seguintes dados:
        | name     | <name>     |
        | email    | <email>    |
        | password | <password> |
    Quando eu faço uma solicitação POST para o serviço user
    Então o código de resposta HTTP deve ser igual "<status_code>"
    E no corpo da resposta HTTP deve ser igual "<message>"

    Exemplos:
        | name     | email              | password | status_code | message               |
        |          | graaziele@teste.io | 123456   | 409         | Name is required.     |
        | Graziele |                    | 123456   | 409         | Email is required.    |
        | Graziele | graaziele@teste.io |          | 409         | Password is required. |  