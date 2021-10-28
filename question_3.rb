require 'yaml'
require 'enumerator'

input_1 = '97905796671Maria Neusa de00001234'
input_2 = '44010762900Ricardo Fontes00000567'

def find_by_length(str, start, final)
  range = (start + final) - 1
  str.slice(start..range)
end

def solucao(input)
  validations = YAML.load(File.read('format-1.yml'))
  result = {}
  positions = validations.values.map { |hash| hash['length'] }
  puts positions[1]
  validations.each_with_index do |rule, i|
    
    hash = Hash.new
    start = 0 if i.zero?

    if i.positive?
      align = rule[1]['align']
      length = rule[1]['length']
      # posição do anterior
      prev_pos = positions[i - 1]

      # posição do anterior + padding left
      start = prev_pos + length if align == 'left'
      start 
      # if padding right: posição do anterior  - (length - padding right)
      start = input.length - prev_pos if align == 'right'
      puts "pos #{positions[i]}"
      puts "l: #{length}"
    end
    
    hash[rule.first] = find_by_length(input, start, positions[i])
    puts hash
  end
  # puts result
end

solucao(input_1)
# puts solucao(input_1)
