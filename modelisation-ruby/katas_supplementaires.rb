# ========================================
# KATAS SUPPLÉMENTAIRES POUR RÉVISER
# ========================================

puts "=== KATAS SUPPLÉMENTAIRES RUBY ==="

# ========================================
# KATA 1: GESTION D'UN BLOG
# Fonctionnalités: Classes, attr_accessor, initialize, méthodes d'instance, string interpolation
# ========================================
puts "\n--- Kata 1: Blog Simple (Classes, attr_accessor, méthodes) ---"

# ========================================
# EXPLICATION SIMPLE : QU'EST-CE QU'UNE CLASSE ?
# ========================================
# Une classe, c'est comme un modèle ou un plan pour créer des objets.
# Exemple concret :
# - Le plan d'une voiture = classe "Voiture"
# - Une voiture rouge = objet créé à partir de ce plan
#
# Qu'est-ce qu'un "objet" ?
# Un objet, c'est quelque chose de concret créé à partir d'un plan.
# Exemple concret :
# - Le plan "Voiture" = classe
# - Ma voiture rouge = objet
# - La voiture de mon voisin = autre objet
# ========================================

class BlogPost  # 1. C'est quoi ? Un plan pour créer des articles de blog
                # Pourquoi ? Pour dire "un article de blog a toujours un titre, un contenu, un auteur"
  attr_accessor :title, :content, :author, :published  # 2. C'est quoi ? Une façon de dire "chaque article aura ces 4 informations"
                                                       # Pourquoi ? Pour pouvoir lire et modifier ces informations facilement
  
  def initialize(title, content, author)  # 3. C'est quoi ? Ce qui se passe quand on crée un nouvel article
                                         # Pourquoi ? Pour donner les informations de base à l'article
    @title = title        # 4. C'est quoi ? Garder le titre dans l'article
                          # Pourquoi ? Pour pouvoir le retrouver plus tard
    @content = content    # = assigner une valeur
    @author = author      # @author = qui a écrit l'article
    @published = false    # 5. C'est quoi ? Dire que l'article n'est pas encore publié
                          # Pourquoi ? Pour savoir si on peut le voir ou pas
  end
  
  def publish!  # 6. C'est quoi ? Une action pour publier l'article
                # Pourquoi ? Pour changer l'article de "non publié" à "publié"
    @published = true     # true = valeur booléenne (maintenant publié)
    puts "Article '#{@title}' publié !"  # puts = afficher, #{} = interpolation (mélanger texte et variable)
  end
  
  def word_count  # 7. C'est quoi ? Compter combien de mots il y a dans l'article
                  # Pourquoi ? Pour savoir si l'article est long ou court
    @content.split.length  # split = diviser le texte en mots, length = compter
  end
end

# ========================================
# COMMENT ÇA MARCHE EN PRATIQUE :
# ========================================
# 1. On crée un plan (classe BlogPost)
# 2. On dit ce qu'il contient (titre, contenu, auteur, publié ou pas)
# 3. On dit ce qui se passe à la création (initialize)
# 4. On dit ce qu'on peut faire avec (publier, compter les mots)
# 5. On crée des articles (post1, post2)
# 6. On utilise les articles (publier, compter)
#
# C'est comme avoir un formulaire pour créer des articles, 
# avec des cases à remplir et des boutons pour faire des actions !
# ========================================

# Créer des articles
post1 = BlogPost.new("Ruby Basics", "Ruby est un langage puissant", "Alice")  # .new = créer un nouvel objet
post2 = BlogPost.new("Rails Guide", "Rails facilite le développement web", "Bob")  # post1, post2 = variables qui stockent les objets

# Publier et afficher
post1.publish!  # .publish! = appeler la méthode publish! sur l'objet post1
puts "Mots dans l'article: #{post1.word_count}"  # .word_count = appeler la méthode word_count, #{} = interpolation

# ========================================
# KATA 2: CALCULATRICE AVANCÉE
# Fonctionnalités: Méthodes de classe, opérateurs mathématiques, return implicite
# ========================================
puts "\n--- Kata 2: Calculatrice (Méthodes de classe, opérateurs) ---"

