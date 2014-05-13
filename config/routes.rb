Rails.application.routes.draw do
  get 'book/list' => 'book#list'
  get 'book/new' => 'book#new'
  post 'book/create' => 'book#create'
  get 'book/show' => 'book#show'
  get 'book/show_subjects' => 'book#show_subjects'
  get 'book/edit' => 'book#edit'
  get 'book/delete' => 'book#delete'
  post 'book/update' => 'book#update'
  get 'book/uploadfile'=> 'book#index'
  post 'book/uploadfile'=> 'book#uploadfile'
end