require_relative '../extra_operations'
require 'net/http'
require 'json'
require 'set'

module Calculator
  class Operations
    include ExtraOperations
  
    def biased_mean(grades, blacklist)
      
      # Transformando grades em hash
      notas = eval("{#{grades}}")
      
      # Deletando nomes da Lista Negra
      blacklist.each do |nome|
        notas.delete(:"#{nome}")
      end  

      # Fazendo média das notas dos alunos que sobraram
      media = 0.0
      notas.each do |nome, nota|
        media += (nota.to_f/notas.length)
      end

      # Retornando valor encontrado
      return media

    end
  
    def no_integers(numbers)

      # Criando um vetor para armazenar se é divisível ou não
      divisivel = []
      
      # Criando boolean auxiliar a dizer se o número é ou não divisível por 25
      sim = false

      # Verificando cada número
      numbers.each do |numero|
        
        # Caso o número tenha 2 ou mais algarismos (caso não tenha, automaticamente não é divisível)
        if numero.length >= 2

          # Guardando em uma unica String os dois últimos algarismos do número
          ultimos = numero[-2] + numero[-1]

          # Verificando se os dois últimos algarismos são 00 ou 25 ou 50 ou 75 (divisível por 25)
          if ultimos == "00" || ultimos == "25" || ultimos == "50" || ultimos == "75"
            sim = true
          end
        
        # Verificando se o número é 0
        else 
          if numero[0] == "0"
            sim = true
          end
        end

        # Adicionando S caso seja divisível ou N caso não ao vetor
        if sim
          divisivel.push("S")

        else
          divisivel.push("N")
        end

        # Resetando auxiliar para próximo número
        sim = false
      end
      
      # Retornando vetor com os resultados
      return divisivel
    end
  
    def filter_films(genres, year)
      films = get_films

      # Criando um array para guardar os nomes dos filmes filtrados
      filtro = []

      # Criando um boolean para auxiliar a aprovar os filmes no filtro ou não
      correto = true

      # Guardando generos do filtro em um conjunto
      generos_filtro = Set[]
      genres.each do |genero|
        generos_filtro.add(genero)
      end

      # Para cada filme...
      films[:movies].each do |filme|

        # Guardando generos do filme em um conjunto
        generos_filme = Set[]
        filme[:genres].each do |generof|
          generos_filme.add(generof)
        end

        # Verificando se o conjunto dos gêneros do filtro é subconjunto do conjunto dos gêneros do filme
        unless generos_filtro.subset?(generos_filme)
          correto = false
        end
        
        # Verificando se o ano é antes do do filtro
        if filme[:year].to_i < year
          correto = false
        end

        # Adicionando o nome do filme ao array caso esteja nos conformes do filtro
        if correto
          filtro.push(filme[:title])
        end

        # Resetando para analisar o próximo filme
        correto = true
      end
      
      # Retornando array com nomes dos filmes filtrados
      return filtro
    end
    
    def inverte(palavras)

      return contrario(palavras)
    end
    
    private
  
    def get_films
      url = 'https://raw.githubusercontent.com/yegor-sytnyk/movies-list/master/db.json'
      uri = URI(url)
      response = Net::HTTP.get(uri)
      return JSON.parse(response, symbolize_names: true)
    end
  end
end
