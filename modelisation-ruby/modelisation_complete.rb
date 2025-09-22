# ========================================
# MODÉLISATION RUBY COMPLÈTE
# User, Article, Category avec tous les concepts Ruby
# ========================================

# ========================================
# 1. VARIABLES, CONSTANTES, SYMBOLES vs STRINGS
# ========================================

# Variables locales (snake_case)
user_name = "Alice"
user_age = 25

# Constantes (MAJUSCULES)
MAX_ARTICLES = 100
DEFAULT_CATEGORY = "Général"

# Symboles vs Strings
# Symboles : immuables, plus rapides, clés de hash
:name          # Symbol (immuable)
"name"         # String (mutable)

# ========================================
# 2. ARRAYS, HASHES, MANIPULATION COLLECTIONS
# ========================================

# Arrays
articles = ["Article 1", "Article 2", "Article 3"]
categories = %w[Tech Sport Politique]  # Syntaxe courte pour array de strings

# Hashes
user_data = {
  name: "Alice",           # Symbol comme clé (Ruby 1.9+)
  age: 25,
  email: "alice@example.com"
}

# Manipulation collections
articles << "Article 4"                    # Ajouter élément
articles.push("Article 5")                 # Autre façon d'ajouter
articles.pop                               # Retirer dernier élément
articles.first                             # Premier élément
articles.last                              # Dernier élément
articles.length                            # Taille
articles.include?("Article 1")             # Contient ?

# ========================================
# 3. CONDITIONS ET BOUCLES
# ========================================

# If/Unless
if user_age >= 18
  puts "Majeur"
end

unless user_age < 18
  puts "Majeur aussi"
end

# Case (plus lisible que if/elsif)
case user_age
when 0..17
  puts "Mineur"
when 18..65
  puts "Adulte"
else
  puts "Senior"
end

# Boucles avec collections
articles.each do |article|
  puts "Article: #{article}"
end

# Map (transformation)
article_lengths = articles.map { |article| article.length }

# Select (filtrage)
long_articles = articles.select { |article| article.length > 10 }

# ========================================
# 4. CLASSES ET OBJETS
# ========================================

# Module pour partager du code
module Publishable
  def publish
    @published = true
    puts "#{self.class.name} publié !"
  end
  
  def published?
    @published || false
  end
end

# Classe Category
class Category
  # attr_accessor génère automatiquement getter/setter
  attr_accessor :name, :description
  
  # Variable de classe (partagée par toutes les instances)
  @@total_categories = 0
  
  # Méthode de classe
  def self.total_categories
    @@total_categories
  end
  
  def self.reset_counter
    @@total_categories = 0
  end
  
  # Initialize (constructeur)
  def initialize(name, description = "")
    @name = name
    @description = description
    @@total_categories += 1
  end
  
  # Méthode d'instance
  def display_info
    puts "Catégorie: #{@name} - #{@description}"
  end
end

# Classe User
class User
  attr_accessor :name, :email, :age
  attr_reader :id  # Lecture seule
  
  @@next_id = 1
  
  def initialize(name, email, age)
    @name = name
    @email = email
    @age = age
    @id = @@next_id
    @@next_id += 1
  end
  
  # Méthode avec ?
  def adult?
    @age >= 18
  end
  
  # Méthode avec !
  def validate!
    raise "Email invalide" unless @email.include?("@")
    raise "Nom requis" if @name.empty?
    self
  end
end

# Classe Article avec héritage et modules
class Article
  include Publishable  # Mixin du module
  
  attr_accessor :title, :content, :author, :category
  attr_reader :created_at, :id
  
  @@next_id = 1
  
  def initialize(title, content, author, category = nil)
    @title = title
    @content = content
    @author = author
    @category = category
    @created_at = Time.now
    @id = @@next_id
    @@next_id += 1
  end
  
  # Méthode avec yield et block_given?
  def process_content(&block)
    if block_given?
      yield(@content)
    else
      @content
    end
  end
  
  # Méthode avec safe navigation (&.)
  def category_name
    @category&.name || "Sans catégorie"
  end
  
  # String interpolation vs concatenation
  def summary
    # Interpolation (recommandée)
    "#{@title} par #{@author.name} (#{@created_at.strftime('%d/%m/%Y')})"
    
    # Concatenation (moins lisible)
    # @title + " par " + @author.name + " (" + @created_at.strftime('%d/%m/%Y') + ")"
  end
  
  # Duck typing - méthode qui accepte tout objet avec une méthode name
  def assign_to(object)
    if object.respond_to?(:name)
      @category = object
    else
      raise "L'objet doit avoir une méthode name"
    end
  end
end

# ========================================
# 5. BLOCKS ET ITÉRATEURS
# ========================================

