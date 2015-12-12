GrapeSwaggerRails.options.url = '/swagger_doc.json'
GrapeSwaggerRails.options.before_filter_proc = proc do
  GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port
end

GrapeSwaggerRails.options.app_name = 'Discounty'
