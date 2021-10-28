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
LENGHT_TRUNCATE = 11
LENGHT_FILL_SPACE = 9

def solucao(arg)
  result = ''
  arg.each do |item|
    item.values.each do |key|
      final_str = ''
      if key.length <= LENGHT_FILL_SPACE
        final_str = key.rjust(LENGHT_TRUNCATE - key.length, ' ')
      else
        final_str = key.slice(0..LENGHT_TRUNCATE - 1)
      end
      result += final_str
    end
    result += "\n"
  end
  result
end

puts solucao(input)