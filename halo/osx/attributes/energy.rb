if ENV['SUDO']
  default[:osx][:settings] += %{

    Don't fall asleep
    sudo pmset -a displaysleep 0 sleep 0

  }
end
