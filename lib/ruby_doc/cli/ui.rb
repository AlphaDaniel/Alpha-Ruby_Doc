class UI 
#=================Properties=================== 
  attr_reader :counter #For Loading Anim
#===================Input====================== 
  def self.my_gets 
    gets.strip.to_s.downcase
  end
  
  def self.clear 
    system "clear" or system "cls"
  end
#==================Control===================== 
  def self.main_control 
    prompt
    input = my_gets
    
    if input.split.size > 1 
      main_error
    elsif input == "b" 
      paginate("start") 
    elsif input == "*" 
      favorites_list
    elsif input == "exit!" 
      exit!
    elsif input == "?" 
      learn_more
    else 
      matches = Processor.search(input) 
      
      search_error if matches.empty?
      search_list(matches) if matches
    end
  end
  
  def self.favorites_list_control(list) 
    prompt
    input = my_gets
    
    if input == "m" 
      RubyDoc::CLI.start
    elsif input == "exit!"
      exit!
    elsif !input.to_i.between?(1,list.count) 
      list_error(list)
    else 
      Processor.find_fav(list[input.to_i-1])
    end 
    favorites_list_control(list)
  end
  
  def self.display_class_control(doc) 
    prompt
    input = my_gets
    
    case input
    when "full" 
      display_class(doc, "full")
    when "1" 
      method_list(doc)
    when "s" 
      Processor.save(doc)
    when "m" 
      RubyDoc::CLI.start
    when "exit!" 
      exit!
    else 
      display_class_error(doc)
    end 
  end
  
  def self.display_method_control(doc) 
    prompt
    input = my_gets
    
    case input
    when "s" 
      Processor.save(doc)
    when "m" 
      RubyDoc::CLI.start
    when "exit!"
      exit!
    else 
      display_method_error
    end 
  end
  
  def self.list_control(matches) 
    prompt
    input = my_gets
    
    if input == "m" 
      RubyDoc::CLI.start
    elsif input == "exit!"
      exit!
    elsif !input.to_i.between?(1,matches.count) 
      list_error(matches)
    else 
      Processor.load_doc(matches[input.to_i-1])
    end 
    list_control(matches)
  end
  
  def self.browse_control(identifier, page) 
    prompt
    input = my_gets
    
    case input
    when "n" 
      paginate(identifier) 
    when "m" 
      RubyDoc::CLI.start 
    when "exit!" 
      exit!
    end
    
    if !input.to_i.between?(1,page.count) 
      browse_error(input, identifier, page) 
    else 
      Processor.load_doc(page[input.to_i-1])
    end
  end
  
  def self.paginate(identifier) 
    case identifier
    when "start" 
      Processor.page1
    when "Page1" 
      Processor.page2
    when "Page2" 
      Processor.page3
    when "Page3" 
      Processor.last
    end
  end
#==================Display===================== 
#-------------------docs----------------------- 
  def self.display_class(doc, view="short") 
    puts sepL
    # header #
    puts "TITLE: ".cyan + doc.name.upcase 
    puts "TYPE: ".cyan + doc.type.upcase
    puts "\nDESCRIPTION:".cyan 
    
    # documentation #
    if view == "short" 
      puts wrapped(doc.short) 
      puts view_full
      
    elsif view == "full" 
      puts doc.documentation
    end
    
    # footer #
    puts "Methods: ".cyan + "#{doc.methods.count}".yellow
    puts "Source: #{doc.url}".red 
    puts sepR
    
    # control #
    display_class_menu(doc)
    display_class_control(doc)
  end
  
  def self.display_method(doc) 
    puts sepL
    puts "Title: ".cyan + doc.name.upcase 
    puts "Type: ".cyan + doc.type.upcase
    puts "\nDescription:".cyan 
    puts doc.documentation
    puts "Source: #{doc.url}".red 
    puts sepR
     
    #-----------future fix------------#
    # description = doc.doc
    # puts uie.wrapped(description, 55)
    #-----------future fix------------#
    
    display_method_menu 
    display_method_control(doc)
  end
