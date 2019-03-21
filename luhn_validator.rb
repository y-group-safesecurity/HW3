module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.chars.map(&:to_i)
    result = 0
    nums_a.reverse.each.with_index(0) do |item,index|
      if index.odd?
        if item.to_i*2 > 9
          result += item.to_i*2 - 9
        else 
          result += item.to_i*2
        end
      else
      result += item.to_i
      end
    end
    if (result % 10) == 0
      true
    else 
      false
    end
    # TODO: use the integers in nums_a to validate its last check digit
  end
end