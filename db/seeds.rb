# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def its_balanced?(message)
  message = message.gsub(/(:\(|:\)|[a-z]| |:|\([a-z]*:[a-z]*\))/, "")
  valid_braces(message) ? "balanceado" : "desbalanceado"
end

def valid_braces(braces)
  stack = []
  symbols = { "(" => ")" }

  braces.each_char do |brace|
    stack.last && stack.last == symbols.key(brace) ? stack.pop : stack << brace
  end
  stack.empty?
end

puts "Start seeding examples"
examples_h = Message.new({ body: "a (b (c (d) c) b) a :)" })
examples_h.status = its_balanced?(examples_h.body)
examples_h.save

examples_g = Message.new({ body: ":((" })
examples_g.status = its_balanced?(examples_g.body)
examples_g.save

examples_f = Message.new({ body: "hoy pm: fiesta :):)" })
examples_f.status = its_balanced?(examples_f.body)
examples_f.save

examples_e = Message.new({ body: "no voy (:()" })
examples_e.status = its_balanced?(examples_e.body)
examples_e.save

examples_d = Message.new({ body: "(:)" })
examples_d.status = its_balanced?(examples_d.body)
examples_d.save

examples_c = Message.new({ body: "(()" })
examples_c.status = its_balanced?(examples_c.body)
examples_c.save

examples_b = Message.new({ body: "(hola)" })
examples_b.status = its_balanced?(examples_b.body)
examples_b.save

examples_a = Message.new({ body: "hola" })
examples_a.status = its_balanced?(examples_a.body)
examples_a.save

puts "FInish seeding examples"