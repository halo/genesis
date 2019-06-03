logg(%{Cookbook <b>casks</b> started...}) { color :magenta }

include_recipe 'casks::cleanup'
include_recipe 'casks::casks'
include_recipe 'casks::chrome'

logg(%{Cookbook <b>casks</b> finished.}) { color :magenta }
