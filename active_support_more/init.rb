if defined? ActiveSupport

  Dir.glob(File.expand_path(File.dirname(__FILE__) + '/lib/*.rb')) do |file|
    require File.basename(file, ".rb")
  end

end
