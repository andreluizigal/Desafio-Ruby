andre: 10, ana: 8, lucas: 6, pedro: 4, lia: 2, joao: 0

blacklist = "andre"
puts blacklist.class

notas.delete(:"#{blacklist}")

puts notas

