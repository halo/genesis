profile_hash = {
  'PayloadDisplayName' => 'OS Spotlight',
  'PayloadRemovalDisallowed' => false,
  'PayloadIdentifier' => Identifier.join('spotlight'),
  'PayloadUUID' => 'AAAFD54A-2446-4BA5-A609-3E4132CE8A65',
  'PayloadScope' => 'System',
  'PayloadType' => 'Configuration',
  'PayloadOrganization' => Identifier.organization,
  'PayloadVersion' => 1,
  'PayloadContent' => [
    {
      'PayloadDisplayName' => 'Spotlight',
      'PayloadType' => 'com.apple.applicationaccess',
      'PayloadIdentifier' => Identifier.join('spotlight.settings'),
      'PayloadUUID' => '8FD9DDD1-822A-4AB8-9C9B-2030936B9CAA',
      'PayloadVersion' => 1,
      'PayloadEnabled' => true,
      allowSpotlightInternetResults: false,
    }
  ]
}

osx_profile 'Configure Privacy' do
  profile profile_hash
end
