
Vagrant.configure("2") do |config|
  config.vm.box = "precise32"
  config.vm.hostname = "myprecise.box"
  config.vm.network :private_network, ip: "10.10.0.1"

  config.vm.provider :virtualbox do |vb|
    vb.customize [
      "modifyvm", :id,
      "--cpuexecutioncap", "50",
      "--memory", "256",
    ]
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "site.pp"
    puppet.module_path = "puppet/modules"
  end
end