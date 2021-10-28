require 'yaml'

input = [
  { name: 'Maria Neusa de Aparecida',
    cpf: '97905796671',
    state: 'Sao Paulo',
    value: '1234' },
  { name: 'Ricardo Fontes',
    cpf: '44010762900',
    state: 'Rio Grande do Sul',
    value: '567' }
]

$validations = YAML.load(File.read('format-1.yml'))

def validates(item)
  concat_str = ''
  item.each do |k, v|
    key_validations = $validations[k.to_s]
    puts key_validations
  end
end

input.each do |item|
  result = validates(item)
  puts result
end
