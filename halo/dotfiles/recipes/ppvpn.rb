container = Homebrew.bin_path

cookbook_file container.join('ppvpn').to_s do
  source 'ppvpn'
end