#-------------------lists---------------------- 
  def self.favorites_list 
    # Normalize Favorites List
    list = []
    File.open("#{fav_dir}").each do |li| 
      list << li.chomp
    end
    
    # if favorites is empty error & back to main control
    if list.empty?
      favorites_error
      main_control
      
    else
      # puts sepL
      # puts favorites_message
      puts sepL
      
      # Iterated and display normalized favorites list
      list.each_with_index do |f, index| 
        li = ["#{index + 1}.".yellow, f.cyan]
        puts li.join(" ")
      end
      puts sepR
      
      list_menu(list) 
      favorites_list_control(list) 
    end
  end
  
  def self.search_list(matches) 
    puts sepL
    matches.each_with_index do |doc, index| 
      
      if doc.type == "Class" || doc.type == "Module"
        li = ["#{index + 1}.".yellow, doc.name.light_cyan]
      else
        li = ["#{index + 1}.".yellow, doc.name.cyan]
      end
      
      puts li.join(" ")
    end
    puts sepR
    puts "Classes and Modules are".cyan + " Highlighted".light_cyan
    puts sepR
    
    list_menu(matches)
    list_control(matches)
  end
  
  def self.method_list(doc) 
    puts sepR
    doc.methods.each_with_index do |method, index| 
      
      if !method.nil?
        li = ["#{index + 1}.".yellow, method.name.cyan]
        puts li.join(" ")
      end
       
    end
    puts sepR
    
    list_menu(doc.methods) 
    list_control(doc.methods)
  end
  
  def self.browse_list(page, identifier) 
    puts sepL
    page.each_with_index do |doc, index|  
      
      if doc.type == "Class" || doc.type == "Module"
        li = ["#{index + 1}.".yellow, doc.name.light_cyan]
      else 
        li = ["#{index + 1}.".yellow, doc.name.cyan]
      end
      
      puts li.join(" ")
    end
    
    if identifier == "Last"
      puts sepR
      puts "End of List".red
    end
    puts sepR 
    
    last_page_menu(page) if identifier == "Last"
    browse_menu(page) if !(identifier == "Last")
    
    browse_control(identifier, page)
  end
#-----------------learn more------------------- 
  def self.learn_more 
    puts sepB
    puts "FAVORITES".cyan
    puts sepB
    puts wrapped("Favorites now persisting to gem directory. Your favorites will be accessible globally throughout all your directories unless/until you uninstall this gem.", 55)
    puts "\n"
    puts wrapped("When updating this gem, ruby_doc will check if your favorites file contains any entries (you have favorites saved). If you have entries at the time of the update, it will copy your favorites over to your new (version) gem directory so that you never lose your entries.", 55)
    puts "\n"
    puts "Note:".red
    puts wrapped("The aforementioned 'Update Proof' will not be coded in until the next update but it won't be needed until then regardless so save away.", 55)
    
    puts sepB
    puts "COMING SOON".cyan
    puts sepB
    puts "\n" + Scraper.coming_soon + "\n"
    
    puts sepB
    puts "CHANGELOG".cyan
    puts sepB
    puts "\n" + Scraper.changelog
    
    main_menu("learn")
    main_control
  end
#===================Menus====================== 
  def self.main_menu(from="default") 
    puts sepR
    puts "To search... enter a single (".cyan + "word".yellow + ") associated with Ruby. \nI will try to find a match in my database for you.".cyan
    puts sepB
    puts "To Browse enter (".cyan + "b".yellow + ")".cyan + " ||| ".black + "To view your favorites enter (".cyan + "*".yellow + ")".cyan
    puts sepR
    puts "Enter '?' to Learn More about Alpha Ruby-Doc\n".black unless from == "learn"
    print cyanH("\n   Happy Hunting!   ")
  end
  
  def self.list_menu(matches) 
    puts "View Doc ".light_cyan + "(".cyan + "#".yellow + ")".cyan 
    puts "Return To ".cyan + "Main Menu ".light_cyan + "(".cyan + "m".yellow + ")".cyan
    puts "Leave".light_cyan + " (".cyan + "exit!".yellow + ")".cyan
    print randQ
  end
  
  def self.display_class_menu(doc) 
    puts "Save To ".cyan + "Favorites ".light_cyan + "(".cyan + "s".yellow + ")".cyan
    puts "View ".cyan + "Methods ".light_cyan + "For #{doc.name} (".cyan + "1".yellow + ")".cyan
    puts "Return To ".cyan + "Main Menu ".light_cyan + "(".cyan + "m".yellow + ")".cyan
    puts "Leave".light_cyan + " (".cyan + "exit!".yellow + ")".cyan
    print randQ
  end
  
  def self.display_method_menu 
    puts "Save To ".cyan + "Favorites ".light_cyan + "(".cyan + "s".yellow + ")".cyan
    puts "Return To ".cyan + "Main Menu ".light_cyan + "(".cyan + "m".yellow + ")".cyan
    puts "Leave".light_cyan + " (".cyan + "exit!".yellow + ")".cyan
    print randQ
  end
  
  def self.browse_menu(page) 
    puts "View Doc ".light_cyan + "(".cyan + "#".yellow + ")".cyan 
    puts "Next Page ".light_cyan + "(".cyan + "n".yellow + ")".cyan 
    puts "Return To ".cyan + "Main Menu ".light_cyan + "(".cyan + "m".yellow + ")".cyan
    puts "Leave".light_cyan + " (".cyan + "exit!".yellow + ")".cyan
    print randQ
  end
  
  def self.last_page_menu(page)
    puts "View Doc ".light_cyan + "(".cyan + "#".yellow + ")".cyan 
    puts "Return To ".cyan + "Main Menu ".light_cyan + "(".cyan + "m".yellow + ")".cyan
    puts "Leave".light_cyan + " (".cyan + "exit!".yellow + ")".cyan
    print randQ
  end
