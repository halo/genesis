container = Home.path.join('Library/User Pictures/Unicolor')

directory container.to_s do
  recursive true
end

%w[orange red].each do |name|
  cookbook_file container.join("#{name}.png").to_s do
    source "#{name}.png"
  end
end
