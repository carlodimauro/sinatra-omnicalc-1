require "sinatra"
require "sinatra/reloader"
require "active_support/all"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/hi") do
  "<h1>Hi Friend!</h1>"
  
end

#Square Code --------------------------------------------------------

get("/square/new") do
  erb(:square)
  end

get("/square/results") do
  @the_num = params.fetch("number").to_f
  @theresult = (@the_num ** 2.0)
  erb(:square_results)
end

#Square Root Code ---------------------------------------------------

get("/square_root/new") do
  erb(:squareroot)
  end

get("/square_root/results") do
  @the_num = params.fetch("number").to_f
  @theresult = Math.sqrt(@the_num)
  erb(:square_root_results)
end

#Payment Code ---------------------------------------------------

get("/payment/new") do
  erb(:payment)
  end

get("/payment/results") do
  r = params.fetch("apr").to_f
  pv = params.fetch("principal").to_f
  y = params.fetch("years").to_f
  no_of_p = y * -12.0
  rate = r / 1200.0

  result = (rate * pv) / (1 - ((1 + rate)**no_of_p))
  #@payment_result = sprintf("$%.2f", result.round(2))
  @payment_result = result.to_fs(:currency)

  
  
  @apr = sprintf("%.4f%%", r)
  @principal = sprintf("$%.2f", pv) 
  @years = y
  erb(:payment_results)
end
