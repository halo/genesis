logg(%{Cookbook <b>homebrew</b> started...}) { color :magenta }

Homebrew.node = node
include_recipe 'homebrew::homebrew'

include_recipe 'homebrew::dnsmasq'
include_recipe 'homebrew::duti'
include_recipe 'homebrew::nginx'
include_recipe 'homebrew::postgres'

logg(%{Cookbook <b>homebrew</b> finished.}) { color :magenta }
