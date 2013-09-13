class VolumeDecorator < ApplicationDecorator
  delegate :number, :year, :isbn

  def name
    "Nikephoros #{roman_numeral}"
  end

  def roman_numeral
    RomanNumerals.to_roman(number.to_i)
  end
end
