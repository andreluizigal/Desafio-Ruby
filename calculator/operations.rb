require_relative '../extra_operations'
require 'net/http'
require 'json'

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
