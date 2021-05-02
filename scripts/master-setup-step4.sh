# Go to home directory
cd ~

# You can change what anaconda version you want at 
# https://repo.continuum.io/archive/
curl -O https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh
bash https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh -b -p ~/anaconda3
rm https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh
echo 'export PATH="~/anaconda/bin:$PATH"' >> ~/.bashrc

# Refresh basically
source .bashrc

conda update conda
conda activate base

# Installing pytorch (has to be done through pip)
pip install torch torchvision torchaudio

# Installing sparktorch
pip install sparktorch


# Commented out as we probably do not need it

# Installing docker
# Remove old docker versions
#sudo apt-get remove docker docker-engine docker.io containerd runc

# Allow use of repositories over HTTPS
# sudo apt-get update
# sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release

# Add Docker’s official GPG key
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Creating a stable repository
# echo \
#   "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Installing docker engine
# sudo apt-get install docker-ce docker-ce-cli containerd.io

# Installing pytorch 

