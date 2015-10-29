Rails.application.routes.draw do
  

  namespace :api, defaults: { format: :jason } do
    resource :users
  end

end
