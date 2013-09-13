class RomanNumerals
  CONVERSIONS = {
    0 => '',
    1 => 'I',
    2 => 'II',
    3 => 'III',
    4 => 'IV',
    5 => 'V',
    6 => 'VI',
    7 => 'VII',
    8 => 'VIII',
    9 => 'IX',
    10 => 'X',
    20 => 'XX',
    30 => 'XXX',
    40 => 'XL',
    50 => 'L',
    60 => 'LX',
    70 => 'LXX',
    80 => 'LXXX',
    90 => 'XC',
    100 => 'C',
    200 => 'CC',
    300 => 'CCC',
    400 => 'CD',
    500 => 'D'
  }

  def self.to_roman(num)
    str = ''

    str << CONVERSIONS[convert_for_power(num, 100)]
    str << CONVERSIONS[convert_for_power(num, 10)]
    str << CONVERSIONS[convert_for_power(num, 1)]
  end

  def self.convert_for_power(num, power)
    ((num / power) % 10) * power
  end
end
