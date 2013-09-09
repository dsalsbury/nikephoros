class AuthorDecorator < ApplicationDecorator
  delegate :id

  def full_name
    middle_initial = source.middle_name.blank? ? nil : source.middle_name[0] + '.'
    last_name_with_suffix = [source.last_name, source.suffix].compact.join(', ')
    [source.prefix, source.first_name, middle_initial, last_name_with_suffix].compact.join(' ')
  end
end
