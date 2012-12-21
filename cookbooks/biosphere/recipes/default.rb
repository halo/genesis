logg %{HOME: #{ENV['HOME']}}
logg %{BIOSPHERE_HOME: #{ENV['BIOSPHERE_HOME']}}
logg %{BIOSPHERE_SPHERE_PATH: #{ENV['BIOSPHERE_SPHERE_PATH']}}
logg %{BIOSPHERE_SPHERE_AUGMENTATIONS_PATH: #{ENV['BIOSPHERE_SPHERE_AUGMENTATIONS_PATH']}}

include_recipe 'biosphere::augmentations'
include_recipe 'biosphere::homebrew'
include_recipe 'biosphere::rubies'

log %{\033[31mI AM RED YO\033[0m}
