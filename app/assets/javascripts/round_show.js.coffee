$ ->
  $('.hole-link').click ->
    window.document.location = $(this).data("href")

  $('.hole-link').hover ->
    $(this).css('cursor', 'pointer')
