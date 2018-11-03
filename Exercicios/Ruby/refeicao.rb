class Refeicao
    @@erro = "666"

    def initialize(prato)
        @prato = prato
        @descricao = "error 404 - not found"
        @dispo = true

        setPrato(prato)
    end

    def setPrato(prato)
        case prato
        when "macarrao"
            @tipo = "massa"
            @descricao = "delicia"
            @preco = 10.00

        when "lasanha"
            @tipo = "massa"
            @descricao = "fantastico"
            @preco = 15.00

        when "sopa de ervilhas"
            @tipo = "sopa"
            @descricao = "5/7"
            @preco = 8.00

        when "frango do RU"
            @tipo = "frio"
            @descricao = "voce esta certo disso?"
            @preco = 5.20

        when "file miau"
            @tipo = "frio"
            @descricao = "nos temos pratos melhores no menu, senhor..."
            @preco = 3.50

        else
            @tipo = @@erro
        end
    end

    def setDisponibilidade()
        if @dispo
            @dispo = false
        else
            @dispo = true
        end
    end

    def getDisponibilidade()
        if @dispo
            puts "Disponivel"
        else
            puts "Indisponivel"
        end
    end

    def getDescricao()
        puts @descricao
    end

    def getPreco()
        sprintf("%.2f", @preco)     #NOT WORKING
    end

    def getTipo()
        puts @tipo
    end

end

mac = Refeicao.new("macarrao")
las = Refeicao.new("lasanha")
fil = Refeicao.new("file miau")
fra = Refeicao.new("frango do RU")
err = Refeicao.new("coc au vin")

mac.getDescricao
las.setDisponibilidade
las.getDisponibilidade
fil.getDescricao
fra.getPreco
err.getTipo