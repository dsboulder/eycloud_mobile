# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_eycloud_session',
  :secret      => 'df487653746dd88b277be899966f46ec26d390d9fb9e8905ca7a282e7a8c508dbeb9d02dc9ffa9a5bf0c8ea335cc91aa4900916ebba183fa45634f56a4ce86b8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
