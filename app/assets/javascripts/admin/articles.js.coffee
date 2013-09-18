$ ->
  $('select.select2').select2
    width: '50%'

  keywords_input = $('input#article_keyword_names')
  keywords_input.select2
    width: '50%'
    tags: ->
      keywords_input.data('keywords')
