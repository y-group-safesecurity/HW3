require_relative '../credit_card'
require_relative '../substitution_cipher'

@cc = CreditCard.new('4916603231464963', 'Mar-30-2020', 'Soumya Ray', 'Visa')
@key = 3

a = @cc.number.chars.select.each_with_index { |_, id| (id + 1) % 3 == 0 }

b = @cc.number.chars.select.each_with_index { |_, id| (id + 1) % 3 != 0 }

tot = ''

(@cc.number.length / 3 + 1).times do |x|
  tot << a[x] if a[x].is_a? String
  (@key - 1).times do |y|
    tot << b[(@key - 1) * x + y] if b[(@key - 1) * x + y].is_a? String
  end
end

# p tot

enc = SubstitutionCipher::Permutation.encrypt(@cc, @key)
p enc
dec = SubstitutionCipher::Permutation.decrypt(enc, @key)
p dec


# def enc_each(each_val, key)
#     num1 = each_val.chars.select.each_with_index {|_, id| ((id + 1) % 3).zero?}
#     num2 = each_val.chars.select.each_with_index {|_, id| !((id + 1) % 3).zero?}
#     num_n = ''
#     (each_val.length / 3 + 1).times do |x|
#         num_n << num1[x] if num1[x].is_a? String
#         (key - 1).times do |y|
#             if num2[(key - 1) * x + y].is_a? String
#                 num_n << num2[(key - 1) * x + y]
#             end
#          end
#     end
#     each_val = num_n
# end

# p enc_each(@cc.expiration_date,@key)