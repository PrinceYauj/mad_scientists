cd /vagrant/app
bundler install
sudo -u postgres createdb --owner=mad_scientists testdb
sequel -Em db/migrations postgres://mad_scientists:1@localhost:5432/mad_scientists
sequel -Em db/migrations postgres://mad_scientists:1@localhost:5432/testdb