require_relative 'operations'

module Calculator
  class Menu
    def initialize
      # Aparecendo texto do Menu
      puts "-" * 27, "| Bem vindo a calculadora |\n", "-" * 27, "Operações:\n\n1. Média Preconceituosa 1\n2. Operação 2\n3. Sair\n\nSua Opção: "
      
      # Entrada da opção
      opcao = gets.chomp.to_i
      
      # Criando objeto da classe Operations
      operations = Operations.new

      case opcao
      when 1
        system "clear"
        puts "Operação 1: Média Preconceituosa"

        # Entrada dos alunos e as respectivas notas
        puts "Nome dos alunos e notas 'nome1: nota1, nome2: nota2 ...' (sem áspas): "

        grades = gets.chomp

        # Entrada da Lista Negra
        puts "Nome dos alunos na lista negra 'nome1 nome2 ...' (sem áspas): "
        blacklist = gets.chomp.split
        
        # Mostrando Média Preconceituosa
        puts "Média Preconceituosa: #{operations.biased_mean(grades, blacklist)}"


      when 2
      
      when 3
        
      else
        puts "Opção Inválida"
      end

    end
  end
end

