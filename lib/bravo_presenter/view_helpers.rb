module BravoPresenter::ViewHelpers


  # nodoc
  def present(object)
    return present_collection(object) if object.respond_to?(:each)
    present_object(object)
  end


  # nodoc
  def present_collection(arr)
    return arr if arr.empty?
    BravoPresenter::Collection.new(arr, self)
  end


  # nodoc
  def present_object(object)
    klass = object.class.presenter rescue nil
    klass ||= [object.class.model_name, 'Presenter'].join.constantize
    klass.new(object, self) 
  end


end
