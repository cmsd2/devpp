Getting started
---------------

# Install dependencies:
bundle install --path=vendor/bundle

# Updating modules:
bundle exec librarian-puppet install

# Starting a VM
vagrant up

# Applying the manifests:
puppet apply --modulepath=modules manifests/dev.pp