# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_trajet_colle_session',
  :secret      => '02dbe27010fe5102b409a79cf45c13de2f45e5e4daf0411441d6b30956a1421e4da36fa9bc20ae6eec80ae76f82bab5143263dcdaa7b1a6b333e9eda0b674231'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
