module Select2Helper
  def select2(value, options)
    label = options.fetch(:from)

    select2_container = first('label', text: label).find(:xpath, '../div[contains(@class, "select2-container")]')
    select2_container.find('.select2-choices').click
    page.find('#select2-drop').find('.select2-result-label', text: value).click
  end
end

RSpec.configure { |config| config.include(Select2Helper) }
