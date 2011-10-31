require "jqm-rails/version"
require "jqm-rails/helpers"

class Engine < ::Rails::Engine
  # Must extend Rails::Engine to be able to supply vendor/assets stuff
end

class ActionView::Base
  send :include, ::Jqm::Helpers 
end