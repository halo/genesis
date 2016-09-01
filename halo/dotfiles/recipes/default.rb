logg(%{Cookbook <b>dotfiles</b> started...}) { color :magenta }

include_recipe 'dotfiles::githooks'
include_recipe 'dotfiles::dotfiles'
include_recipe 'dotfiles::user_pictures'
include_recipe 'dotfiles::ppvpn'
include_recipe 'dotfiles::textmate'

logg(%{Cookbook <b>dotfiles</b> finished.}) { color :magenta }
