require 'set'
filtro = [1]
filme = [1, 2]

generos_filme = Set[]
filme.each do |generof|
  generos_filme.add(generof)
end

generos_filtro = Set[]
filtro.each do |gener|
  generos_filtro.add(gener)
end

generos_filtro.subset(generos_filme)?