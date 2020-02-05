Dado("o sistema {string}") do |sistema|
    if sistema == "Fake"
        visit "https://www.fakenamegenerator.com/"
    elsif sistema == "Gmail"
        visit "https://www.google.com/intl/pt/gmail/about/#"
    end 
end


# PROCURA PELO TÍTULO DA PÁGINA E VERIFICA SE O QUE ACESSOU É O ESPERADO
# Quando("estou na página {string}") do |confirmaPagina|
#     titulo = find("#supt_tx2")
#     expect(titulo.text).to have_content confirmaPagina
# end