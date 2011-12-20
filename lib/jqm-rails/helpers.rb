module Jqm
  
  module Helpers
    
    def jqm_page id, options = {}, &body
      layout = options.delete(:layout) || "jqm/page"
      page_data = options.delete(:page_data) || {}
      page_data.merge!(:role => :page)
      options[:page_data] = page_data
      
      header_data = options.delete(:header_data) || {}
      header_data.merge!(:role => :header)
      options[:header_data] = header_data
      
      content_data = options.delete(:content_data) || {}
      content_data.merge!(:role => :content)
      options[:content_data] = content_data
      
      footer_data = options.delete(:footer_data) || {}
      footer_data.merge!(:role => :footer)
      options[:footer_data] = footer_data
      
      options.each do |key, value|
        if value.is_a? Proc
          options[key] = capture(&value)
        end
      end
      
      options[:header_tag] ||= :h1
      options[:id] = id
      render :layout => layout, :locals => options, &body
    end
    
    def jqm_button body, url, options = {}
      link_to body, url, options.merge(:'data-role' => 'button')
    end
  
    def jqm_button_l body, url, options = {}
      jqm_button body, url, options.merge(:class => 'ui-btn-left', 'data-icon' => 'arrow-l', 'data-iconpos' => 'left')
    end
    
    def jqm_button_r body, url, options = {}
      jqm_button body, url, options.merge(:class => 'ui-btn-right', 'data-icon' => 'arrow-r', 'data-iconpos' => 'right')
    end
    
    def jqm_text_field object_name, method, label, options = {}, label_options = {}
      content_tag :fieldset, :data => { :role => :fieldcontain } do
        label(object_name, method, label, label_options) + text_field(object_name, method, options)
      end
    end
    
  end
end