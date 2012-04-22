require 'bundler'
Bundler.require
DataMapper::setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/database.db")
DataMapper::Property::String.length(250)

set :sessions, true

class Applicant
  include DataMapper::Resource
  
  property :id, Serial
  property :created_at, DateTime
  property :updated_at, DateTime
  property :firstname, String
  property :lastname, String
  property :email, String, :required => true, :format => :email_address
  property :phone, String
  property :dob, String
  property :employment, String
  property :employment_explanation, String
  property :address_street, String
  property :address_apt, String
  property :address_city, String
  property :address_state, String
  property :address_zip, String
  property :rental, String
  property :optionsRadios, String
  property :hours_alone, String
  property :other_people, String
  property :children, String
  property :others_allow, String
  property :had_dogs, String
  property :had_cats, String
  property :fostered_dogs, String
  property :fostered_cats, String
  property :foster_exp, String
  property :number_dogs, String
  property :number_cats, String
  property :vet_name, String
  property :vet_number, String
  property :provide_food, String
  property :provide_litter, String
  property :provide_vet, String
  property :provide_transport, String
  property :all_cats, String
  property :adult_cat, String
  property :injured_a_cat, String
  property :ill_a_cat, String
  property :pregnant_cat, String
  property :cat_kittens, String
  property :young_cat, String
  property :injured_y_cat, String
  property :ill_y_cat, String
  property :bottle_kittens, String
  property :all_dogs, String
  property :adult_dog, String
  property :injured_a_dog, String
  property :ill_a_dog, String
  property :pregnant_dog, String
  property :dog_puppies, String
  property :young_dog, String
  property :injured_y_dog, String
  property :ill_y_dog, String
  property :bottle_puppies, String
  property :why_foster, String
  property :start, String
  property :length, String
  property :contacted, String
  property :notes, String
  has n, :posts
  
end

class Post
  include DataMapper::Resource
  
  property :slug, String , key: true, unique_index: true, default: lambda { |resource,prop| resource.title.downcase.gsub " ", "-" }  
  property :created_at, DateTime
  property :updated_at, DateTime
  property :firstname, String 
  property :lastname, String 
  property :email, String
  property :phone, String
  property :dob, String
  property :employment, String
  property :employment_explanation, String
  property :address_street, String
   property :address_apt, String
   property :address_city, String
   property :address_state, String
   property :address_zip, String
   property :rental, String
   property :optionsRadios, String
   property :hours_alone, String
   property :other_people, String
   property :children, String
   property :others_allow, String
   property :had_dogs, String
   property :had_cats, String
   property :fostered_dogs, String
   property :fostered_cats, String
   property :foster_exp, String
   property :number_dogs, String
   property :number_cats, String
   property :vet_name, String
   property :vet_number, String
   property :provide_food, String
   property :provide_litter, String
   property :provide_vet, String
   property :provide_transport, String
   property :all_cats, String
   property :adult_cat, String
   property :injured_a_cat, String
   property :ill_a_cat, String
   property :pregnant_cat, String
   property :cat_kittens, String
   property :young_cat, String
   property :injured_y_cat, String
   property :ill_y_cat, String
   property :bottle_kittens, String
   property :all_dogs, String
   property :adult_dog, String
   property :injured_a_dog, String
   property :ill_a_dog, String
   property :pregnant_dog, String
   property :dog_puppies, String
   property :young_dog, String
   property :injured_y_dog, String
   property :ill_y_dog, String
   property :bottle_puppies, String
   property :why_foster, String
   property :start, String
   property :length, String
   property :contacted, Boolean, :required => true, :default => false  
   property :notes, String
  
  belongs_to :applicant

end
DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do
  # @users = User.all :order => :id.desc
	@title = 'All Users'
	erb :front
#	erb :form
end

post '/send' do
	n = Applicant.new
	n.created_at = Time.now
	n.firstname = params[:firstname]
	n.lastname = params[:lastname]
	n.email = params[:email]
	n.phone = params[:phone]
	n.dob = params[:dob]
	n.employment = params[:employment]
	n.employment_explanation = params[:employment_explanation]
	n.address_street = params[:address_street]
	n.address_apt = params[:address_apt]
	n.address_city = params[:address_city]
	n.address_state = params[:address_state]
	n.address_zip = params[:address_zip]
	n.rental = params[:rental]
	n.optionsRadios = params[:optionsRadios]
	n.hours_alone = params[:hours_alone]
	n.other_people = params[:other_people]
	n.children = params[:children]
	n.others_allow = params[:others_allow]
	n.had_dogs = params[:had_dogs]
	n.had_cats = params[:had_cats]
	n.fostered_dogs = params[:fostered_dogs]
	n.fostered_cats = params[:fostered_cats]
	n.foster_exp = params[:foster_exp]
	n.number_dogs = params[:number_dogs]
	n.number_cats = params[:number_cats]
	n.vet_name = params[:vet_name]
	n.vet_number = params[:vet_number]
	n.provide_food = params[:provide_food]
	n.provide_litter = params[:provide_litter]
	n.provide_vet = params[:provide_vet]
	n.provide_transport = params[:provide_transport]
	n.all_cats = params[:all_cats]
	n.adult_cat = params[:adult_cat]
	n.injured_a_cat = params[:injured_a_cat]
	n.ill_a_cat = params[:ill_a_cat]
	n.pregnant_cat = params[:pregnant_cat]
	n.cat_kittens = params[:cat_kittens]
	n.young_cat = params[:young_cat]
	n.injured_y_cat = params[:injured_y_cat]
	n.ill_y_cat = params[:ill_y_cat]
	n.bottle_kittens = params[:bottle_kittens]
	n.all_dogs = params[:all_dogs]
	n.adult_dog = params[:adult_dog]
	n.injured_a_dog = params[:injured_a_dog]
	n.ill_a_dog = params[:ill_a_dog]
	n.pregnant_dog = params[:pregnant_dog]
	n.dog_puppies = params[:dog_puppies]
	n.young_dog = params[:young_dog]
	n.injured_y_dog = params[:injured_y_dog]
	n.ill_y_dog = params[:ill_y_dog]
	n.bottle_puppies = params[:bottle_puppies]
	n.why_foster = params[:why_foster]
	n.start = params[:start]
	n.length = params[:length]
	n.contacted = params[:contacted]
  n.notes = params[:notes]
	
	
	n.updated_at = Time.now
	puts "Model valid? #{n.valid?}"
	puts n.inspect
	n.save
#	redirect '/'
  erb :show     
end

post '/login' do
  if(params[:password] == "n0p3" && params[:username] == "partner")
    session["logged_in"] = true
    redirect "/partner"
  else
    session["logged_in"] = false
    redirect "/"
  end
end

get '/partner' do
  if(session["logged_in"] == true)
    erb :partner
  else
    redirect "/"
  end
end

get '/:id' do  
  if(session["logged_in"] == true)
    @applicant = Applicant.get params[:id]  
    @title = "Edit Applicant ##{params[:id]}"  
    erb :edit
  else
    redirect "/"
  end
end

  
post '/:id' do  
  n = Applicant.get params[:id] 
  n.notes = params[:notes]
  n.contacted = params[:contacted] ? 1 : 0
  n.updated_at = Time.now  
  puts "Model updated? #{n.valid?}"
  n.save  
  redirect '/partner'  
end

get '/:id/contacted' do  
  n = Applicant.get params[:id]  
  n.contacted = n.contacted ? 0 : 1 # flip it  
  n.updated_at = Time.now  
  n.save  
  redirect '/partner'  
end