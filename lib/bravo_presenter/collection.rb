class BravoPresenter::Collection
  include Enumerable
  attr_accessor :collection, :template

  alias_method :size, :count
  alias_method :length, :count

  # nodoc
  def initialize(collection, template)
    self.collection = collection
    self.template = template
  end


  # nodoc
  def each(&block)
    collection.each do |obj|
      block.call template.present_object(obj)
    end
  end


  # nodoc
  def empty?
    count == 0
  end


end
