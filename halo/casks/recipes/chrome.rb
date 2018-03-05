chrome_suppport_path = Home.path.join 'Library', 'Application Support', 'Google', 'Chrome'
master_preferences_path = chrome_suppport_path.join 'Google Chrome Master Preferences'

logg %(Pre-Configuring Chrome...)

directory chrome_suppport_path.to_s do
  recursive true
end

cookbook_file master_preferences_path.to_s do
  mode '0644'
  source 'chrome_master_preferences.json'
end
