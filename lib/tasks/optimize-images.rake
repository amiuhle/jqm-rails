namespace :jqm do
  task :jpegtran do
    Dir[Rails.root.join('app', 'assets', 'images', '*.{jpg,jpeg}').to_s].each do |file|
      options = "-optimize -progressive -outfile"
      short = file.sub(/\A#{Rails.root}\//, '')
      puts "jpegtran #{options} \"#{short}\" \"#{short}\""
      `jpegtran #{options} "#{file}" "#{file}"`
    end
  end
end