# frozen_string_literal: true

# name: discourse-heti
# about: Integrate Heti styling and functionality into Discourse.
# version: 1.1.0
# authors: TreeNewBee
# url: https://github.com/TheTNB/discourse-heti
# required_version: 2.7.0

module ::DiscourseHeti
  PLUGIN_NAME = "discourse-heti"
  SCRIPT_PATH = "/plugins/#{PLUGIN_NAME}/javascripts/heti-addon.min.js"
  SCRIPT_HASH =
    Digest::SHA256.hexdigest(
      File.read(
        "#{Rails.root}/plugins/#{PLUGIN_NAME}/public/javascripts/heti-addon.min.js",
      ),
    )
  STYLESHEET_PATH = "/plugins/#{PLUGIN_NAME}/stylesheets/heti.min.css"
  STYLESHEET_HASH =
    Digest::SHA256.hexdigest(
      File.read(
        "#{Rails.root}/plugins/#{PLUGIN_NAME}/public/stylesheets/heti.min.css",
      ),
    )
end

register_html_builder("server:before-head-close") do |controller|
  path = DiscourseHeti::STYLESHEET_PATH
  path += "?v=#{DiscourseHeti::STYLESHEET_HASH}" if Rails.env.production?
  "<link href=\"#{Discourse.base_path}#{path}\" rel=\"stylesheet\" nonce=\"#{controller.helpers.try(:csp_nonce_placeholder)}\">"
end

register_html_builder("server:before-head-close") do |controller|
  path = DiscourseHeti::SCRIPT_PATH
  path += "?v=#{DiscourseHeti::SCRIPT_HASH}" if Rails.env.production?
  "<script src=\"#{Discourse.base_path}#{path}\" nonce=\"#{controller.helpers.try(:csp_nonce_placeholder)}\"></script>"
end

after_initialize do
  extend_content_security_policy(style_src: [::DiscourseHeti::STYLESHEET_PATH])
  extend_content_security_policy(script_src: [::DiscourseHeti::SCRIPT_PATH])
end
