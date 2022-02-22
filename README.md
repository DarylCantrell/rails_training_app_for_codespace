## Prep a github/github codespace for training use

### Create a new codespace

Go [here](https://github.com/github/github/codespaces) and spin up a new codespace.

Install recommended extensions. Optionally, remove the ruby-rubocop extension which only seems to spam errors at you.

### Only needed once: download and install a bunch of stuff from the command line

You only need to run these commands once after you create a brand new Codespace. You can pull new changes each day without re-running these commands.

Connect to the new codespace in VS Code, and open a bash console (Ctrl-`).

Run these:

``` sh
# Ruby header files
apt-get install -y ruby-dev

# Node Version Manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.bashrc
nvm --version

# NodeJS and Node Package Manager
nvm install --lts
node --version
npm --version

# Yarn
npm install --global yarn
yarn --version

# Rails
gem install rails -v 7.0.2

# Fetch the whole rails app
cd /workspaces
git clone https://github.com/DarylCantrell/rails_training_app_for_codespace.git movie_app
```

### Needed before first run, and whenever you pull latest changes:

Whenever you pull latest changes from this fork, run these in the console to rebuild things:

```
cd /workspaces/movie_app

rm Gemfile.lock
rm yarn.lock

bin/bundle install

yarn install --check-files

bin/rails webpacker:install
```

For now, you'll get some errors about python not being installed.

### Database reset or migration

If this is a new codespace or the database schema changed, you'll need to catch up. Depending on your situation, you might reset it to "start over" or just run needed migrations. On a new codespace you'll have to reset it.

```
bin/rails db:reset
```
**OR**
```
bin/rails db:migrate
```

### Run some tests to make sure everything is working.

```
bin/rails test:system test:models
```