#===================Error====================== 
  def self.main_error 
    sleep(0.1)
    print redH("\n Input Must Be 1 Word, 'b' to browse, or 'exit!' to leave ")
    main_control
  end
  
  def self.favorites_error 
    sleep(0.1)
    print redH("\n You have no favorites saved ")
    main_control
  end
  
  def self.search_error 
    puts sepB
    puts "NO CIGAR!".red
    puts "I couldn't find what you're looking for.".black 
    puts "How about trying a Ruby ".black + "Method" + ", ".black + "Class" + " or ".black + "Module" + " name.".black
    puts sepB
    
    puts "NOT SURE?".red
    puts "You can always browse with ".black + "'b'" + " & learn something new.".black + ":)"
    puts sepB
    
    print redH("\n Try a new word, enter 'b' to browse, or 'exit!' to leave ")
    main_control
  end
  
  def self.list_error(matches) 
    print redH("\n Enter selection number, 'm' for main or 'exit!' to leave ")
  end
  
  def self.nil_error 
    print redH("\n Enter selection number, 'm' for main or 'exit!' to leave ")
  end
  
  def self.display_class_error(doc) 
    print redH("\n Please enter '1' to view methods, 'm' for main, or 'exit!' to leave ")
    display_class_control(doc)
  end
  
  def self.display_method_error 
    print redH("\n Please enter 'm' for main menu or 'exit!' to leave ")
    display_method_control
  end
  
  def self.browse_error(input, identifier, page)  
    if identifier == "Last"
      list_error(page)
      browse_control(identifier, page)
    else
      browse_list_error(page)
      browse_control(identifier, page)
    end
  end
  
  def self.browse_list_error(page)
    print redH("\n Enter # to view, 'n' for next page 'm' for main or 'exit!' to leave ")
  end
#============================================== 
                                        #CANDY
#================== Quotes===================== 
  def self.randQ 
    puts sepB
    html = Nokogiri::HTML(open("https://fortrabbit.github.io/quotes/"))
    container = html.search(".row.gutter-l.wrap")
    
    quotes = container.search("p").map {|quote| quote.text.gsub(/[\n]\s+/, "")}
    quote = " "+ quotes[rand(0..180)]+ " "
    wrapped(quote, 55).black
  end
#=============Loading Animation================ 
  # Goes above iterator
  def self.loading_message 
    puts cyanH(" Loading Database ") + " ☠️"
  end
  # Goes inside iterator - last line
  def self.loading_animation 
    loading = ""
    print loading << ". ".cyan if 
    @counter == 50 || @counter == 100 || @counter == 150 || @counter == 200 || 
    @counter == 250 || @counter == 300 || @counter == 350 || @counter == 400 || 
    @counter == 450 || @counter == 500 || @counter == 550 || @counter == 600 || 
    @counter == 650 || @counter == 700 || @counter == 750 || @counter == 800 || 
    @counter == 850 || @counter == 900 || @counter == 950 || @counter == 1000 || 
    @counter == 1150 || @counter == 1200 || @counter == 1250 || @counter == 1300 || 
    @counter == 1350 || @counter == 1400 || @counter == 1450 || @counter == 1500 
  end
#=============Colors/Candy Props=============== 
#-------------------input---------------------- 
  def self.prompt 
    print " >> ".cyan
  end
#-----------------separators------------------- 
  def self.sepL 
    "=".cyan*28 + "=".white*28
  end
    
  def self.sepR 
    "=".white*28 + "=".cyan*28
  end
  
  def self.sepB 
    "=".black*56
  end
#------------------messages-------------------- 
  def self.redH(str) 
    str.colorize(color: :white, background: :red)
  end #red highlight
  
  def self.cyanH(str) 
    str.colorize(color: :white, background: :cyan)
  end #cyan highlight
#------------------strings--------------------- 
  def self.rdo_prefix 
    "https://ruby-doc.org/core-2.4.3/"
  end
  
  def self.view_full 
    puts sepB
    puts "To View Full Documentation Enter".cyan + " full".yellow
    puts sepB
  end 
    
  # currently not being used
  def self.wrapped(s, width=60) 
	  lines = []
	  line = ""
	 
	  s.split(/\s+/).each do |word|
	    if line.size + word.size >= width
	      lines << line
	      line = word
	    elsif line.empty?
	     line = word
	    else
	     line << " " << word
	   end
	   end
	   lines << line if line
	  return lines.join "\n"
	end #wrap string
#=================Signature==================== 
  def self.signature 
    puts "\n"+"=".white*28 + "=".cyan*28 
puts %q(               ALPHA™ 
               ╦═╗╦ ╦╔╗ ╦ ╦  ╔╦╗╔═╗╔═╗╔═╗
               ╠╦╝║ ║╠╩╗╚╦╝   ║║║ ║║  ╚═╗
               ╩╚═╚═╝╚═╝ ╩   ═╩╝╚═╝╚═╝╚═╝).cyan end
#==============================================
end