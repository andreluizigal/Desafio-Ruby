module ExtraOperations
    def contrario(palavras)

        # Criando vetor para armazenar palavras invertidas
        invertidas = []
        
        # Para cada palavra
        palavras.each do |palavra|
            inverso = ""

            # Percorrendo palavra de trás para frente e criando palavra invertida
            i = (palavra.length - 1).to_i
            while i >= 0
                inverso += palavra[i]
                i -= 1
            end
        
            # Adicionando palavra invertida ao vetor
            invertidas.push(inverso)
        end

        # Retornando vetor com palavras invertidas
        return invertidas

    end
end
