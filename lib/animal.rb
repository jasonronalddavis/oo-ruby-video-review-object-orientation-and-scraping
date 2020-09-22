require "nokogiri"
require "open-uri"
require "pry"

    

class Animal

    attr_accessor :name, :phylum, :klass, :kingdom, :genus, :species, :order, :family
    @@all = []


    #hook
    def initialize
        @@all << self
    end


    # self.all - class method, class getter
    def self.all
        @@all
    end


    #constructor
    def self.new_from_wikipedia(url)
        animal = Animal.new

        #constructor data
        doc = Nokogiri::HTML(open(url))

        animal.name = doc.search("h1#firstHeading").text
        animal.kingdom = doc.search("span.Kingdom").text	    
         animal.phylum = doc.search("span.Phylum").text	    
          animal.klass = doc.search("span.class").text	    
          animal.order = doc.search("span.order").text	    
         animal.family = doc.search("span.Family").text	    
          animal.genus = doc.search("span.Genus").text
         

        animal
        #binding.pry
end


def self.new_from_google_search(keywords)
end

def self.new_from_spreadsheet(csv)
end
end

#hippo = Animal.new_from_wikipedia("https://en.wikipedia.org/wiki/Hippopotamus")