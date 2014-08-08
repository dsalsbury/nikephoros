container_selector = '#article-search'
container = $(container_selector)

$(document).on 'submit', "#{container_selector} form", (event) ->
  event.preventDefault()
  $form = $(this)

  $.ajax
    dataType: 'json'
    data: $form.serialize()
    success: replaceTable

$(document).on 'click', "#{container_selector} a", (event) ->
  event.preventDefault()
  toggleSearchForm()

toggleSearchForm = ->
  $form_container = container.find('.form-container')
  $form_container.slideToggle()

replaceTable = (data) ->
  $('table').replaceWith(data.table)

performSearch = ->
  $(this).closest('form').submit()

$ ->
  container.find('#q_title_cont_any').typeWatch
    callback: performSearch
    wait: 20
    captureLength: 0

  container.find('#q_volume_year_eq').typeWatch
    callback: performSearch
    wait: 20
    captureLength: 4
  
  container.find('#q_summary_cont_any').typeWatch
    callback: performSearch
    wait: 20
    captureLength: 0

  container.find('select').change (event) ->
    performSearch.call(this)

  container.find('.select2').select2
    width: '50%'
