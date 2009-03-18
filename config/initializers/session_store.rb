# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_shoutt_session',
  :secret      => '389af96b3754ab6b3e8e8d8d0742b757bc10fa72b4bcea557972c3aa45f3263601cfc60887a8a20d305ece9d5d4592a384b1eb3225581e774713d7fcfdfe4d9c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
