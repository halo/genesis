container = Home.path.join('Library/User Pictures/Sphere')

directory container.to_s do
  recursive true
end

cookbook_file container.join('orange.png').to_s do
  source 'orange.png'
end
