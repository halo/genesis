profile_hash = {
  'PayloadDisplayName' => 'OS Search',
  'PayloadRemovalDisallowed' => false,
  'PayloadIdentifier' => Identifier.join('search'),
  'PayloadUUID' => 'B7778BA4-9AAE-4A45-9C8B-1452C6904A3D',
  'PayloadScope' => 'System',
  'PayloadType' => 'Configuration',
  'PayloadOrganization' => Identifier.organization,
  'PayloadVersion' => 1,
  'PayloadContent' => [
    {
      'PayloadDisplayName' => 'Disable Search Homing',
      'PayloadType' => 'com.apple.assistant.support',
      'PayloadIdentifier' => Identifier.join('search.settings'),
      'PayloadUUID' => '75F30CCB-6522-4A8A-A575-BF2E37EEB4CF',
      'PayloadVersion' => 1,
      'PayloadEnabled' => true,
      'Search Queries Data Sharing Status' => 2,
      'Siri Data Sharing Opt-In Status' => 2,
    }
  ]
}

directory node[:macos][:mobileconfig_path].to_s do
  recursive true
end

file node[:macos][:mobileconfig_path].join('search.mobileconfig') do
  content profile_hash.to_plist
end
