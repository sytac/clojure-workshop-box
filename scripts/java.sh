# Install Oracle Java7
# see http://www.webupd8.org/2012/01/install-oracle-java-jdk-7-in-ubuntu-via.html

# Add the repository that contains packaged Oracle JDKs
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update

# Mark the license as accepted
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get install -y oracle-java7-installer

# Set default java
sudo apt-get install oracle-java7-set-default
