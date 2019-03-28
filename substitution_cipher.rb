# frozen_string_literal: true

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
