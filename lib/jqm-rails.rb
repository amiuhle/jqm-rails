require "jqm-rails/version"
require "jqm-rails/helpers"
require "jqm-rails/mobile_detection"

class Engine < ::Rails::Engine
  # Must extend Rails::Engine to be able to supply vendor/assets stuff
end

class ActionController::Base
  extend ::Jqm::MobileDetection::ClassMethods  
  include ::Jqm::MobileDetection::ClassMethods
end

class ActionView::Base
  send :include, ::Jqm::Helpers
  send :include, ::Jqm::MobileDetection::ClassMethods 
end