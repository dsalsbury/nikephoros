module Select2Helper
  def select2(value, options)
    label = options.fetch(:from)

    label_node = first('label', text: label)
    raise "Unable to find label with text #{label}" unless label_node

    begin
      select2_container = label_node.find(:xpath, '../div[contains(@class, "select2-container")]')
    rescue Capybara::ElementNotFound
      raise "Unable to find Select2 container for label #{label}"
    end

    select2_container.find('.select2-choices').click
    dropdown = page.find('#select2-drop')
    select2_container.find('input.select2-input').set(value)
    dropdown.find('.select2-result-label', text: value).click
  end
end

RSpec.configure { |config| config.include(Select2Helper) }
