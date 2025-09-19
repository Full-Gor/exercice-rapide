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

#__________________________
# VERSION JAVASCRIPT (pour comparaison)
# calculatrice.js

console.log("=== CALCULATRICE SIMPLE ===");
console.log("");

// Demander les nombres
console.log("Entrez le premier nombre :");
const nombre1 = parseFloat(prompt("Premier nombre"));

console.log("Entrez le deuxième nombre :");
const nombre2 = parseFloat(prompt("Deuxième nombre"));

console.log("");
console.log("=== RESULTATS ===");

// Calculs directs - pas de if !
const addition = nombre1 + nombre2;
const soustraction = nombre1 - nombre2;
const multiplication = nombre1 * nombre2;
const division = nombre1 / nombre2;

console.log(`${nombre1} + ${nombre2} = ${addition}`);
console.log(`${nombre1} - ${nombre2} = ${soustraction}`);
console.log(`${nombre1} * ${nombre2} = ${multiplication}`);
console.log(`${nombre1} / ${nombre2} = ${division}`);

console.log("");
console.log("Merci d'avoir utilisé la calculatrice !");

