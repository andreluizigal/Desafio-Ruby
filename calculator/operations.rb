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
        notas.delete(nome)
      end     

      # Fazendo média das notas dos alunos que sobraram
      media = 0
      notas.each do |nome, nota|
        media += nota/(notas.length)
      end
      
      # Retornando valor encontrado
      return media

    end
  
    def no_integers(numbers)
  
    end
  
    def filter_films(genres, year)
      films = get_films

      # Criando um array para guardar os nomes dos filmes filtrados
      filtro = []

      # Criando um boolean para auxiliar a aprovar os filmes no filtro ou não
      correto = true

      # Guardando generos do filtro em um subconjunto
      generos_filtro = Set[]
      genres.each do |genero|
        generos_filtro.add(genero)
      end

      # Para cada filme...
      films[:movies].each do |filme|

        # Guardando generos do filme em um subconjunto
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
    
    private
  
    def get_films
      url = 'https://raw.githubusercontent.com/yegor-sytnyk/movies-list/master/db.json'
      uri = URI(url)
      response = Net::HTTP.get(uri)
      return JSON.parse(response, symbolize_names: true)
    end
  end
end
