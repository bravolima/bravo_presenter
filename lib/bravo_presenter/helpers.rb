# helpers for the Presenter, not for the view (those are in ViewHelpers)
module BravoPresenter
  module Helpers


    def content_tag(*args, &block)
      template.content_tag(*args, &block)
    end


    def link_to(*args)
      template.link_to(*args)
    end


  end
end
