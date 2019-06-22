profile_hash = {
  'PayloadDisplayName' => 'OS Diagnostics',
  'PayloadRemovalDisallowed' => false,
  'PayloadIdentifier' => Identifier.join('diagnostics'),
  'PayloadUUID' => '3F5F77C6-182B-46F3-B224-0C5DDE5F23B6',
  'PayloadScope' => 'System',
  'PayloadType' => 'Configuration',
  'PayloadOrganization' => Identifier.organization,
  'PayloadVersion' => 1,
  'PayloadContent' => [
    {
      'PayloadDisplayName' => 'Diagnostics and Crash Reports',
      'PayloadType' => 'com.apple.SubmitDiagInfo',
      'PayloadIdentifier' => Identifier.join('diagnostics.settings'),
      'PayloadUUID' => '3EC9C570-A48D-4D86-A87F-EAAB129E3D7C',
      'PayloadVersion' => 1,
      'PayloadEnabled' => true,
      AutoSubmit: false,
    }
  ]
}

osx_profile 'Configure Diagnostics' do
  profile profile_hash
end
