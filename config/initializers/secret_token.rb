# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Membership::Application.config.secret_key_base = 'a6f2f8e1d5e90a72b0b4fb84b5a7e689dbcfcf7de48c3829cc4dc88d2493b2daf3a66cd27c280cf92a6f9e98984f5638c14ab38ee3d271241a9301e3a113bb81'
