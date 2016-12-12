require 'net/https'
require 'addressable/uri'

module Zephyrus

  class Request

    def initialize( default_parameters = {} )
  
      # parse the API uri
      uri = URI.parse( Zephyrus.configuration.api_uri )

      # construct http request
      @http = Net::HTTP.new( uri.host, uri.port )
      
      # use ssl when https is the uri scheme                       
      @http.use_ssl = ( uri.scheme == 'https' )
      @http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      # retain the default parameters 
      @default_parameters = default_parameters.stringify_keys
  
    end

    def destroy( path, parameters = {} )

      begin  
               
        request = Net::HTTP::Delete.new( 
          compose_request_path( path, parameters ), 
          { 'Content-Type' =>'application/json' }
        )

        response = Response.new( @http.request( request ) )
        
      rescue Timeout::Error
        response = nil
      end

      response
    
    end

    def get( path, parameters = {} )
  
      response = nil
      
      begin  
        response = Response.new( 
          @http.get( compose_request_path( path, parameters ) ) 
        )
      rescue Timeout::Error
        response = nil
      end
        
      response
                      
    end

    def post( path, parameters = {}, body = {} )
  
      response = nil
      
      begin  
               
        request = Net::HTTP::Post.new( 
          compose_request_path( path, parameters ), 
          { 'Content-Type' =>'application/json' }
        )
        request.body = body.to_json

        response = Response.new( @http.request( request ) )
        
      rescue Timeout::Error
        response = nil
      end
        
      response
                      
    end

    protected; def compose_request_path( path, parameters = {} )

      parameters = @default_parameters.merge( parameters.stringify_keys )
      addressable = Addressable::URI.new
      
      addressable.path = path 
      addressable.query = parameters.to_param unless parameters.blank?

      addressable.to_s

    end

  end

end
