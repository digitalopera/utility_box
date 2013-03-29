$(document).on 'click', 'tr[data-href]', (e) ->
  target = $(e.target)
  currentTarget = $(e.currentTarget)
  if target.is('a') == false && target.parents('a').length == 0 # check to make sure click isn't within a link
    href = currentTarget.attr('data-href')
    if currentTarget.attr('data-blank') == 'true'
      win = window.open(href, '_blank')
      win.focus()
    else
      window.location = href