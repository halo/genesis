Configuring a new Mac.

### Get git (Xcode Tools)

Start Terminal and run `git`.

Click `Install` and then `Agree` and wait 5 minutes.

### Get and run genesis

```bash
git clone https://github.com/halo/genesis ~/.genesis
~/.genesis/bin/genesis
```

### Load your 1Password account

Start `1Password` and enter your account credentials.

### Setup VPN manually as needed



### Data easy to forget when restoring

* Development Postgres DB
* SSH keys at `~/.ssh`
* Uncommited changes in `.dotfiles` or `.githooks` or `.genesis`
* Files on the Desktop

### Apps to manually restore

* Mail at `~/Library/Accounts` and `~/Library/Mail`
* Reminders at `~/Library/Reminders`
* Postico at `~/Library/Containers/at.eggerapps.Postico/Data/Library/Application\ Support/Postico`

### Drivers and basics

* Create sharing user
* Install printer drivers
* Install card reader drivers

