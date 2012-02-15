if defined? ActiveRecord


  class ActiveRecord::Base

    class << self
      alias_method :[], :find
    end

    def dom_id(prefix='')
      display_id = new_record? ? "new" : id.to_s
      prefix.to_s <<( '_') unless prefix.blank?
      prefix.to_s << "#{self.class.name.underscore.gsub('/', '_')}"
      prefix != :bare ? "#{prefix.to_s.underscore}_#{display_id}" : display_id
    end
  end



end
