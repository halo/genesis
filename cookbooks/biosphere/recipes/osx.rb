logg %{Setting OS X defaults...}

settings = node[:biosphere][:osx][:settings].split("\n").map(&:strip).map { |string| string unless string.empty? }.compact.each_slice(2)

settings.each do |description, command|
  bash description do
    code command
  end
end
