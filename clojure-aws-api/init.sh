# install clojure tools (lein)
curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > lein
sudo mv lein /usr/local/bin/lein
sudo chmod a+x /usr/local/bin/lein

# install clj cli
sudo apt-get install -y bash curl rlwrap
curl -O https://download.clojure.org/install/linux-install-1.10.2.774.sh
chmod +x linux-install-1.10.2.774.sh
sudo ./linux-install-1.10.2.774.sh
