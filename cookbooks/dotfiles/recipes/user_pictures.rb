container = Genesis::Paths.user_pictures_unicolor

directory container.to_s do
  recursive true
end

colors = %w[blue green orange pink red]

colors.each do |color|
  cookbook_file container.join("#{color}.png").to_s do
    source "#{color}.png"
    owner 'root'
    group 'wheel'
  end
end
