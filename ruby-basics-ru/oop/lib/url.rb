# frozen_string_literal: true

require 'forwardable'
require 'uri'
# BEGIN
class Url
  extend Forwardable

  def_delegators :@uri, :scheme, :host, :port

  def initialize(url)
    @uri = URI.parse(url)
  end

  def query_params
    params = URI.decode_www_form(@uri.query || '')
    params.to_h.transform_keys(&:to_sym)
  end

  def query_param(key, default = nil)
    params = query_params
    params[key] || default
  end

  def ==(other)
    other.is_a?(Url) &&
      scheme == other.scheme &&
      host == other.host &&
      port == other.port &&
      query_params == other.query_params
  end

  def <=>(other)
    query_params.sort <=> other.query_params.sort
  end
end
# END

