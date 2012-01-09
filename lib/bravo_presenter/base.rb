# Based on this gist by Joshua Clayton:
# https://gist.github.com/1522839/
class BravoPresenter::Base < BasicObject
  include ::BravoPresenter::Filters
  include ::BravoPresenter::Helpers

  attr_accessor :object, :template

  undef_method :==


  def initialize(object, template)
    @object = object
    @template = template
  end


  def method_missing(name, *args, &block)
    @object.send(name, *args, &block)
  end


  def send(symbol, *args)
    __send__(symbol, *args)
  end


  # BasicObject is outside the standard library namespace, this
  # avoids having to prefix constants with ::
  def self.const_missing(name)
    ::Object.const_get(name)
  end


  # nodoc
  def self.present(method_name, options={})
    filter_method = options.delete(:as) || :presenter
    define_method method_name do |*args|
      value = object.send(method_name)
      send(filter_method, value, *args)
    end
  end


end
