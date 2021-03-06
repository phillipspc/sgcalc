$ ->
  $('.hole-link').click ->
    window.document.location = $(this).data("href")

  maxStrokes = 10
  holeStrokes = $('#hole-header').data('stroke-count')

  toggleSaveButton = () ->
    $('#save-btn').toggle(holeStrokes != $('#hole-header').data('stroke-count'))

  $(document).on 'nested:fieldAdded', (event) ->
    holeStrokes += 1
    toggleSaveButton()
    $('.add_nested_fields').toggle(holeStrokes <= maxStrokes)
    $('.final-row').toggle(holeStrokes <= $('#hole-header').data('stroke-count'))

  $(document).on 'nested:fieldRemoved', ->
    holeStrokes = holeStrokes - 1
    toggleSaveButton()
    $('.add_nested_fields').toggle(holeStrokes <= maxStrokes)
    $('.final-row').toggle(holeStrokes <= $('#hole-header').data('stroke-count'))

  toggleSaveButton()
