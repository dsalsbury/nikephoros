Draper::CollectionDecorator.delegate :reorder, :page, :current_page, :total_pages, :limit_value, :total_count, :num_pages, :model_name, :pluck
Draper::Decorator.delegate :id, :to_key, :attributes=, :save, :errors, :persisted?
