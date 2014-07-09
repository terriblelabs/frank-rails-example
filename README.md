# Frank Rails Example

Example app for ios testing using Frank with a Rails backend.

## Running the tests

```bash
cd rails/
bundle install
rake db:setup

# start the script that listens for commands from Frank 
./frank_listener.sh
```

In another terminal:

```bash
cd ios/
bundle install
rake pod:install
rake frank
```

