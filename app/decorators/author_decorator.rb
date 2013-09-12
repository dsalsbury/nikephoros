class AuthorDecorator < ApplicationDecorator
  delegate :id, :to_key, :prefix, :first_name, :middle_name, :last_name, :suffix, :display_as

  def full_name
    display_name || composed_name
  end

  private

  def display_name
    display_as unless display_as.blank?
  end

  def composed_name
    name_parts = []

    name_parts << prefix
    name_parts << first_name
    name_parts << middle_initial
    name_parts << last_name

    name_parts.reject { |part| part.blank? }.join(' ').tap do |name_str|
      name_str << ", #{suffix}" unless suffix.blank?
    end
  end

  def middle_initial
    middle_name.blank? ? nil : middle_name[0] + '.'
  end
end