class Calculator  # class = créer une nouvelle classe (modèle d'objet)
  def self.add(a, b)  # def = définir une méthode, self = méthode de classe (pas besoin de créer un objet)
    a + b  # + = additionner deux nombres
  end
  
  def self.multiply(a, b)  # self = méthode de classe, multiply = multiplier
    a * b  # * = multiplier deux nombres
  end
  
  def self.divide(a, b)  # divide = diviser
    return "Division par zéro !" if b == 0  # return = arrêter et donner ce résultat, if = si
    a.to_f / b  # to_f = convertir en nombre décimal, / = diviser
  end
end

puts "Addition: #{Calculator.add(5, 3)}"  # puts = afficher, #{} = interpolation, Calculator.add = appeler la méthode add
puts "Multiplication: #{Calculator.multiply(4, 7)}"  # Calculator.multiply = appeler la méthode multiply
puts "Division: #{Calculator.divide(10, 2)}"  # Calculator.divide = appeler la méthode divide
puts "Division par zéro: #{Calculator.divide(10, 0)}"  # Tester la division par zéro

# ========================================
# KATA 3: GESTION DE STOCK
# Fonctionnalités: Classes, attr_accessor, méthodes avec ?, calculs, conditions
# ========================================
puts "\n--- Kata 3: Stock (Classes, méthodes ?, calculs) ---"

# ========================================
# EXPLICATION SIMPLE : GESTION DE STOCK
# ========================================
# Un stock, c'est comme un magasin avec des produits.
# Chaque produit a : un nom, un prix, et une quantité en stock.
# Exemple concret :
# - Produit "Laptop" = 999.99€, quantité = 5
# - Produit "Souris" = 25.50€, quantité = 20
# - Produit "Clavier" = 75.00€, quantité = 0 (rupture)
#
# Dans notre code :
# 1. class Product = Un plan pour créer des produits
# 2. attr_accessor = Les informations que chaque produit aura
# 3. def initialize = Ce qui se passe quand on crée un produit
# 4. def total_value = Calculer la valeur totale du stock
# 5. def in_stock? = Vérifier s'il y en a en stock
# ========================================

class Product  # 1. C'est quoi ? Un plan pour créer des produits
               # Pourquoi ? Pour dire "un produit a toujours un nom, un prix, une quantité"
  attr_accessor :name, :price, :quantity  # 2. C'est quoi ? Les informations que chaque produit aura
                                          # Pourquoi ? Pour pouvoir lire et modifier ces informations facilement
  
  def initialize(name, price, quantity = 0)  # 3. C'est quoi ? Ce qui se passe quand on crée un produit
                                            # Pourquoi ? Pour donner les informations de base au produit
    @name = name      # 4. C'est quoi ? Garder le nom du produit
                      # Pourquoi ? Pour pouvoir l'identifier
    @price = price    # 5. C'est quoi ? Garder le prix du produit
                      # Pourquoi ? Pour savoir combien il coûte
    @quantity = quantity  # 6. C'est quoi ? Garder la quantité en stock
                          # Pourquoi ? Pour savoir combien on en a
  end
  
  def total_value  # 7. C'est quoi ? Calculer la valeur totale du stock
                   # Pourquoi ? Pour savoir combien vaut tout le stock
    @price * @quantity  # * = multiplier prix par quantité
  end
  
  def in_stock?  # 8. C'est quoi ? Vérifier s'il y en a en stock
                 # Pourquoi ? Pour savoir si on peut le vendre
    @quantity > 0  # > = plus grand que, 0 = zéro
  end
end

# ========================================
# COMMENT ÇA MARCHE EN PRATIQUE :
# ========================================
# 1. On crée un plan (classe Product)
# 2. On dit ce qu'il contient (nom, prix, quantité)
# 3. On dit ce qui se passe à la création (initialize)
# 4. On dit ce qu'on peut faire avec (calculer valeur, vérifier stock)
# 5. On crée des produits (laptop, souris, clavier)
# 6. On utilise les produits (afficher stock, calculer valeurs)
#
# C'est comme avoir un inventaire de magasin, 
# avec des produits et leurs informations !
# ========================================

