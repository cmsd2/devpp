Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/vivid64"
  
  config.vm.provision "puppet" do |puppet|
  	puppet.manifest_file = "dev.pp"
	puppet.module_path = "modules"
  end
end
