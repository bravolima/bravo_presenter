class BravoPresenter::Collection
  attr_accessor :collection, :template
  delegate :empty?, :to => :collection


  # nodoc
  def initialize(collection, template)
    self.collection = collection
    self.template = template
  end


  # nodoc
  def each(&block)
    collection.each do |object|
      block.call template.present_object(object)
    end
  end


end
