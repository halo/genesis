logg(%{Cookbook <b>dotfiles</b> started...}) { color :magenta }

include_recipe 'dotfiles::dotfiles'
include_recipe 'dotfiles::user_pictures'
include_recipe 'dotfiles::ppvpn'

logg(%{Cookbook <b>dotfiles</b> finished.}) { color :magenta }
