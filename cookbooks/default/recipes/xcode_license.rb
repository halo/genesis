xcodebuild_executable = Pathname.new('/usr/bin/xcodebuild')

execute "#{xcodebuild_executable} -license accept" do
  only_if { xcodebuild_executable.exist? }
end
