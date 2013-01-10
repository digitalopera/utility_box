$(document).on 'click', 'tr[data-href]', (e) ->
  window.location = $(e.currentTarget).attr('data-href')