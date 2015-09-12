Getting started
---------------

# Install dependencies:
bundle install --path=vendor/bundle

# Updating modules:
bundle exec librarian-puppet install

# Starting a VM
vagrant up

# Testing with test kitchen:
bundle exec kitchen test

# Applying the manifests:
puppet apply --modulepath=modules manifests/dev.pp