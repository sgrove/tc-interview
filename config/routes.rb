ActionController::Routing::Routes.draw do |map|
  map.analysis "/analysis/show", :controller => 'analysis', :action => 'show'
  map.list_analysis "/analysis", :controller => 'analysis', :action => 'index'
  map.destroy_analysis "/analysis/destroy", :controller => 'analysis', :action => 'destroy'

  map.root :controller => "analysis"

  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
