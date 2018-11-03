require 'bigdecimal'    # Requerimento da classe BigDecimal para lidar melhor com valores monetarios

class Refeicao
    @@numPratos = 0         # Inicializa uma variavel para o numero total de pratos instanciados
    @@total = BigDecimal(0) # Inicializa uma variavel para o preco total de itens instanciados
    @@erro = "666"          # Inicializa uma variavel para indicar erros

    # ---------- Metodo de inicializacao da classe ----------
    def initialize(prato)
        @prato = prato                          # O atributo eh inicializado com o nome recebido
        @descricao = "error 404 - not found"    # Inicializacao de uma descricao padrao
        @dispo = true                           # Inicializacao da disponibilidade

        setPrato(prato)                         # Chama o metodo para definir os demais atributos

        if ( (@tipo != @@erro) && @dispo )      # Verifica se nao houve uma chamada com nome errado e a disponibilidade
            @@numPratos += 1                    # Incrementa o contador de numero de pratos
            @@total += @preco                   # Incrementa o valor de todas as refeicoes vendidas
        end

    end

    # ---------- Metodo setPrato ----------
    def setPrato(prato) # Define os atributos 'tipo', 'descricao' e 'preco' de acordo com os pratos registrados
        case prato          # switch/case para definir os atributos do prato

        when "macarrao"                     # Prato de macarrao
            @tipo = "massa"                 # Tipo do prato: massa
            @descricao = "delicia"          # Descricao do prato
            @preco = BigDecimal(10.00, 2)   # Preco do prato e numero de casas decimais a serem consideradas (2)

        when "lasanha"                      # Prato de lasanha
            @tipo = "massa"                 # Tipo do prato: massa
            @descricao = "fantastico"       # Descricao do prato
            @preco = BigDecimal(15.00, 2)   # Preco do prato

        when "sopa de ervilhas"             # Prato de sopa de ervilhas
            @tipo = "sopa"                  # Tipo do prato: sopa
            @descricao = "5/7"              # Descricao do prato
            @preco = BigDecimal(8.00, 2)    # Preco do prato

        when "frango do RU"                         # Prato de pombo assado
            @tipo = "frio"                          # Tipo do prato: fria
            @descricao = "voce esta certo disso?"   # Descricao do prato
            @preco = BigDecimal(5.20, 2)            # Preco do prato (valor real: nao tem preco ;)

        when "file miau"                                                # Prato: espetinho de file miau
            @tipo = "frio"                                              # Tipo do prato: fria
            @descricao = "nos temos pratos melhores no menu, senhor..." # Descricao do prato
            @preco = BigDecimal(3.49, 2)                                # Preco sugerido do prato

        else                # Caso geral, caso nao caia em nenhum outro
            @tipo = @@erro  # Retorna o valor de erro para o tipo do prato
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

    def setDescricao(new_descricao)
        @descricao = new_descricao
    end

    def getPreco()
        puts "R$ %0.2f" % [@preco]
    end

    def setPreco(new_preco)
        @preco = BigDecimal(new_preco, 2)
    end

    def getTipo()
        puts @tipo
    end

    def setTipo(new_tipo)
        @tipo = new_tipo
    end

    def getNum
        puts @@numPratos
    end

    def getTotal
        puts "R$ %0.2f" % [@@total]
    end

end

mac = Refeicao.new("macarrao")
mac.getTotal
las = Refeicao.new("lasanha")
las.getTotal
fil = Refeicao.new("file miau")
fil.getTotal
fra = Refeicao.new("frango do RU")
fra.getTotal
err = Refeicao.new("coc au vin")
err.getTotal

mac.getDescricao
las.setDisponibilidade
las.getDisponibilidade
fil.getDescricao
fra.setPreco(2.5)
fra.getPreco
err.getDescricao