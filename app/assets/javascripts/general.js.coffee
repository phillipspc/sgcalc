$ ->
  addStatValClass = (el) ->
    val = parseFloat($(el).html())
    console.log(val)
    return if val is 0
    if val > 0
      $(el).addClass('text-success')
    else
      $(el).addClass('text-danger')

  addStatValClass(el) for el in $('.get-text-color')
