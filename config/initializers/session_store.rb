# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_nuggethub_session',
  :secret      => '9a309ba7992e0d9149eabc26418bab499ea8e014ccecd3d63220c9a4c51431ddde15fed5fc2dc2f9779e94002928e46721b9728cbb05a90270bfa44a1a2d1d96'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
