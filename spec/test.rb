require_relative '../credit_card'
require_relative '../substitution_cipher'

@cc = CreditCard.new('4916603231464963', 'Mar-30-2020', 'Soumya Ray', 'Visa')
@key = 3

p @cc.to_s[0]

enc = SubstitutionCipher::Caesar.encrypt(@cc, @key)
p enc.to_s

dec = SubstitutionCipher::Caesar.decrypt(enc, @key)
p dec.to_s

