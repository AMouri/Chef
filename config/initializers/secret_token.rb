# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Chef::Application.config.secret_key_base = 'bd86c84218e1ec7f4a5ab1359d70e1ef2e7ab5411c682fd0a75b93696149d6b197534347ee82ada6328377c770b820f7449acd1769d33c89e2dd48b81646d712'
