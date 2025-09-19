# Calculatrice ultra simple - pas de if !
puts "=== CALCULATRICE SIMPLE ==="
puts ""

# Demander les nombres
puts "Entrez le premier nombre :"
nombre1 = gets.chomp.to_f

puts "Entrez le deuxième nombre :"
nombre2 = gets.chomp.to_f

puts ""
puts "=== RESULTATS ==="

# Calculs directs - pas de if !
addition = nombre1 + nombre2
soustraction = nombre1 - nombre2
multiplication = nombre1 * nombre2
division = nombre1 / nombre2

puts "#{nombre1} + #{nombre2} = #{addition}"
puts "#{nombre1} - #{nombre2} = #{soustraction}"
puts "#{nombre1} * #{nombre2} = #{multiplication}"
puts "#{nombre1} / #{nombre2} = #{division}"

puts ""
puts "Merci d'avoir utilisé la calculatrice !"

puts'

