logg(%{Cookbook <b>biosphere</b> started...}) { color :magenta }

logg %{HOME: #{ENV['HOME']}}
logg %{BIOSPHERE_HOME: #{ENV['BIOSPHERE_HOME']}}
logg %{BIOSPHERE_SPHERE_PATH: #{ENV['BIOSPHERE_SPHERE_PATH']}}
logg %{BIOSPHERE_SPHERE_AUGMENTATIONS_PATH: #{ENV['BIOSPHERE_SPHERE_AUGMENTATIONS_PATH']}}
logg %{BIOSPHERE_CUSTOM_SSH_KEY_NAME: #{ENV['BIOSPHERE_ENV_SSH_KEY_NAME']}}

include_recipe 'biosphere::augmentations'
include_recipe 'biosphere::homebrew'
include_recipe 'biosphere::rubies'

logg(%{Cookbook <b>biosphere</b> finished...}) { color :magenta }
