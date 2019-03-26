module SubstitutionCipher
  module Caesar
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using caesar cipher
      
      shiftarray = []
      charline = document.chars.map(&:ord)

      
      alphabetsize.times do |key|
        shiftarray << charline.map do |c|
          ((c + key) < 123 ? (c + key) : (c + key) - 26).chr
        end.join
      end
      document = shiftarray
      
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using caesar cipher
      #alphabet = 'a .. z'
      #decrypter = Hash[alphabet.zip(alphabet.rotate(key))]
      #document.chars.map { |x| decrypter.fetch(x,'')}
      alphabetsize = 26
      shiftarray = []
      charline = document.chars.map(&:ord)

      key = key - 6
      alphabetsize.times do |key|
        shiftarray << charline.map do |c|
          ((c + key) < 123 ? (c - key) : (c - key) - 26).chr
        end.join
      end
      document = shiftarray
      
    end
  end

  module Permutation
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using a permutation cipher
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using a permutation cipher
    end
  end
end
