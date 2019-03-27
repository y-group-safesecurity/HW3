module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.chars.map(&:to_i)
    result = 0
    nums_a.reverse_each.with_index(0) do |item, index|
      result += if index.odd?
                  item.to_i * 2 > 9 ? item.to_i * 2 - 9 : item.to_i * 2
                else
                  item.to_i
                end
    end
    (result % 10).zero?
    # TODO: use the integers in nums_a to validate its last check digit
  end
end