class Roman
  class << self
    ROMAN_MAPPING =
      {
        1000 => 'M',
        900  => 'CM',
        500  => 'D',
        400  => 'CD',
        100  => 'C',
        90   => 'XC',
        50   => 'L',
        40   => 'XL',
        10   => 'X',
        9    => 'IX',
        5    => 'V',
        4    => 'IV',
        1    => 'I'
    }.freeze

    def iterative_to_roman(number)
      return "Cannot Compute!" if (!number.is_a?(Integer) || number <= 0)
      result = ""
      ROMAN_MAPPING.each do |value, digit|
        while number >= value
          result += digit
          number -= value
        end
      end
      result
    end

    def to_roman(number)
      return "Cannot Compute!" if (!number.is_a?(Integer) || number <= 0)
      result = ""
      ROMAN_MAPPING.keys.each do |i|
        target, arabic = number.divmod(i)
        result << ROMAN_MAPPING[i] * target
        number = arabic
      end
      result
    end
  end
end
