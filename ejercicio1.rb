def request_color
  file = File.open('index.html', 'w')
  puts 'Ingresa un color en inglés'
  color = gets.chomp
  file.puts "<head>\n<style> \np {\n background-color: #{color};\n}\n</style>\n</head>\n<body>"
  file.close
end
request_color
def request_paragraphs
  file = File.open('index.html', 'a')
  puts 'Ingresa una frase'
  first_string = gets.chomp
  puts 'Ingresa otra frase'
  second_string = gets.chomp
  file.puts "<p>#{first_string}</p>\n<p>#{second_string}</p>"
  file.close
end
request_paragraphs
def request_elements
  file = File.open('index.html', 'a')
  elements = ''
  while elements == ''
    puts 'Ingresa elementos separados por espacios'
    elements = gets.chomp
  end
  arr = elements.split
  file.puts "\n<ol>"
  arr.each do |i|
    file.puts "<li>#{i}</li>"
  end
  file.puts "</ol>\n</body>"
  file.close
end
request_elements
puts
