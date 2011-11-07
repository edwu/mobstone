# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_migration_session',
  :secret      => '7f983a9b0aea6537d3111888e6bd494dbfe30c0b28f1c91b6b028b14caeb473b2bbbd4a13ae0fe69c99f1e289560b3eaae32096cafd993ae50477f272ae7db6a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
