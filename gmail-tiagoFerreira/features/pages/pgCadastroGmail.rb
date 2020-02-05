class CadastroEmail
    include Capybara::DSL
    def btnCreateAcc
        first('[ga-event-action="create account"]').click
    end

    def setName(fName)
        fill_in "firstName", with: fName
    end

    def setLName(lName)
        fill_in "lastName", with: lName
    end

    def setEmail(email)
        fill_in "username", with: email
    end

    def setPassword(password)
        fill_in "Passwd", with: password
    end

    def setConfPW(confpw)
        fill_in "ConfirmPasswd", with: confpw
    end

    def btnNext
        find(".RveJvd").click
    end

    def numberTell(tell)
        fill_in "phoneNumberId", with: tell
    end

    def textoErroNumero
        find('[jsname="B34EJ"]').text
    end
end