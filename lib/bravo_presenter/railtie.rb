require 'rails'
require 'bravo_presenter/view_helpers'


module BravoPresenter
  class Railtie < Rails::Railtie


    initializer "bravo_presenter.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end


    initializer "bravo_presenter.route_helpers" do |app|
      BravoPresenter::Base.send :include, app.routes.url_helpers
    end


  end
end
