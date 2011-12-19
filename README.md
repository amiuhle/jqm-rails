# jqm-rails

jQuery Mobile for rails >= 3.1.

This gem vendors the latest jQuery Mobile release and provides some useful helpers.

The initial release features just some helper methods I used for one of my projects. 
This is my first gem and I'm not yet a rails expert, so comments are very much appreciated,
especially whether the prefixing of the helper methods with `jqm_` is good or bad style, and
whether the the implementation of the `jqm_page` helper is good or bad.

## Installation
    gem 'jqm-rails', :git => 'https://github.com/amiuhle/jqm-rails.git'
  
In your CSS

    /*
     *= require jquery.mobile
    */
In your JS

    //= require jquery.mobile
  

## Features

jQuery Mobile page template:

    <%= jqm_page 'id', 
        :title => 'Hello, world!', 
        :prev_page => jqm_button_l('Back', 'href', :'data-direction' => 'reverse'),
        :next_page => jqm_button_r("Next", "href"),
        :header_data => {:theme => 'a'},
        :content_data => {:theme => 'b'} do %>
      There should be some content here!
    <% end %>
  
Helpers:

    jqm_button 'Text', 'href'     #jQuery Mobile button
    jqm_button_l 'Left', 'href'   #jQuery Mobile button with :class => 'ui-btn-left', 'data-icon' => 'arrow-l', 'data-iconpos' => 'left'
    jqm_button_r 'Right', 'href'  #jQuery Mobile button with :class => 'ui-btn-right', 'data-icon' => 'arrow-r', 'data-iconpos' => 'right'
    
Analytics Integration

Include the JavaScript file in your `application.js`:

    //= require jquery.mobile.analytics
    
Provide your Analytics Tracker ID:

    <body data-jqm-analytics-push='[["_setAccount", "UA-XXXXXXX-YY"], ["_setDomainName", "mydomain.com"]]'>


    
  
## TODOs
  - Make awesome