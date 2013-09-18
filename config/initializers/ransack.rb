cont_any_formatter = ->(query) do
  query.split(/\s+/).map { |part| "%#{Ransack::Constants.escape_wildcards(part)}%" }
end

Ransack.configure do |config|
  config.add_predicate 'cont_any', arel_predicate: 'matches_any', formatter: cont_any_formatter, compounds: true, type: :string
end
