# Files
file_toread = File.open('productos.txt', 'r')
file_toappend = File.open('productos.txt', 'a')
words = file_toread.readlines
products = []
words.each do |i|
  data_split = i.split(', ').map(&:chomp)
  products.push(data_split)
end
options = 0
# End files

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
  puts 'Tienda 1:'
  txt.each do |i|
    puts "-#{i[0]}: #{i[1]}"
  end
  puts 'Tienda 2:'
  txt.each do |i|
    puts "-#{i[0]}: #{i[2]}"
  end
  puts 'Tienda 3:'
  txt.each do |i|
    puts "-#{i[0]}: #{i[3]}"
  end
end

def stock_allshops(txt)
  puts 'Stock total por tienda:'
  puts 'Tienda 1:'
  stock_sum1 = 0
  txt.each do |i|
    stock_sum1 += i[1].to_i
  end
  puts stock_sum1
  puts 'Tienda 2:'
  stock_sum2 = 0
  txt.each do |i|
    stock_sum2 += i[2].to_i
  end
  puts stock_sum2
  puts 'Tienda 3:'
  stock_sum3 = 0
  txt.each do |i|
    stock_sum3 += i[3].to_i
  end
  puts stock_sum3
end

def stock_oneproduct(prod, txt)
  if txt.include?(prod)
    find_item = txt.find { |i| i[0] == prod }
    stock = find_item[1..3].inject { |acc, sum| acc.to_i + sum.to_i }
    puts "Stock de #{find_item[0]}: #{stock}"
  else
    puts 'Producto inexistente'
  end
end

def not_registered(txt)
  puts 'No registrados:'
  puts '-Bodega 1:'
  txt.each do |i|
    puts i[0] if i[1].include?('NR')
  end
  puts '-Bodega 2:'
  txt.each do |i|
    puts i[0] if i[2].include?('NR')
  end
  puts '-Bodega 3:'
  txt.each do |i|
    puts i[0] if i[3].include?('NR')
  end
end

def less_stock?(txt, num)
  puts "Stock menor o igual a #{num}: "
  txt.each do |i|
    total = i[1..3].inject { |acc, sum| acc.to_i + sum.to_i }
    puts "-#{i[0]}" if total <= num
  end
end

def new_item(path, prod)
  path.puts "#{prod[0]}, #{prod[1]}, #{prod[2]}, #{prod[3]}"
end
# End methods

# Menu
while options != 6
  puts 'Ingrese una opción del 1 al 5'
  puts '1: Cantidad de productos existentes'
  puts '2: Consultar stock de producto'
  puts '3: Productos no registrados'
  puts '4: Productos de stock menor al ingresado'
  puts '5: Registrar producto nuevo'
  puts '6: Salir'
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
        stock_allshops(products)
      end
    end
  when 2
    puts 'Ingresa el nombre del producto'
    item = gets.chomp
    stock_oneproduct(item, products)
  when 3
    not_registered(products)
  when 4
    puts 'Ingrese un valor de stock'
    stock = gets.chomp.to_i
    less_stock?(products, stock)
  when 5
    puts 'Ingresa el nombre de un producto nuevo'
    new_product = gets.chomp
    puts 'Ingresa stock de la 1era bodega'
    stock1 = gets.chomp
    puts 'Ingresa stock de la 2da bodega'
    stock2 = gets.chomp
    puts 'Ingresa stock de la 3era bodega'
    stock3 = gets.chomp
    arr = [new_product, stock1, stock2, stock3]
    new_item(file_toappend, arr)
  when 6
    exit
  else
    puts 'Opción no válida'
  end
end
file_toread.close
file_toappend.close
# End menu
