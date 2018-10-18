file_toread = File.open('productos.txt', 'r')
words = file_toread.readlines
products = []
words.each do |i|
  data_split = i.split(', ').map(&:chomp)
  products.push(data_split)
end
options = 0

# Methods
def show_products(txt)
  puts 'Productos disponibles:'
  txt.each do |i|
    puts "-#{i[0]}\n"
  end
end

def stock_eachproduct(txt)
  puts 'Stock por producto:'
  txt.each do |i|
    stock = i[1..3].inject { |acc, sum| acc.to_i + sum.to_i }
    puts "-#{i[0]}: #{stock}"
  end
end

def stock_eachshop(txt)
  puts 'Stock por tienda:'
  puts "Tienda 1:"
  txt.each do |i|
    puts "-#{i[0]}: #{i[1]}"
  end
  puts "Tienda 2:"
  txt.each do |i|
    puts "-#{i[0]}: #{i[2]}"
  end
  puts "Tienda 3:"
  txt.each do |i|
    puts "-#{i[0]}: #{i[3]}"
  end
end
while options != 5
  puts 'Ingrese una opción del 1 al 5'
  puts '1: Cantidad de productos existentes'
  puts '2: Consultar stock de producto'
  puts '3: Productos no registrados'
  puts '4: Productos de stock menor al ingresado'
  puts '5: Salir'
  options = gets.chomp.to_i
  case options
  when 1
    show_products(products)
    suboption = ''
    while suboption != 'D'
      puts 'Ingrese una opción de la A a la D (Mayúsculas necesarias)'
      puts 'A: Mostrar la existencia por productos.'
      puts 'B: Mostrar la existencia total por tienda.'
      puts 'C: Mostrar la existencia total en todas las tiendas.'
      puts 'D: Volver al menú principal.'
      suboption = gets.chomp
      case suboption
      when 'A'
        stock_eachproduct(products)
      when 'B'
        stock_eachshop(products)
      when 'C'
      end
    end
  when 2
    puts 'Ingresa el nombre del producto'
    product = gets.chomp

  when 3
  when 4
  end
end
