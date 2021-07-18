class ApplicationController < ActionController::Base

  def homepage

    render("homepage/index.html.erb")

  end

  def forex

    url = "https://api.exchangerate.host/symbols"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @curr_collection = parsed_data.fetch("symbols").keys

    render("forex_templates/forex.html.erb")

  end

  def foreign

    url = "https://api.exchangerate.host/symbols"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @curr_collection = parsed_data.fetch("symbols").keys

    @foreign = params.fetch("foreign")

    render("forex_templates/foreign.html.erb")
  end

  def domestic

    @foreign = params.fetch("foreign")
    @domestic = params.fetch("domestic")

    url = "https://api.exchangerate.host/convert?from=" + @foreign + "&to=" + @domestic
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @conversion = parsed_data.fetch("result")

    render("forex_templates/domestic.html.erb")
  end

end
