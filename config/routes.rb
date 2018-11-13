Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # As a user, I can list tasks
  # --> Show all instances
  get "tasks", to: "tasks#index", as: :tasks

  # As a user, I can add a new task
  # --> Need to gete info about new instance
  # --> Create new instance
  get "tasks/new", to: "tasks#new", as: :new_task
  post "tasks", to: "tasks#create"

  # As a user, I can view the details of a task
  # --> Show the selected instance
  get "tasks/:id", to: "tasks#show", as: :task

  # As a user, I can edit a task (mark as completed / update title & details)
  # --> Need to select specific instance to update
  # --> Need to update selected instance
  get "tasks/:id/edit", to: "tasks#edit", as: :edit_task
  patch "tasks/:id", to: "tasks#update"

  # As a user, I can remove a task
  # --> Delete selected item with verb 'delete' automatically
  delete "tasks/:id", to: "tasks#destroy"
end
