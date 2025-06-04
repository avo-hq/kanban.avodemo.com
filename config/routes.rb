Rails.application.routes.draw do
  root to: redirect(Avo.configuration.root_path)

  devise_for :users

  authenticate :user do
    mount_avo
  end
end
