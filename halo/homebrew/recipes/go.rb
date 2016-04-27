if node[:homebrew][:formulae].include? 'go'

  go_path            = Biosphere.sphere_path.join 'go'
  go_executable_path = Homebrew.bin_path.join 'go'

  logg %{Ensuring $GOPATH directory...}
  directory go_path.to_s do
    mode '0755'
    recursive true
  end

  if online?
    packages = %w{
      github.com/vbatts/go-google-authenticator
    }

    packages.each do |name|
      logg %{Installing #{packages} via go get...}
      bash "install-go-#{name}" do
        code "#{go_executable_path} get #{name}"
        env 'GOPATH' => go_path.to_s
      end
    end

  else
    logg(%{Skipping go package installation of go packages because I'm not online.}) { color :yellow }
  end

end
