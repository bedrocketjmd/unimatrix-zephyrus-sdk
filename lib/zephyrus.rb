require 'active_support'
require 'active_support/all'
require 'fnv'

require 'zephyrus/configuration'
require 'zephyrus/response'
require 'zephyrus/request'
require 'zephyrus/parser'
require 'zephyrus/serializer'
require 'zephyrus/operation'

require 'zephyrus/resources/base'

# Errors
require 'zephyrus/resources/error'
require 'zephyrus/resources/forbidden_error'
require 'zephyrus/resources/attribute_error'
require 'zephyrus/resources/missing_parameter_error'
require 'zephyrus/resources/attribute_error'
require 'zephyrus/resources/malformed_parameter_error'
require 'zephyrus/resources/not_found_error'

# Resources
require 'zephyrus/resources/input'
require 'zephyrus/resources/output'
require 'zephyrus/resources/output_routing_output'
require 'zephyrus/resources/output_transcoding_output'
