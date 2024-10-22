Rails.application.routes.draw do
  root to: redirect(Avo.configuration.root_path)

  devise_for :users

  authenticate :user do
    mount Avo::Engine, at: Avo.configuration.root_path
  end
end
