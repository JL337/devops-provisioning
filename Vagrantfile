# Install required plugins
required_plugins = ["vagrant-hostsupdater"]
required_plugins.each do |plugin|
    exec "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/xenial64"
    config.vm.network "private_network", ip: "192.168.10.150"
    config.hostsupdater.aliases = ["database.local"]
    config.vm.provision "shell", path: "environment/db/provision.sh", privileged: false
    #sync the environment folder at host, with folder db in the guest
    config.vm.synced_folder "./environment/db", "/home/ubuntu/db"
end
