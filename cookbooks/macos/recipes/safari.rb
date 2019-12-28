profile_hash = {
  'PayloadDisplayName' => 'App Safari',
  'PayloadRemovalDisallowed' => false,
  'PayloadIdentifier' => Identifier.join('safari'),
  'PayloadUUID' => '35A6D885-3486-4B6B-AAF6-D0B0AD3B2CE4',
  'PayloadScope' => 'System',
  'PayloadType' => 'Configuration',
  'PayloadOrganization' => Identifier.organization,
  'PayloadVersion' => 1,
  'PayloadContent' => [
    {
      'PayloadDisplayName' => 'Safari',
      'PayloadType' => 'com.apple.applicationaccess',
      'PayloadIdentifier' => Identifier.join('safari.settings'),
      'PayloadUUID' => '4F9C4B28-4ABB-4BA9-BC98-6F6C6EA03AB2',
      'PayloadVersion' => 1,
      'PayloadEnabled' => true,
      safariAllowAutoFill: false,
      HomePage: 'https://example.com'
    }
  ]
}

osx_profile 'Configure Safari' do
  profile profile_hash
end
