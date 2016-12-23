class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  http_basic_authenticate_with name: ENV['API_USERNAME'], password: ENV['API_PASSWORD']

  def home
  end

  def fetch_query
    query = request.query_string

    if query.present?
      portal    = Portal.new
      response  = portal.fetch(query)
      render json: response.body
    else
      render json: 'tsadra query wrapper'
    end
  end

  def ask_query
    query = request.query_string

    if query.present?
      portal = Portal.new
      response = portal.ask_query(query)
      render json: response
    else
      render json: 'tsadra Special:Ask query'
    end
  end

  def tunnel # bypass DRL firewall
    query = request.query_string

    if query.present?
      portal = Portal.new
      response = portal.bypass_firewall(query)

      send_data response.body,
        disposition: 'inline',
        type: response.content_type,
        status: response.code
    else
      render json: 'tsadra tunnel'
    end
  end
end
