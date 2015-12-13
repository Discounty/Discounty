GrapeSwaggerRails.options.url = '/api/swagger_doc'
GrapeSwaggerRails.options.before_filter_proc = proc do
  GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port
end

GrapeSwaggerRails.options.app_name = 'Discounty'
GrapeSwaggerRails.options.doc_expansion = 'full'
GrapeSwaggerRails.options.api_key_name = 'access_token'
