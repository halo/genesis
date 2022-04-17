default[:mas][:apps] = [
  409183694, # Keynote
  409201541, # Pages
  409203825, # Numbers
]

if Console.profile? :orange
  default[:mas][:apps] += [
    406825478, # Telephone SIP client
    497799835, # Xcode
    824171161, # Affinity Designer
  ]
end
