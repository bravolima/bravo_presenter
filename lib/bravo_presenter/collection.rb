class BravoPresenter::Collection
  include Enumerable
  attr_accessor :collection, :template


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


end
