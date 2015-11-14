$ ->
  # rows with class 'row-link' will link to specified url
  $('.row-link').click () ->
    window.document.location = $(this).data("href")
