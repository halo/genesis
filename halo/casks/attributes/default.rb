default[:cask][:apps] = %w[
  cyberduck
  disk-inventory-x
  firefox
  google-chrome
  mumble
  textmate
  torbrowser
  vienna
]

if Biosphere.profile? :orange, :green, :blue
  default[:cask][:apps] += %w[
    quicksilver
  ]
end
# Checksum error? arrsync

if Biosphere.profile? :orange, :blue
  default[:cask][:apps] += %w[
    docker
    postico
  ]
end

if Biosphere.profile? :blue
  default[:cask][:apps] += %w[
    adium
  ]
end
