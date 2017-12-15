Rails.application.routes.draw do
  get 'requests/index'

  get 'requests/show'

  get 'requests/new'

  get 'requests/create'

  get 'requests/update'

  get 'requests/edit'

  get 'requests/destroy'

  # devise_for :sitters, path: 'sitters'
  # devise_for :parents, path: 'parents'

  devise_for :parents, controllers: {
  sessions: 'parents/sessions',
  registrations: 'parents/registrations'
}
  devise_for :sitters, controllers: {
  sessions: 'sitters/sessions',
  registrations: 'sitters/registrations'
}

  post 'parents/:id', to: 'parents#update'

  resources :calendars
  resources :parents
  resources :sitters
  resources :gigs
  resources :requests

  post '/sitters/:id', to: 'parents#remove_sitter_from_parent'
  post '/gigs/gigs/:id', to: 'gigs#add_sitter_to_gig'

  root to: 'calendars#index'

#   devise_for :sitters, path: 'sitters'
# # eg. http://localhost:3000/users/sign_in
  # devise_for :parents, path: 'parents'
# # eg. http://localhost:3000/admins/sign_in
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
