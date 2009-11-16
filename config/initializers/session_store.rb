# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tc_session',
  :secret      => 'ea8feab2d734655999f8d7592760ca9d172c388962619ba7603df02fabd069b0cbf10b942aad6bda2453ef85b215c6e4f4706c1f838b075e5d5aeba876400284'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
