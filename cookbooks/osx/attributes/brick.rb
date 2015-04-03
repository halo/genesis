default[:osx][:settings] += %{

  Brick -> Global User Rules
  defaults write com.funkensturm.Brick rules.user -array "mumble" "sc2" "bonjour"


  Brick -> Mumble Name
  defaults write com.funkensturm.Brick rule.mumble.name "Mumble"

  Brick -> Mumble Comment
  defaults write com.funkensturm.Brick rule.mumble.comment "Mumble"

  Brick -> Mumble Rules
  defaults write com.funkensturm.Brick rule.mumble.rules -array "'pass out on { en0 en1 en2 en3 en4 } proto { udp tcp } from any to any port 64738'"


  Brick -> SCII Name
  defaults write com.funkensturm.Brick rule.sc2.name "SCII"

  Brick -> SCII Comment
  defaults write com.funkensturm.Brick rule.sc2.comment "Star Craft II"

  Brick -> SCII Rules
  defaults write com.funkensturm.Brick rule.sc2.rules -array "'pass out on { en0 en1 en2 en3 en4 } proto { udp tcp } from any to any port { 443 1119 1120  3724 4000 6112 6113 6114 }'"


  Brick -> Bonjour Name
  defaults write com.funkensturm.Brick rule.bonjour.name "Bonjour"

  Brick -> Bonjour Comment
  defaults write com.funkensturm.Brick rule.bonjour.comment "Bonjour network service detection"

  Brick -> Bonjour Rules
  defaults write com.funkensturm.Brick rule.bonjour.rules -array "'pass out on { en0 en1 en2 en3 en4 } proto { udp } from any to any port 5353'"

}
