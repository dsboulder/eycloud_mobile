ActionController::Routing::Routes.draw do |map|
  map.root :controller => "environments", :action =>"index"
  map.resources :environments, :only => [:index, :show]
end
