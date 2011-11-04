# Inspired by https://gist.github.com/1018296

jQuery ->
  gaq = (window._gaq or= [])
  
  gaq.push(['_setAccount', 'UA-26788670-1'])
  gaq.push(['_setDomainName', 'yardage-book.mobi'])
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
      if u then gaq.push(['_trackPageview', u]) else gaq.push(['_trackPageview'])
  
  #jQuery(":jqmData(role='page')").live 'pageshow', (event, ui) -> 
