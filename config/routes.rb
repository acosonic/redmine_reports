RedmineApp::Application.routes.draw do
  #get '/redmine_reports/index'
  #get '/redmine_reports/:id'
  resources :redmine_reports
end
