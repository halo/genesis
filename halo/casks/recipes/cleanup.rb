# Remove ~/Applications directory if empty.

file Home.path.join('Applications', '.localized').to_s do
  action :delete
  ignore_failure true
end

directory Home.path.join('Applications').to_s do
  action :delete
  ignore_failure true
end