# Méthode personnalisée avec block
def process_articles(articles, &block)
  articles.each do |article|
    result = block.call(article) if block_given?
    puts "Traitement: #{article.title} -> #{result}"
  end
end

# ========================================
# 6. RUBY IDIOMATIQUE
# ========================================

# Safe navigation operator
def get_user_category_name(user)
  "Pas de catégorie"  # User n'a pas de catégorie dans ce modèle
end

# Méthodes avec ? (retournent true/false)
def valid_email?(email)
  email.include?("@") && email.include?(".")
end

# Méthodes avec ! (modifient l'objet)
def normalize_title!
  @title = @title.strip.capitalize
end

# ========================================
# 7. CHOIX ENTRE HASH ET ARRAY
# ========================================

# Array : ordre important, accès par index
articles_by_date = ["Article 1", "Article 2", "Article 3"]
puts articles_by_date[0]  # Premier article

# Hash : accès par clé, pas d'ordre garanti
articles_by_id = {
  1 => "Article 1",
  2 => "Article 2", 
  3 => "Article 3"
}
puts articles_by_id[1]  # Article avec ID 1

# ========================================
# 8. DÉMONSTRATION COMPLÈTE
# ========================================

puts "=== DÉMONSTRATION MODÉLISATION RUBY ==="

# Créer des instances
tech_category = Category.new("Technologie", "Articles tech")
user = User.new("Alice", "alice@example.com", 25)
article = Article.new("Ruby pour débutants", "Contenu de l'article", user, tech_category)

# Utiliser les méthodes
puts article.summary
puts "Catégorie: #{article.category_name}"
puts "Utilisateur majeur: #{user.adult?}"

# Utiliser le module
article.publish
puts "Article publié: #{article.published?}"

# Utiliser les blocks
process_articles([article]) do |art|
  art.title.upcase
end

# Safe navigation
puts "Catégorie utilisateur: #{get_user_category_name(user)}"

puts "\n=== FIN DÉMONSTRATION ==="

# ========================================
# KATAS POUR RÉVISER
# ========================================

puts "\n=== KATAS DE RÉVISION ==="

# Kata 1: Variables et symboles
puts "\n--- Kata 1: Variables ---"
name = "Bob"
age = 30
status = :active
puts "Nom: #{name}, Âge: #{age}, Statut: #{status}"

# Kata 2: Arrays et manipulation
puts "\n--- Kata 2: Arrays ---"
numbers = [1, 2, 3, 4, 5]
squares = numbers.map { |n| n * n }
evens = numbers.select { |n| n.even? }
puts "Carrés: #{squares}"
puts "Pairs: #{evens}"

# Kata 3: Hash et accès
puts "\n--- Kata 3: Hash ---"
person = { name: "Charlie", age: 35, city: "Paris" }
puts "Personne: #{person[:name]} a #{person[:age]} ans"

# Kata 4: Conditions simples
puts "\n--- Kata 4: Conditions ---"
score = 85
if score >= 80
  puts "Excellent !"
elsif score >= 60
  puts "Bien !"
else
  puts "À améliorer"
end

# Kata 5: Boucles et collections
puts "\n--- Kata 5: Boucles ---"
fruits = %w[pomme banane orange]
fruits.each_with_index do |fruit, index|
  puts "#{index + 1}. #{fruit}"
end

# Kata 6: Méthodes simples
puts "\n--- Kata 6: Méthodes ---"
def greet(name)
  "Bonjour #{name} !"
end

def calculate_area(length, width)
  length * width
end

puts greet("David")
puts "Aire: #{calculate_area(5, 3)}"

# Kata 7: Classes basiques
puts "\n--- Kata 7: Classes ---"
class Book
  attr_accessor :title, :author
  
  def initialize(title, author)
    @title = title
    @author = author
  end
  
  def info
    "#{@title} par #{@author}"
  end
end

book = Book.new("Ruby Guide", "Alice")
puts book.info

# Kata 8: Blocks et yield
puts "\n--- Kata 8: Blocks ---"
def repeat(times)
  times.times do |i|
    yield(i + 1)
  end
end

repeat(3) do |count|
  puts "Répétition #{count}"
end

# Kata 9: Safe navigation
puts "\n--- Kata 9: Safe Navigation ---"
data = { user: { profile: { name: "Eve" } } }
name = data[:user]&.[](:profile)&.[](:name) || "Inconnu"
puts "Nom: #{name}"

# Kata 10: String interpolation
puts "\n--- Kata 10: Strings ---"
price = 19.99
quantity = 3
total = price * quantity
puts "Prix: #{price}€ x #{quantity} = #{total}€"

puts "\n=== FIN KATAS ==="

