#language: pt

Funcionalidade: Validar cadastro de e-email com o número de telefone de outro pais
    Eu quero iniciar um cadastro de e-mail no Gmail com um usuário fake
    A fim de verificar o retorno de resposta ao colocar o telefone de outro país

    Cenário: Criando usuário Fake
        Dado o sistema "Fake"
        Quando escolho Brasil
        E gero o usuário randômico
        Então salvo as informações necessárias para o cadastro do email

    Cenário: Validando mensagem de aprensentação do Gmail - Brasil
        Dado o sistema "Gmail"
        Quando quando acesso Criar uma Conta
        E preencho corretamente o formulário com as informações obtidas no Fake
        E insiro o número de telefone "11999999999"
        E clico em próximo
        Então o sistema mostra a mensagem "Este número de telefone foi usado muitas vezes."

    Cenário: Validando mensagem de aprensentação do Gmail - País Costa Rica, Telefone 1111
        Dado o sistema "Gmail"
        Quando quando acesso Criar uma Conta
        E preencho corretamente o formulário com as informações obtidas no Fake
        E insiro o número de telefone "+50640404040"
        E clico em próximo
        Então o sistema mostra a mensagem "Ocorreu um problema ao confirmar seu número de telefone."

    Cenário: Validando mensagem de aprensentação do Gmail - Pais Iran, Telefone 919191919191
        Dado o sistema "Gmail"
        Quando quando acesso Criar uma Conta
        E preencho corretamente o formulário com as informações obtidas no Fake
        E insiro o número de telefone "+9890909090"
        E clico em próximo
        Então o sistema mostra a mensagem "Este formato de número de telefone não é válido. Verifique o país e o número."