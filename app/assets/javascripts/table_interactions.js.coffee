$(document).on 'click', 'tr.clickable-row[data-url]', (event) ->
  window.location = $(this).data('url')
