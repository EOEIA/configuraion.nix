{ 
programs.bash = {
enable = true;
shellAliases = {

##### aliases ######
rebuild = "sudo nixos-rebuild switch --flake .";
# = "home-manager switch";
# sudo nixos-rebuild switch --flake ./
# sudo nano nix/flake.nix

ehm = "sudo nano /home/e/nix/home.nix";
ei3 = "sudo nano /home/e/.config/i3/config";
hms = "home-manager switch --flake ./#e";
enix = "sudo nano configuration.nix";
e = "sudo nvim";
x = "exit";
rm = "rm -i";
cp = "cp -i";
mv = "mv -i";

k = "kitty";

#".." = "cd ..";
#"..." = "cd ../..";
#"...." = "cd ../../..";
#home = "cd ~";
#back = "cd -";

#ll = "ls -alF";
#la = "ls -A";
#l = "ls -CF";

#gs = "git status";
#ga = "git add";
#gc = "git commit";
#gp = "git push";
#gl = "git pull";
#gd = "git diff";
#gco = "git checkout";
#gb = "git branch";

#f = "find . -name";
#grep = "grep --color=auto";

#myip = "curl ifconfig.me";
#ports = "netstat -tulanp";

#untar = "tar -zxvf";
#targz = "tar -czvf";

#cpuinfo = "lscpu";
#meminfo = "free -h";
#diskinfo = "df -h";

#cls = "clear";
#edit = "nano";

#please = "sudo";
#pls = "sudo";
pwease = "sudo";

reload = "source ~/.bashrc";

##### aliases ######

};
};
}
