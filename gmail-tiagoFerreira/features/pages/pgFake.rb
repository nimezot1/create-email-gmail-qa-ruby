class PgCriarFake
    include Capybara::DSL

    def opcaoPais
        brasil =select("Brazil", :from => "n")
        return brasil
    end

    def btnGere
        click_button "Generate"
    end
    def getName
        nome = find(".address h3").text
        return nome
    end

    def getEmail
        email = find(:xpath, "/html/body/div[2]/div/div/div[1]/div/div[3]/div[2]/div[2]/div/div[2]/dl[9]/dd").text
        return email
    end

    def getSenha
        senha = find(:xpath, "/html/body/div[2]/div/div/div[1]/div/div[3]/div[2]/div[2]/div/div[2]/dl[11]/dd").text
        return senha
    end

    def fistName
        fName = getName.split(" ")
        fName = fName[0]
        return fName
    end

    def lastName
        lName = getName.split(" ")
        lName1 = lName[1]
        lName2 = lName[2]
        lName = lName1 + " " + lName2
        return lName
    end

    def email
        nEmail = getEmail.split("@")
        nEmail = nEmail[0] + "1709"
        return nEmail
    end

    def password
        senha = getSenha.split(" ")
        senha = senha[0]
        return senha
    end
end
