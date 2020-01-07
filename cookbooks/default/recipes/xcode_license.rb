xcodebuild_executable = Pathname.new('/usr/bin/xcodebuild')
xcode_app = Pathname.new('/Applications/Xcode.app')

execute "#{xcodebuild_executable} -license accept" do
  only_if { xcodebuild_executable.exist? }
  only_if { xcode_app.exist? }
end
