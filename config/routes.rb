Rails.application.routes.draw do

  devise_for :parents, controllers: {
  sessions: 'parents/sessions',
  registrations: 'parents/registrations'
}
  devise_for :sitters, controllers: {
  sessions: 'sitters/sessions',
  registrations: 'sitters/registrations'
}

  # post 'parents/:id', to: 'parents#update'

  resources :calendars
  resources :parents
  resources :sitters
  resources :gigs
  resources :requests
  resources :notes

  post '/sitters/:id', to: 'parents#remove_sitter_from_parent'
  post '/parents/:id', to: 'parents#remove_sitter_from_parent'
  post '/requests/:id', to: 'gigs#request_to_gig'
  post '/gigs/gigs/:id', to: 'gigs#add_sitter_to_gig'

  root to: 'calendars#index'

#   devise_for :sitters, path: 'sitters'
# # eg. http://localhost:3000/users/sign_in
  # devise_for :parents, path: 'parents'
# # eg. http://localhost:3000/admins/sign_in
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
