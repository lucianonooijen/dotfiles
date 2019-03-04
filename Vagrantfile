Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.box_version = "20180920.0.0"
  config.vm.provision "shell",
    inline: "sudo apt-get install -y software-properties-common && sudo add-apt-repository ppa:neovim-ppa/stable && sudo apt-get update && sudo apt install -y git vim neovim make zsh"
end
