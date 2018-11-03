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

    # ---------- Metodo setDisponibilidade ----------
    def setDisponibilidade  # Altera a disponibilidade do prato
        if @dispo           # Se o prato esta inicialmente disponivel (true), define como indisponivel (false)
            @dispo = false
        else                # Caso contrario, define o prato como disponivel
            @dispo = true
        end
    end

    # ---------- Metodo getDisponibilidade ----------
    def getDisponibilidade  # Retorna a disponibilidade do prato de acordo com os parametros acima
        if @dispo           # dispo == true, prato disponivel
            "Disponivel"
        else                # dispo == false, indisponivel
            "Indisponivel"
        end
    end

    # ---------- Metodo getDescricao ----------
    def getDescricao    # Retorna a descricao do prato
        @descricao
    end

    # ---------- Metodo setDescricao ----------
    def setDescricao(new_descricao) # Atribui uma nova descricao ao prato
        @descricao = new_descricao
    end

    # ---------- Metodo getPreco ----------
    def getPreco    # Retorna o preco do prato
        "R$ %0.2f" % [@preco]
    end

    # ---------- Metodo setPreco ----------
    def setPreco(new_preco) # Atribui um novo preco ao prato
        @preco = BigDecimal(new_preco, 2)
    end

    # ---------- Metodo getTipo ----------
    def getTipo()   # Retorna o tipo do prato
        @tipo
    end

    # ---------- Metodo setTipo ----------
    def setTipo(new_tipo)   # Atribui um novo tipo ao prato
        @tipo = new_tipo
    end

    # ---------- Metodo getNum ----------
    def getNum  # Retorna o numero de vezes que a classe foi instanciada (numero de pratos vendidos)
        @@numPratos
    end

    # ---------- Metodo getTotal ----------
    def getTotal    # Retorna o montante de todas as refeicoes vendidas
        "R$ %0.2f" % [@@total]
    end

end