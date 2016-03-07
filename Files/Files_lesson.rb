Creating a file

irb :001 > my_file = File.new("simple_file.txt", "w+")
 => #<File:simple_file.txt>
irb :002 > my_file.close

The Ruby IO Docs contain an extensive list of modes and options. 
Note that the file will be created in the directory from which irb was opened.

r: read-only (starts at beginning of file)
w: write-only (if the file exists, overwrites everything in the file)
w+: read and write (if the file exists, overwrites everything in the file)
a+: read-write (if file exists, starts at end of file. Otherwise creates a new file). Suitable for updating files.a

Reading file contents is easy in Ruby. Here are two options:

File.read("file_name") - Spits out entire contents of the file.
File.readlines("file_name") - Reads the entire file based on individual lines and returns those lines in an array.File

File.open("simple_file.txt", "w") { |file| file.write("adding first line of text") }

Alternatively, we could open the file, write to it and finally close it. Let's see how that works with puts:

irb :001 >  sample = File.open("simple_file.txt",  "w+")
 => #<File:simple_file.txt>
irb :002 > sample.puts("another example of writing to a file.")
 => nil
irb :003 > sample.close
 => nil
irb :004 > File.read("simple_file.txt")
 => "another example of writing to a file.\n"
Finally, lets insert more text into simple_file.txt:

irb :005 > File.open("simple_file.txt", "a+") do |file|
irb :006 >     file << "Here we are with a new line of text"
irb :007?>   end
 => #<File:simple_file.txt (closed)>
irb :008 > File.readlines("simple_file.txt").each do |line|
irb :009 >     puts line
irb :010?>   end
another example of writing to a file.
Here we are with a new line of text
 => ["another example of writing to a file.\n", "Here we are 
 
 irb :001 > File.new("dummy_file.txt", "w+")
 => #<File:dummy_file.txt>
irb :002 > File.delete("dummy_file.txt")
 => 1
 
 EXERCISE 1
 
 irb :01 > simple = File.read("simple_file.txt")
 => "another example of writing to a file.\nHere we are with a new line of textWriting to files in Ruby is simple."
irb :002 > original = File.new("original_file.txt", "w+")
 => #<File:original_file.txt>
ibr :003 > File.open(original, "a") do |file|
irb :004 >     file.puts simple
irb :005?>   end
 => nil
irb :006 > File.read(original)
 => "another example of writing to a file.\nHere we are with a new line of textWriting to files in Ruby is simple.\n"
 
EXERCISE 2

rb :001 > d = Dir.new(".")
 => #<Dir:.>
irb :02 > while file = d.read do
irb :03 >     puts "#{file} has extension .txt" if File.extname(file) == ".txt"
irb :04?>   end
simple_file.txt has extension .txt
original_file.txt has extension .txt
 => nil
 
 irb :001 > require 'pathname'
 => true
irb :002 > pn = Pathname.new(".")
irb :003 > pn.entries.each { |f| puts "#{f} has extension .txt" if f.extname == ".txt" }
simple_file.txt has extension .txt
original_file.txt has extension .txt
 => [#<Pathname:simple_file.txt>, #<Pathname:cultures.json>, #<Pathname:ruby_book>, #<Pathname:articles.xml>, #<Pathname:chair.rb>, #<Pathname:.git>, #<Pathname:original_file.txt>, #<Pathname:feedzilla.json>, #<Pathname:slashdot>, #<Pathname:articles.json>, #<Pathname:..>, #<Pathname:.>]
 
 {
  "newspaper_name": "Cooking Today",
  "issue_date": "November 15th, 2014",
  "articles": [
    {
      "title": "Bacon Cooking",
      "link": "http://baconcooklove.com",
      "summary": "Just a few thousand ideas about bacon"
    },
    {
      "title": "Cooking with leftovers",
      "link": "http://love.com",
      "summary": "Just a few thousand ideas about tasting love twice"
    }
  ]
}

require 'json'
require 'nokogiri'
require 'axlsx'
require 'csv'

slashdot_articles = []
File.open("slashdot.xml", "r") do |f|
  doc = Nokogiri::XML(f)
  slashdot_articles = doc.css('item').map { |i|
    {
      title: i.at_css('title').content,
      link: i.at_css('link').content,
      summary: i.at_css('description').content
    }
  }
end

feedzilla_articles =[]
File.open("feedzilla.json", "r") do |f|
  items = JSON.parse(f.read)
  feedzilla_articles= items['articles'].map { |a|
    {
      title: a['title'],
      link: a['url'],
      summary: a['summary']
    }
  }
end

sorted_articles =  (feedzilla_articles + slashdot_articles).sort_by {|a| a[:title]}

CSV.open("article.csv", "wb") do |csv|
  sorted_articles.each { |a| csv << [ a[:title], a[:link], a[:summary] ]  }
end

pkg = Axlsx::Package.new
pkg.workbook.add_worksheet(:name => "Articles") do |sheet|
 sorted_articles.each { |a| sheet.add_row [a[:title], a[:link], a[:summary]] }
end
pkg.serialize("articles.xlsx")
