# name: Disable Messaging To Admin
# about: disables users from bombarding admin with PMs
# version: 0.1
# authors: Maysam Torabi
# Many thanks to Régis Hanol ! https://meta.discourse.org/t/hourly-backup-only-if-something-has-changed/27274/12

PLUGIN_NAME ||= "disable_messaging_to_admin".freeze

after_initialize do
  Guardian.class_eval do
    alias_method :orig_can_send_private_message?, :can_send_private_message?
    def can_send_private_message?(target)
      orig_can_send_private_message?(target) and target.id > 90
    end
  end
end
