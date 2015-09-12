Development machine puppet manifests
====================================

Setup
-----

Install dependencies:
```
bundle install --path=vendor/bundle
```

Install modules:
(this also needs to be done when updating modules inside the local modules dir)
```
bundle exec librarian-puppet install --path=modules
```

Common Tasks
------------

Starting a VM
```
vagrant up
```

Testing with test kitchen:
```
bundle exec kitchen test
```

Run and re-run manifests with test kitchen:
```
bundle exec kitchen converge
```

Applying the manifests to the current machine:
```
puppet apply --modulepath=modules manifests/dev.pp
```