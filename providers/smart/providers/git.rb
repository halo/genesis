action :sync_clean_master do
  git "clone `#{new_resource.destination}`" do
    repository new_resource.repository
    destination new_resource.destination
    action :checkout
    revision 'master'
    user new_resource.user
    group new_resource.group
    only_if { Internet.online? }
  end

  execute "remove deploy branch of `#{new_resource.destination}`" do
    command 'git checkout master && git branch -D deploy'
    cwd new_resource.destination
    user new_resource.user
    group new_resource.group
    only_if { Internet.online? }
    only_if 'git rev-parse --abbrev-ref HEAD | grep -w deploy', cwd: new_resource.destination
    only_if '[ -z "$(git status --porcelain)" ]', cwd: new_resource.destination
  end

  # Cannot use git resource here because it changes the remote origin.
  execute "sync if on master – `#{new_resource.destination}`" do
    command 'git pull origin master'
    cwd new_resource.destination
    user new_resource.user
    group new_resource.group
    only_if { Internet.online? }
    only_if 'git rev-parse --abbrev-ref HEAD | grep -w master', cwd: new_resource.destination
    only_if '[ -z "$(git status --porcelain)" ]', cwd: new_resource.destination
  end
end

def whyrun_supported?
  true
end
