Quando("escolho Brasil") do
    $gerarF.opcaoPais
end
  
Quando("gero o usuário randômico") do
    $gerarF.btnGere
end
  
Então("salvo as informações necessárias para o cadastro do email") do
    $priemiroNome = $gerarF.fistName
    $ultimoNome = $gerarF.lastName
    $email = $gerarF.email
    $senha = $gerarF.password
end

Quando("quando acesso Criar uma Conta") do
    $insereDados.btnCreateAcc
end
  
Quando("preencho corretamente o formulário com as informações obtidas no Fake") do
    within_window -> {page.title == 'Criar sua Conta do Google'} do
        $insereDados.setName($priemiroNome)
        $insereDados.setLName($ultimoNome)
        $insereDados.setEmail($email)
        $insereDados.setPassword($senha)
        $insereDados.setConfPW($senha)

        $insereDados.btnNext
    end
end

Quando("clico em próximo") do
    within_window -> {page.title == 'Criar sua Conta do Google'} do
        $insereDados.btnNext
    end
end

Quando("insiro o número de telefone {string}") do |tell|
    within_window -> {page.title == 'Criar sua Conta do Google'} do
        $insereDados.numberTell(tell)
    end
end


Então("o sistema mostra a mensagem {string}") do |frase|
    within_window -> {page.title == 'Criar sua Conta do Google'} do
        expect($insereDados.textoErroNumero).to have_content frase
    end
end