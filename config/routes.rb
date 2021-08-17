Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # read
  get 'tasks', to: 'tasks#index'
  get 'tasks/new', to: 'tasks#new'
  get 'tasks/:id', to: 'tasks#show', as: 'task' # here we set as task
  # this ensures that we can make the link_to task['title'] and task_path work
  # which takes the path tasks/task['id']
  # create
  post 'tasks', to: 'tasks#create'
  # edit
  # step1: get the html form
  # step2: patch the params to save the task
  # remember, as we are editing a single task instance
  # we need to specify the id
  get 'tasks/:id/edit', to: 'tasks#edit'
end
