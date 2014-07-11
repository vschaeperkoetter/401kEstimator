get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/result' do
  installment = params[:installment].to_i
  rate =  params[:rate].to_i
  years = params[:years].to_i
  result = ( installment * ( ( (rate/100.0) + 1)**years )/((rate/100.0)) )
  "The Portfolio will be worth: $" + result.floor.to_s.gsub(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1,")
end