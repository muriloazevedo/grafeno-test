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


def rule_length(str, length)
  return str if str.length == length

  str.slice(0..length - 1)
end

def rule_align_padding(str, align, padding, length)
  padding_opt = {
    spaces: ' ',
    zeroes: '0'
  }
  length_padding = str.length + length
  return str.ljust(length_padding, padding_opt[padding.to_sym]) if align == 'left'

  return str.rjust(length_padding, padding_opt[padding.to_sym]) if align == 'right'
end

def validates(item)
  concat_str = ''
  item.each do |k, v|
    key_validations = $validations[k.to_s]
    next if key_validations.nil?

    length = key_validations['length']
    result = rule_length(v, length)
    if result.length < length
      padding = key_validations['padding']
      align = key_validations['align']
      result = rule_align_padding(result, align, padding, length)
    end
    concat_str += result
  end
  concat_str
end

input.each do |item|
  result = validates(item)
  puts result
end
