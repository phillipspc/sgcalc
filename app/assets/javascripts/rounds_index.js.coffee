$ ->
  # rows with class 'row-link' will link to specified url
  $('.row-link').click ->
    window.document.location = $(this).data("href")

  $('.row-link').hover ->
    $(this).css('cursor', 'pointer')
