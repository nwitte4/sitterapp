Rails.application.routes.draw do

  devise_for :parents, controllers: {
  sessions: 'parents/sessions',
  registrations: 'parents/registrations'
}
  devise_for :sitters, controllers: {
  sessions: 'sitters/sessions',
  registrations: 'sitters/registrations'
}

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

end
