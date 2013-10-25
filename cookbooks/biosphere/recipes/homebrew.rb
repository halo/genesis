homebrew_path = Pathname.new File.join(ENV['BIOSPHERE_SPHERE_PATH'], 'homebrew')

# –––––––––––––––––––––
# Homebrew Installation
# –––––––––––––––––––––

if offline?
  logg(%{Skipping installation of <b>homebrew</b> because I'm not online.}) { color :yellow }
else
  logg %{Ensuring correct homebrew revision...}
  git homebrew_path.to_s do
    repository 'git://github.com/mxcl/homebrew.git'
    revision node[:biosphere][:homebrew][:revision]
    action :sync
  end
end

brew_executable = homebrew_path.join('bin/brew')

# –––––––––––––––––
# Homebrew Formulae
# –––––––––––––––––

node[:biosphere][:homebrew][:formulae].each do |formula|

  formula_path = homebrew_path.join "Cellar/#{formula}"

  if formula_path.exist?
    logg(%{Skipping installation of <b>#{formula}</b> via homebrew because it already exists.}) { color :yellow }
  else
    if offline?
      logg(%{Skipping installation of formula <b>#{formula}</b> because I'm not online.}) { color :yellow }
    else
      logg %{Installing #{formula} via homebrew...}
      bash "install-#{formula}" do
        code "#{brew_executable} install #{formula}"
      end
    end
  end

end

# ––––––––––––––––––––
# Post-install configs
# ––––––––––––––––––––

if node[:biosphere][:homebrew][:formulae].include? 'mysql'

  etc_path          = homebrew_path.join 'etc'
  mysql_config_path = etc_path.join 'my.cnf'

  unless etc_path.directory?
    logg(%{Skipping configuration of <b>mysql</b> because homebrew is missing.}) { color :yellow }
  else
    logg %{Configuring MySQL...}
    cookbook_file mysql_config_path do
      mode '0644'
      source "mysql/my.cnf"
    end
  end

  mysql_dir = homebrew_path.join 'var/mysql/mysql'

  unless mysql_config_path.exist?
    logg(%{Skipping initialization of <b>mysql</b> because MySQL seems not to be configured.}) { color :yellow }
  else
    if mysql_dir.exist?
      logg(%{Skipping initialization of <b>mysql</b> because it is already initialized.}) { color :yellow }
    else
      logg %{Initializing Mysql DB...}
      bash "initialize-mysql" do
        cwd ENV['HOME']
        environment({ 'HOME' => ENV['HOME'] })
        code %{mysql_install_db --verbose --user=`whoami` --basedir="$(#{brew_executable} --prefix mysql)" --datadir=#{homebrew_path}/var/mysql --tmpdir=/tmp}
      end
    end
  end

end
