profile_hash = {
  'PayloadDisplayName' => 'OS Dock',
  'PayloadRemovalDisallowed' => false,
  'PayloadIdentifier' => Identifier.join('dock'),
  'PayloadUUID' => '75A1240E-E928-40AA-8992-BEDFEAF33615',
  'PayloadScope' => 'System',
  'PayloadType' => 'Configuration',
  'PayloadOrganization' => Identifier.organization,
  'PayloadVersion' => 1,
  'PayloadContent' => [
    {
      'PayloadDisplayName' => 'Dock Settings',
      'PayloadType' => 'com.apple.dock',
      'PayloadIdentifier' => Identifier.join('dock.settings'),
      'PayloadUUID' => 'B5DCC150-CA31-466F-831A-3CD943FDC446',
      'PayloadVersion' => 1,
      'PayloadEnabled' => true,

      'launchanim' => false,
      'show-process-indicators' => 'true',
      'position-immutable' => true,
      'static-apps' => [
        {
          'tile-type' => 'file-tile',
          'tile-data' => {
            'file-type' => 1,
            'file-data' => {
              '_CFURLString' => '/System/Applications/Mail.app',
              '_CFURLStringType' => 0
            },
          }
        },
        {
          'tile-type' => 'file-tile',
          'tile-data' => {
            'file-type' => 1,
            'file-data' => {
              '_CFURLString' => '/Applications/Google Chrome.app',
              '_CFURLStringType' => 0
            },
          }
        },
        {
          'tile-type' => 'file-tile',
          'tile-data' => {
            'file-type' => 1,
            'file-data' => {
              '_CFURLString' => '/Applications/Safari.app',
              '_CFURLStringType' => 0
            },
          }
        }
      ]
    }
  ]
}

osx_profile 'Configure Dock' do
  profile profile_hash
end
