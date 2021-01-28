require_relative 'operations'
require 'io/console' 

module Calculator
  class Menu
    def initialize
      system "cls"
      # Aparecendo texto do Menu
      puts "-" * 27, "| Bem vindo a calculadora |\n", "-" * 27, "Operações:\n\n1. Média preconceituosa\n2. Calculadora sem números\n3. Filtrar filmes\n4. Operação 4\n5. Sair\n\nSua Opção: "
      
      # Entrada da opção
      opcao = gets.chomp.to_i
      
      # Criando objeto da classe Operations
      operations = Operations.new

      case opcao
      when 1
        system "cls"
        puts "Operação 1: Média Preconceituosa"

        # Entrada dos alunos e as respectivas notas
        puts "\nNome dos alunos e notas (Exemplo - nome1: nota1, nome2: nota2 ...):"

        grades = gets.chomp

        # Entrada da Lista Negra
        puts "Nome dos alunos na lista negra (Exemplo - nome1 nome2 ...):"
        blacklist = gets.chomp.split
        
        # Mostrando Média Preconceituosa
        puts "Média Preconceituosa: #{operations.biased_mean(grades, blacklist)}"

        # Voltar ao menu
        puts "Pressione qualquer tecla para continuar"
        STDIN.getch

      when 3
        system "cls"
        puts "Operação 3: Filtrar filmes"

        # Entrada dos gêneros
        puts "Escreva os gêneros que deseja filtrar os filmes (Exemplo - gênero1 gênero2 ...):"
        genres = gets.chomp.split

        # Entrada do ano
        puts "Escreva o ano de lançamento filtrar os filmes (Exemplo - 2021):"
        year = gets.chomp.to_i

        puts "Filmes de #{genres.to_s}, de #{year} até hoje, encontrados:"
        
        nomes = operations.filter_films(genres, year)
        operations.filter_films(genres, year).each do |nome|
          puts nome
        end

        # Voltar ao menu
        puts "Pressione qualquer tecla para continuar"
        STDIN.getch

      when 5
        # Saindo do programa
        system "cls"
        puts "Saindo da calculadora..."
        sleep(2)
        exit       
      else
        system "cls"
        puts "Opção Inválida"
        # Voltar ao menu
        sleep(2)
      end
    end
  end
end

