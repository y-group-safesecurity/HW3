require_relative '../credit_card'
require_relative '../substitution_cipher'

@cc = CreditCard.new('4916603231464963', 'Mar-30-2020', 'Soumya Ray', 'Visa')
@key = 3

a = @cc.number.chars.select.each_with_index { |_, id| (id + 1) % 3 == 0 }

b = @cc.number.chars.select.each_with_index { |_, id| (id + 1) % 3 != 0 }
p a
p b

tot = ''
(@cc.number.length / 3).times do |x|
  tot << a[x]
  (@key - 1).times { |y| tot << b[(@key - 1) * x + y] }
end

p tot
