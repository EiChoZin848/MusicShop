# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_MusicShop_session',
  :secret      => '46b6310ccf87514b71a9ab75cf9a302da658fafb8fc904bf04113f6694f7ce53f76c45502d02dc5f78437d81dcd4840dade85a44e06d7613d38b883943dfc044'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
