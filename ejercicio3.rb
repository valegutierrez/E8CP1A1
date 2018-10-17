file = File.open('peliculas.txt', 'r')
words = file.readlines.map(&:chomp)
def total_words(path, txt)
  words_count = txt.map { |i| i.split.count }
  total_sum = words_count.inject { |acc, i| acc + i }
  puts "Cantidad total de palabras: #{total_sum}"
end
total_words(file, words)
def find_word(path, txt)
  puts 'Ingresa una palabra'
  word_tosearch = gets.chomp
  word_times = 0
  txt.each do |i|
    word_by_word = i.split
    word_by_word.each do |i|
      word_times += 1 if word_tosearch == i
    end
  end
  puts "Cantidad de veces que se encuentra la palabra: #{word_times}"
end
find_word(file, words)
file.close
