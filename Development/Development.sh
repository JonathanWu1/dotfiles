# Rider
sudo snap install rider --classic

# Visual Studio Code
sudo snap install code --classic


# Tenant clipboard feature
 cp tenant  ~/.local/bin
# check folder is added into the path env variable
echo $PATH
# if folder isn't in path add it using this:
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc source ~/.bashrc
source ~/.bashrc

# Create executable 
chomd +x ~/.local/bin/tenant