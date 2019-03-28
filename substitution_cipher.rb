

module SubstitutionCipher
  # It's for Caeser
  module Caesar
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using caesar cipher
      num = document.number.chars.map(&:ord)
      em_array1 = num.map do |c|
        (c + key).chr
      end.join
      document.number = em_array1

      exp = document.expiration_date.chars.map(&:ord)
      em_array2 = exp.map do |c|
        (c + key).chr
      end.join
      document.expiration_date = em_array2

      own = document.owner.chars.map(&:ord)
      em_array3 = own.map do |c|
        (c + key).chr
      end.join
      document.owner = em_array3

      crd = document.credit_network.chars.map(&:ord)
      em_array4 = crd.map do |c|
        (c + key).chr
      end.join
      document.credit_network = em_array4

      document
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using caesar cipher
      num = document.number.chars.map(&:ord)
      em_array1 = num.map do |c|
        (c - key).chr
      end.join
      document.number = em_array1

      exp = document.expiration_date.chars.map(&:ord)
      em_array2 = exp.map do |c|
        (c - key).chr
      end.join
      document.expiration_date = em_array2

      own = document.owner.chars.map(&:ord)
      em_array3 = own.map do |c|
        (c - key).chr
      end.join
      document.owner = em_array3

      crd = document.credit_network.chars.map(&:ord)
      em_array4 = crd.map do |c|
        (c - key).chr
      end.join
      document.credit_network = em_array4
      document.to_json
    end
  end

  # It's Permutation
  module Permutation
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using a permutation cipher
      num1 = document.number.chars.select.each_with_index { |_, id| ((id + 1) % key).zero?}
      num2 = document.number.chars.select.each_with_index { |_, id| !((id + 1) % key).zero?}
      num_n = ''
      (document.number.length / 3 + 1).times do |x|
        num_n << num1[x] if num1[x].is_a? String
        (key - 1).times do |y|
          if num2[(key - 1) * x + y].is_a? String
            num_n << num2[(key - 1) * x + y]
          end
        end
      end
      document.number = num_n

      exp1 = document.expiration_date.chars.select.each_with_index { |_, id| ((id + 1) % key).zero?}
      exp2 = document.expiration_date.chars.select.each_with_index { |_, id| !((id + 1) % key).zero?}
      exp_n = ''
      (document.expiration_date.length / 3 + 1).times do |x|
        exp_n << exp1[x] if exp1[x].is_a? String
        (key - 1).times do |y|
          if exp2[(key - 1) * x + y].is_a? String
            exp_n << exp2[(key - 1) * x + y]
          end
        end
      end
      document.expiration_date = exp_n

      own1 = document.owner.chars.select.each_with_index { |_, id| ((id + 1) % key).zero?}
      own2 = document.owner.chars.select.each_with_index { |_, id| !((id + 1) % key).zero?}
      own_n = ''
      (document.owner.length / 3 + 1).times do |x|
        own_n << own1[x] if own1[x].is_a? String
        (key - 1).times do |y|
          if own2[(key - 1) * x + y].is_a? String
            own_n << own2[(key - 1) * x + y]
          end
        end
      end
      document.owner = own_n

      crd1 = document.credit_network.chars.select.each_with_index { |_, id| ((id + 1) % key).zero?}
      crd2 = document.credit_network.chars.select.each_with_index { |_, id| !((id + 1) % key).zero?}
      crd_n = ''
      (document.credit_network.length / 3 + 1).times do |x|
        crd_n << crd1[x] if crd1[x].is_a? String
        (key - 1).times do |y|
          if crd2[(key - 1) * x + y].is_a? String
            crd_n << crd2[(key - 1) * x + y]
          end
        end
      end
      document.credit_network = crd_n
      document
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using a permutation cipher
      num1 = document.number.chars.select.each_with_index { |_, id| (id + 1) % key == 1}
      num2 = document.number.chars.select.each_with_index { |_, id| (id + 1) % key != 1}
      num_n = ''
      (document.number.length / 3 + 1).times do |x|
        (key - 1).times do |y|
          if num2[(key - 1) * x + y].is_a? String
            num_n << num2[(key - 1) * x + y]
          end
        end
        num_n << num1[x] if num1[x].is_a? String
      end
      document.number = num_n

      exp1 = document.expiration_date.chars.select.each_with_index { |_, id| (id + 1) % key == 1}
      exp2 = document.expiration_date.chars.select.each_with_index { |_, id| (id + 1) % key!= 1}
      exp_n = ''
      (document.expiration_date.length / 3 + 1).times do |x|
        (key - 1).times do |y|
          if exp2[(key - 1) * x + y].is_a? String
            exp_n << exp2[(key - 1) * x + y]
          end
        end
        exp_n << exp1[x] if exp1[x].is_a? String
      end
      document.expiration_date = exp_n

      own1 = document.owner.chars.select.each_with_index { |_, id| (id + 1) % key == 1}
      own2 = document.owner.chars.select.each_with_index { |_, id| (id + 1) % key != 1}
      own_n = ''
      (document.owner.length / 3 + 1).times do |x|
        (key - 1).times do |y|
          if own2[(key - 1) * x + y].is_a? String
            own_n << own2[(key - 1) * x + y]
          end
        end
        own_n << own1[x] if own1[x].is_a? String
      end
      document.owner = own_n

      crd1 = document.credit_network.chars.select.each_with_index { |_, id| (id + 1) % key == 1}
      crd2 = document.credit_network.chars.select.each_with_index { |_, id| (id + 1) % key != 1}
      crd_n = ''
      (document.credit_network.length / 3 + 1).times do |x|
        (key - 1).times do |y|
          if crd2[(key - 1) * x + y].is_a? String
            crd_n << crd2[(key - 1) * x + y]
          end
        end
        crd_n << crd1[x] if crd1[x].is_a? String
      end
      document.credit_network = crd_n
      document.to_json
    end
  end
end
