Dado("que o usuário informou os seguintes dados:") do |table|
    @user = table.rows_hash # recuperando o usuario da tabela 
    HTTParty.get("https://marktasks.herokuapp.com/api/reset/#{@user['email']}?clean=full") 
    # recurso para resetar o ambiente
    # antes de cadastrar ele apaga o usuario ja cadastrado
end

Quando("eu faço uma solicitação POST para o serviço user") do
    @result = HTTParty.post(
        'https://marktasks.herokuapp.com/api/user',
        headers: { 'Content-Type' => 'application/json' },
        body: @user.to_json 
    )
    # endpoint -> mandando para essa api
    # informa o tipo de informação que quero mandar
    # converter a hash para JSON
    # salva numa variavel result
end
  
Então("o código de resposta HTTP deve ser igual {string}") do |status_code|
    expect(@result.response.code).to eql status_code #verifica se o status é 200
end
  
Então("no corpo da resposta deve conter o ID do usuário") do
    expect(@result.parsed_response['data']).to have_key('id') # verificando se dentro do obj data tem o id
    #validando o conteudo 
    expect(@result.parsed_response['data']['id'].length).to eql 17 #verificando a quantidade de caracteres
end
  
Então("no corpo da resposta HTTP deve ser igual {string}") do |message|
    expect(@result.parsed_response['message']).to eql message
end