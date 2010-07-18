require 'rubygems'
require 'sinatra'
require 'json'
require 'ruby-debug'

ANIMAL_DATA = [
  {:name => 'aardvark', :popularity => 10},
  {:name => 'aardwolf', :popularity => 10},
  {:name => 'wolf', :popularity => 50},
  {:name => 'monkey', :popularity => 100}, # Everyone loves monkeys!
  {:name => 'donkey', :popularity => 25},
  {:name => 'ant', :popularity => 20},
  {:name => 'cat', :popularity => 75},
  {:name => 'bat', :popularity => 5},
  {:name => 'platypus', :popularity => 90},
  {:name => 'octopus', :popularity => 60},
  {:name => 'grid bug', :popularity => 3},
  {:name => 'triggerfish', :popularity => 30},
  {:name => 'clownfish', :popularity => 30},
  {:name => 'flatfish', :popularity => 30},
  {:name => 'accountantfish', :popularity => 30},
].freeze

get '/' do
  erb :index
end

get '/search' do
  search_name = params['name']
  matches = ANIMAL_DATA.select{|animal| animal[:name] =~ /#{search_name}/}

  response.headers['Content-Type'] = 'application/json'
  matches.to_json
end

get '/popular_animals' do
  sorted_animals = ANIMAL_DATA.sort_by{|animal| animal[:popularity]}.reverse
  popular_animals = sorted_animals[0,3]

  response.headers['Content-Type'] = 'application/json'
  popular_animals.to_json
end
