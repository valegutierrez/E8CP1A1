def read_length
file = File.open('peliculas.txt', 'r')
puts "Cantidad de líneas de texto: #{file.readlines.length}"
file.close
end
read_length
