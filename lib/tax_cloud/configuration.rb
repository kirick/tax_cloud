module TaxCloud #:nodoc:
  # TaxCloud gem configuration.
  class Configuration
    # TaxCloud login ID.
    attr_accessor :api_login_id
    # TaxCloud API key.
    attr_accessor :api_key
    # Optional USPS username.
    attr_accessor :usps_username
    # Savon client option open_timeout.
    attr_accessor :open_timeout
    # Savon client option read_timeout.
    attr_accessor :read_timeout

    attr_accessor :ssl_version
    attr_accessor :ssl_verify_mode
    attr_accessor :ssl_cert_file
    attr_accessor :ssl_cert_key_file
    attr_accessor :ssl_ca_cert_file
    attr_accessor :ssl_cert_key_password

    def initialize
      @open_timeout = 2
      @read_timeout = 2
    end

    # Check the configuration.
    #
    # Will raise a TaxCloud::Errors::MissingConfigOption if any of the API login ID or the API key are missing.
    def check!
      fail TaxCloud::Errors::MissingConfigOption.new('api_login_id') unless api_login_id && api_login_id.strip.length > 0
      fail TaxCloud::Errors::MissingConfigOption.new('api_key') unless api_key && api_key.strip.length > 0
    end
  end
end
