Rails.application.routes.draw do
  devise_for :users,
    path: "",
    path_names: {
      sign_in: "login",
      sign_out: "logout",
      registration: "signup"
    },
    controllers: {
      sessions: "sessions",
      registrations: "registrations"
    }

  get "me", to: "users#show"

  resources :members, only: [ :index ] do
    collection do
      post "invite", to: "members#invite"
    end
  end
end
