logg(%{Cookbook <b>biosphere</b> started...}) { color :magenta }

include_recipe 'biosphere::augmentations'
include_recipe 'biosphere::homebrew'
include_recipe 'biosphere::rbenv'

logg(%{Cookbook <b>biosphere</b> finished.}) { color :magenta }
