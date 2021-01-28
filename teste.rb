hash = {'andre' => 10, 'marcelo' => 8, 'ana' => 6}

a = ["andre"]

a.each do |nome|
    hash.delete(nome)
end

puts hash

media = 0
hash.each do |key, value|
    media += value/(hash.length)
end

puts media
