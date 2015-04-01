Vagrant.configure("2") do |config|
 config.vm.box = "dummy"
 config.vm.synced_folder '.', '/vagrant', :disabled => true
 config.ssh.host = "gw2.wishabi.ca"

 config.vm.provider :aws do |aws, override|
    aws.access_key_id = ENV['AWS_ACCESS_KEY_ID']
    aws.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY_ID']
    aws.keypair_name = "wishabi-keypair"
    aws.ami = "ami-58e09d31"
    aws.instance_type = "m1.large"
    aws.region = "us-east-1"
    aws.security_groups = ["flyers_staging", "puppet" ]
    aws.tags = { "hostname" => ENV['USER']+".flyers.wishabi.net", "puppetclass" => "flyers_vagrant" }

    override.ssh.username = "jlittle"
    override.ssh.private_key_path = "/Users/jasonlittle/.ssh/id_rsa"

 end
end
