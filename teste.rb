notas = {andre: 10, ana: 8, lucas: 6, pedro: 4, lia: 2, joao: 0}

blacklist = ["andre", "ana"]

notas.delete(:blacklist[1])

puts notas

puts blacklist