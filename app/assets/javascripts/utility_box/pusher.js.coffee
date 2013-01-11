# Pusher.js.coffee
# This file is used to establish a pusher connection and any defaults or
# channel subscriptions that should be established globally for an artist.
#
#= require utility_box/utility_box_namespace
#= require pusher
#

do ->
  key = $('meta[name=pusher-key]').attr('content')

  if key
    @UtilityBox.pusher = new Pusher(key)