Vagrant.configure("2") do |config|
  config.vm.define :repo do |repo|
    common_setup(repo)
    repo.vm.network :private_network, ip: "192.168.33.10"
    repo.vm.hostname = "repo"

    repo.vm.provision :puppet do |puppet|
      common_modules_and_default_manifest(puppet, "base_repo.pp")
    end
  end

  config.vm.define :node do |node|
    common_setup(node)
    node.vm.network :private_network, ip: "192.168.33.20"
    node.vm.hostname = "node"

    node.vm.provision :puppet do |puppet|
      common_modules_and_default_manifest(puppet, "base_node.pp")
    end
  end
end

def common_modules_and_default_manifest(puppet, default_manifest)
  puppet.module_path = "modules"
  puppet.manifests_path = "manifests"
  puppet.manifest_file  = default_manifest
end

def common_setup(instance)
  instance.vm.box_url = "http://files.vagrantup.com/lucid32.box"
  instance.vm.box = "lucid32"    

  instance.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 1024]
  end  
end

