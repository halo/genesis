default[:mas][:apps] = [
  409183694, # Keynote 9.2.1
  409201541, # Pages 8.2.1
  409203825, # Numbers 6.2.1
]

if Console.profile? :orange, :blue
  default[:mas][:apps] += [
    497799835, # Xcode 11.3
    824171161, # Affinity Designer 1.7.3
  ]
end
