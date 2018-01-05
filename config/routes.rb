Rails.application.routes.draw do
  get '/hello_world' => 'application#hello_world'
  get '/hello/:name' => 'application#hello_world'

  get    '/posts'          => 'posts#index'

  get    '/posts/new'      => 'posts#new', as: :new_post
  post   '/posts'          => 'posts#create'

  get    '/posts/:id'      => 'posts#show', as: :post

  get    '/posts/:id/edit' => 'posts#edit', as: :edit_post

  patch  '/posts/:id'      => 'posts#update' #, as: :post
  put    '/posts/:id'      => 'posts#update' #, as: :post  // breaks routes!

  delete '/posts/:id'      => 'posts#destroy' #, as: :post

  post '/create_comment_for_post/:post_id' => 'application#create_comment'

  post '/list_posts/:post_id/delete_comment/:comment_id' => 'application#delete_comment'

  get  '/list_comments' => 'application#list_comments'
end
