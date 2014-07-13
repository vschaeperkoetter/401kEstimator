get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/result' do
	frequency = params[:frequency].to_i
	principal = params[:principal].to_i
  contribution = params[:contribution].to_i
  rate =  params[:rate].to_i
  years = params[:years].to_i
	result = ( principal * (rate/100.0 + 1)**years ) + ( contribution/frequency *((1 + rate/100.0)**years-1)/( (1+(rate/100.0))**(1.0/frequency)-1) )
	@result = "$" + result.floor.to_s.gsub(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1,")
  # "The Portfolio will be worth: $" + result.floor.to_s.gsub(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1,")
  erb :result
end