# Créer des produits
products = [  # [ = créer un tableau (liste) de produits
  Product.new("Laptop", 999.99, 5),    # Product.new = créer un nouveau produit
  Product.new("Souris", 25.50, 20),    # "Laptop" = nom, 999.99 = prix, 5 = quantité
  Product.new("Clavier", 75.00, 0)     # 0 = pas en stock
]

# Afficher le stock
products.each do |product|  # each = pour chaque produit dans la liste, do = faire
  status = product.in_stock? ? "En stock" : "Rupture"  # ? : = si oui alors "En stock" sinon "Rupture"
  puts "#{product.name}: #{product.quantity} (#{status})"  # puts = afficher, #{} = interpolation
end

# ========================================
# KATA 4: FILTRAGE ET TRANSFORMATION
# Fonctionnalités: Arrays, select, map, blocks, chaînage de méthodes
# ========================================
puts "\n--- Kata 4: Filtrage (Arrays, select, map, blocks) ---"

# ========================================
# EXPLICATION SIMPLE : FILTRAGE ET TRANSFORMATION
# ========================================
# Le filtrage, c'est comme trier des objets selon des critères.
# La transformation, c'est comme modifier des objets.
# Exemple concret :
# - Liste de nombres : [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# - Filtrer les pairs : [2, 4, 6, 8, 10] (garder seulement les pairs)
# - Transformer en carrés : [1, 9, 25, 49, 81] (multiplier par eux-mêmes)
#
# Dans notre code :
# 1. numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] = Une liste de nombres
# 2. select = Filtrer (garder seulement ceux qui respectent une condition)
# 3. map = Transformer (modifier chaque élément)
# 4. { |n| n.even? } = Block (règle à appliquer)
# ========================================

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]  # 1. C'est quoi ? Une liste de nombres de 1 à 10
                                           # Pourquoi ? Pour avoir des données à filtrer et transformer

# Nombres pairs
evens = numbers.select { |n| n.even? }  # 2. C'est quoi ? Filtrer pour garder seulement les nombres pairs
                                        # Pourquoi ? Pour séparer les pairs des impairs
                                        # Comment ? select = filtrer, { |n| n.even? } = règle "est-ce pair ?"
puts "Pairs: #{evens}"  # 3. C'est quoi ? Afficher le résultat
                        # Pourquoi ? Pour voir quels nombres sont pairs

# Carrés des nombres impairs
odd_squares = numbers.select { |n| n.odd? }.map { |n| n * n }  # 4. C'est quoi ? Filtrer les impairs PUIS les transformer en carrés
                                                               # Pourquoi ? Pour avoir les carrés des nombres impairs seulement
                                                               # Comment ? select = filtrer impairs, map = transformer en carrés
puts "Carrés des impairs: #{odd_squares}"  # 5. C'est quoi ? Afficher le résultat
                                           # Pourquoi ? Pour voir les carrés des nombres impairs

# ========================================
# COMMENT ÇA MARCHE EN PRATIQUE :
# ========================================
# 1. On a une liste de nombres [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# 2. On filtre avec select pour garder seulement les pairs [2, 4, 6, 8, 10]
# 3. On filtre avec select pour garder seulement les impairs [1, 3, 5, 7, 9]
# 4. On transforme avec map pour calculer les carrés [1, 9, 25, 49, 81]
# 5. On affiche les résultats
#
# C'est comme trier des objets dans des boîtes différentes,
# puis les modifier selon nos besoins !
# ========================================

# ========================================
# KATA 5: GESTION D'ÉTUDIANTS
# Fonctionnalités: Classes, arrays, méthodes avec ?, calculs de moyenne, conditions
# ========================================
puts "\n--- Kata 5: Étudiants (Classes, arrays, calculs, conditions) ---"

class Student
  attr_accessor :name, :grades
  
  def initialize(name)
    @name = name
    @grades = []
  end
  
  def add_grade(grade)
    @grades << grade
  end
  
  def average_grade
    return 0 if @grades.empty?
    @grades.sum.to_f / @grades.length
  end
  
  def passed?
    average_grade >= 10
  end
end

# Créer des étudiants
student1 = Student.new("Alice")
student1.add_grade(15)
student1.add_grade(12)
student1.add_grade(18)

student2 = Student.new("Bob")
student2.add_grade(8)
student2.add_grade(9)
student2.add_grade(7)

