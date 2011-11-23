# Inspired by https://gist.github.com/1018296

jQuery ->
  gaq = (window._gaq or= [])
  window.initial_push = $('body').jqmData('jqm-analytics-push')
  gaq.push.apply this, initial_push
  gaq.push(['_trackPageview'])
  
  # async
  (->
    ga = document.createElement('script')
    ga.async = true
    ga.src = "#{if 'https:' == document.location.protocol then 'https://ssl' else 'http://www'}.google-analytics.com/ga.js"
    s = document.getElementsByTagName('script')[0]
    s.parentNode.insertBefore(ga, s)
  )()
  
  $(document).bind 'pagebeforechange', (event, data) ->
    if typeof data.toPage is 'string'
      url = $.mobile.path.parseUrl data.toPage
      u = url.hash.replace('#', '');
      u ||= url.pathname
      if u then gaq.push(['_trackPageview', u]) else gaq.push(['_trackPageview'])
      
  $(":jqmData(jqm-analytics-event)").live 'click', (event) ->
    event_data = $(this).jqmData('jqm-analytics-event')
    event_data = ['_trackEvent'].concat(event_data) unless event_data?[0] is '_trackEvent'
    gaq.push event_data
  
  #jQuery(":jqmData(role='page')").live 'pageshow', (event, ui) -> 
