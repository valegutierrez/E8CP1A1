options = 0
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
    suboption = ''
    while suboption != 'd'
      suboption = gets.chomp
      case suboption
      when a
      when b
      when c
      end
    end
  when 2
    puts 'Ingresa el nombre del producto'
    product = gets.chomp
  when 3
  when 4
  end
end
