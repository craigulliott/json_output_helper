module JsonOutputHelper

  # JSON helpers
  # ----------------------------------------------------------------------------------------------------
  # a nice standard response schema for json
  def json_response(type, hash = {})
    # we require one of these types
    unless [ :ok, :redirect, :error ].include?(type)
      raise "Invalid json response type: #{type}"
    end

    # To keep the structure consistent, we'll build the json 
    # structure with these default properties.
    default_json = { 
      :status => type, 
      :html => nil, 
      :notice => nil, 
      :to => nil }.merge(hash)

    return default_json
  end

  # render our standardized json response
  def render_json_response(type, hash = {})
    render :json => json_response(type, hash)
  end

end

class ActionController::Base
  include JsonOutputHelper
end

