# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ipms.local_session',
  :secret      => 'cf3ad08d85022424de8d121339a4962f16ad031fe15a16eb72c2bb637ae013792a5d9840f31ccb81ae7c56a4f6edb9c2bc96806839ec3dbbb5b9ae960cda5611'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
