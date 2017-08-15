default[:cask][:applinks] = Home.path.join('Applications') # File.join(ENV['BIOSPHERE_SPHERE_PATH'], 'caskapps')

default[:cask][:apps] = %w[
  cyberduck
  disk-inventory-x
  firefox
  google-chrome
  mumble
  torbrowser
  textmate
  clipgrab
]

if %w[orange green blue].include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:cask][:apps] += %w[
    arrsync
    quicksilver
  ]
end

if %w[orange blue].include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:cask][:apps] += %w[
    postico
  ]
end

if %w[blue].include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:cask][:apps] += %w[
    adium
  ]
end
