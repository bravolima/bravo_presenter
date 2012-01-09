module BravoPresenter
  module Filters

    # nodoc
    def collection(value)
      template.present_collection(value)
    end


    # nodoc
    def currency(value, options={})
      options[:unit] ||= object.country.currency.symbol rescue '$'
      template.number_to_currency(value, options)
    end


    # nodoc
    def datetime(value, format=:short)
      format = case format
        when :mmm_yyyy then "%b %y"
        when :dd_mmm then "%d %b"
        when :date_at_time then "%d %b at %l:%M%P"
        when :time_on_date then "%l:%M%P on %d %b"
        when :datetime then "%d %b %l:%M%P"
        else format
      end
      return value.to_s(format) unless format.is_a?(String)
      value.strftime format
    end


    # nodoc
    def presenter(value)
      return nil if value.nil?
      template.present_object(value)
    end


    # nodoc
    def text(value, options={})
      if length = options.delete(:truncate)
        value = template.truncate(value, :length => length)
      end
      value
    end


  end
end
