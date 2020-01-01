profile_hash = {
  'PayloadDisplayName' => 'OS Screensaver',
  'PayloadRemovalDisallowed' => false,
  'PayloadIdentifier' => Identifier.join('screensaver'),
  'PayloadUUID' => 'D6D39C85-F26D-47AA-99B0-F80C1E33A863',
  'PayloadScope' => 'System',
  'PayloadType' => 'Configuration',
  'PayloadOrganization' => Identifier.organization,
  'PayloadVersion' => 1,
  'PayloadContent' => [
    {
      'PayloadDisplayName' => 'Screensaver',
      'PayloadType' => 'com.apple.screensaver.user',
      'PayloadIdentifier' => Identifier.join('screensaver.settings'),
      'PayloadUUID' => '82BF8BED-FE31-4276-AC96-94575D5AAD6C',
      'PayloadVersion' => 1,
      'PayloadEnabled' => true,
      idleTime: 0,
    }
  ]
}

osx_profile 'Configure Screensaver' do
  profile profile_hash
end
