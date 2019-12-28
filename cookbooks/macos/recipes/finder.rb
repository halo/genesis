user_applications_path = Home.path.join('Applications')

directory user_applications_path.to_s do
  action :delete
  only_if { user_applications_path.empty? }
end