# Afficher les résultats
[student1, student2].each do |student|
  status = student.passed? ? "Réussi" : "Échec"
  puts "#{student.name}: #{student.average_grade.round(2)} (#{status})"
end

# ========================================
# KATA 6: MANIPULATION DE TEXTE
# Fonctionnalités: Méthodes, strings, split, join, map, capitalize
# ========================================
puts "\n--- Kata 6: Texte (Méthodes, strings, split, join) ---"

def count_words(text)
  text.split.length
end

def reverse_words(text)
  text.split.reverse.join(" ")
end

def capitalize_sentences(text)
  text.split(". ").map(&:capitalize).join(". ")
end

text = "hello world. this is a test. ruby is great."
puts "Mots: #{count_words(text)}"
puts "Inversé: #{reverse_words(text)}"
puts "Capitalisé: #{capitalize_sentences(text)}"

# ========================================
# KATA 7: GESTION D'ÉVÉNEMENTS
# Fonctionnalités: Classes, arrays, méthodes avec ?, string interpolation, conditions
# ========================================
puts "\n--- Kata 7: Événements (Classes, arrays, méthodes ?, interpolation) ---"

class Event
  attr_accessor :name, :date, :attendees
  
  def initialize(name, date)
    @name = name
    @date = date
    @attendees = []
  end
  
  def add_attendee(name)
    @attendees << name
  end
  
  def full?
    @attendees.length >= 10
  end
  
  def info
    "Événement: #{@name} le #{@date} (#{@attendees.length} participants)"
  end
end

event = Event.new("Conférence Ruby", "2024-01-15")
event.add_attendee("Alice")
event.add_attendee("Bob")
event.add_attendee("Charlie")

puts event.info
puts "Complet: #{event.full?}"

# ========================================
# KATA 8: CALCULS MATHÉMATIQUES
# Fonctionnalités: Récursion, conditions, opérateurs mathématiques, ranges, none?
# ========================================
puts "\n--- Kata 8: Math (Récursion, conditions, opérateurs, ranges) ---"

def fibonacci(n)
  return n if n <= 1
  fibonacci(n - 1) + fibonacci(n - 2)
end

def factorial(n)
  return 1 if n <= 1
  n * factorial(n - 1)
end

def prime?(n)
  return false if n < 2
  (2..Math.sqrt(n)).none? { |i| n % i == 0 }
end

puts "Fibonacci(5): #{fibonacci(5)}"
puts "Factorielle(5): #{factorial(5)}"
puts "7 est premier: #{prime?(7)}"
puts "8 est premier: #{prime?(8)}"

# ========================================
# KATA 9: GESTION DE FICHIERS
# Fonctionnalités: File.write, File.read, File.exist?, conditions, string interpolation
# ========================================
puts "\n--- Kata 9: Fichiers (File.write, File.read, File.exist?) ---"

def create_file(filename, content)
  File.write(filename, content)
  puts "Fichier '#{filename}' créé"
end

def read_file(filename)
  return "Fichier inexistant" unless File.exist?(filename)
  File.read(filename)
end

# Créer un fichier
create_file("test.txt", "Contenu de test\nLigne 2\nLigne 3")

# Lire le fichier
content = read_file("test.txt")
puts "Contenu: #{content}"

# ========================================
# KATA 10: GESTION D'ERREURS
# Fonctionnalités: begin/rescue/end, exceptions, conditions, string interpolation
# ========================================
puts "\n--- Kata 10: Gestion d'erreurs (begin/rescue, exceptions) ---"

def safe_divide(a, b)
  begin
    a / b
  rescue ZeroDivisionError
    "Erreur: Division par zéro"
  rescue => e
    "Erreur: #{e.message}"
  end
end

def validate_email(email)
  raise "Email vide" if email.nil? || email.empty?
  raise "Email invalide" unless email.include?("@")
  "Email valide: #{email}"
end

puts "Division sûre: #{safe_divide(10, 2)}"
puts "Division par zéro: #{safe_divide(10, 0)}"

begin
  puts validate_email("test@example.com")
  puts validate_email("")
rescue => e
  puts "Erreur capturée: #{e.message}"
end

puts "\n=== FIN KATAS SUPPLÉMENTAIRES ==="

