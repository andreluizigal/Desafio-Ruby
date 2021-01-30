require_relative 'operations'
require 'io/console' 

module Calculator
  class Menu
    def initialize
      system "cls"
      # Aparecendo texto do Menu
      puts "-" * 27, "| Bem vindo a calculadora |\n", "-" * 27, "Operações:\n\n1. Média preconceituosa\n2. Calculadora sem números\n3. Filtrar filmes\n4. Inverter palavras\n5. Sair\n\nSua Opção: "
      
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
        puts "\nNome dos alunos na lista negra (Exemplo - nome1 nome2 ...):"
        blacklist = gets.chomp.split

        # Mostrando Média Preconceituosa
        puts "\nMédia Preconceituosa: #{operations.biased_mean(grades, blacklist).round(2)}"

        # Voltar ao menu
        puts "\nPressione qualquer tecla para continuar"
        STDIN.getch

      when 2
        system "cls"
        puts "Operação 2: Calcularoda sem números"

        # Entrada dos números
        puts "\nDigite os números (Exemplo - num1 num2 ...):"

        numbers = gets.chomp.split

        # Mostrando se cada número é divisível por 25 ou não
        puts "\nDivisíveis por 25: #{operations.no_integers(numbers)}"

        # Voltar ao menu
        puts "\nPressione qualquer tecla para continuar"
        STDIN.getch

      when 3
        system "cls"
        puts "Operação 3: Filtrar filmes"

        # Entrada dos gêneros
        puts "\nEscreva os gêneros que deseja filtrar os filmes (Exemplo - gênero1 gênero2 ...):"
        genres = gets.chomp.split

        # Entrada do ano
        puts "\nEscreva o ano de lançamento filtrar os filmes (Exemplo - 2021):"
        year = gets.chomp.to_i

        # Exibindo resultado
        puts "\nFilmes de #{genres}, de #{year} até hoje, encontrados:", "\n", operations.filter_films(genres, year)

        # Voltar ao menu
        puts "\nPressione qualquer tecla para continuar"
        STDIN.getch

      when 4
        system "cls"
        
        # Operação que recebe palavras e retorna elas invertidas
        # Entrada das palavras
        puts "Escreva palavras para serem invertidas (Exemplo - palavra1 palavra2 ...):"
        palavras = gets.chomp.split

        # Exibindo resultado
        puts "\nPalavras invertidas:", operations.inverte(palavras)
        
        # Voltar ao menu
        puts "\nPressione qualquer tecla para continuar"
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

