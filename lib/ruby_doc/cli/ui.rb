class UI 
#=============================================# 
                                    #IMPORTANT
#=================Properties=================== 
  attr_reader :counter #For Loading Anim
#===================Input====================== 
  def self.my_gets 
    gets.strip.to_s.downcase
  end
#==================Control===================== 
  def self.main_control 
    prompt
    input = my_gets
    
    if input.split.size > 1 
      main_error
    elsif input == "b"
      DataProcessor.paginate 
    elsif input == "exit!"
      exit!
    else
      Processor.search(input)
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
  end
  
  def self.display_class_control(doc) 
    prompt
    input = my_gets
    
    case input
    when "1" 
      method_list(doc)
    when "m" 
      RubyDoc::CLI.start
    when "exit!" 
      exit!
    else 
      display_class_error(doc)
    end 
  end
  
  def self.display_method_control 
    prompt
    input = my_gets
    
    case input
    when "m" 
      RubyDoc::CLI.start
    when "exit!"
      exit!
    else 
      display_method_error
    end 
  end
  
  # def self.browse_control(currentPg, docRange) 
  #   prompt
  #   input = my_gets
    
  #   case input
  #   when "n"
  #     DataExtras.nextPage(currentPg) 
  #   when "m"
  # RubyDoc::CLI.start 
  #   when "exit!"
  #     exit!
  #   end
  #   # else
  #   !input.to_i.between?(1,docRange.count) ? browse_error(input, currentPg, docRange) : Doc.display(docRange[input.to_i-1])
  # end
  
  # def self.list_control(doc) 
  #   prompt
  #   input = my_gets
    
  #   if input == "m" 
  # RubyDoc::CLI.start
  #   elsif input == "exit!" 
  #     exit!
  #   elsif !input.to_i.between?(1,doc.methods.count) ? list_error(doc) : RubyDoc::CLI::UI.meth_shuttle(input, doc)
  #   end
  # end
#==================Display===================== 
  def self.search_list(matches) 
    UI.sepL
    matches.each_with_index do |doc, index| 
      
      if doc.type == "Class" || doc.type == "Module"
        li = ["#{index + 1}.".yellow, doc.name.light_cyan]
      else
        li = ["#{index + 1}.".yellow, doc.name.cyan]
      end
      
      puts li.join(" ")
    end
    puts sepR
    
    list_menu(matches)
    list_control(matches)
  end
  
  def self.display_class(doc) 
    UI.sepL
    puts "TITLE: ".cyan + doc.name.upcase 
    puts "TYPE: ".cyan + doc.type.upcase
    puts "\nDESCRIPTION:".cyan 
    puts doc.description
    puts "Methods: ".cyan + "#{doc.methods.count}".yellow
    puts "Source: #{doc.url}".red 
    puts sepR
    
    display_class_menu(doc)
    display_class_control(doc)
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
  
    
    
  def self.display_method(doc) 
    UI.sepL
    puts "Title: ".cyan + doc.name.upcase 
    puts "Type: ".cyan + doc.type.upcase
    puts "\nDescription:".cyan 
    puts doc.doc
    puts "Source: #{doc.url}".red 
    puts sepR
     
    #-----------future fix------------#
    # description = doc.doc
    # puts uie.wrapped(description, 55)
    #-----------future fix------------#
    
    display_method_menu 
    display_method_control
  end
#===================Menus====================== 
  def self.main_menu 
    puts sepR#
    puts "Enter a ".cyan + "word ".yellow + "associated with the Ruby Language & I will ".cyan
    puts "try to find a match in my database for you.".cyan
    sepL#
    puts "\You can also enter".cyan + " 'b'".yellow + " to browse instead.".cyan + " Happy Hunting!".cyan
    print cyanH("\n If You're Searching... Single Word Inputs Only Please ")
  end
  
  def self.list_menu(matches)  
    puts "To ".cyan + "View ".yellow + "(Enter ".cyan + "#".yellow + ")".cyan + " eg. #{matches.count.to_s} for #{matches[matches.count-2].name}".black
    
    puts "To return to".cyan + " Main Menu".yellow + " (Enter ".cyan + "'m'".yellow + ")".cyan
    puts "To".cyan + " Leave".yellow + " (".cyan + "'exit!'".yellow + ")\n".cyan
    print randQ
  end
  
  def self.display_class_menu(doc) 
    puts "To ".cyan + "View Methods ".yellow + "For".cyan + " #{doc.name}".yellow + " (Enter ".cyan + "'1'".yellow + ")".cyan
    puts "To Return To".cyan + " Main Menu".yellow + " (Enter ".cyan + "'m'".yellow + ")".cyan
    puts "To".cyan + " Leave".yellow + " (".cyan + "'exit!'".yellow + ")\n".cyan
    print randQ
  end
  
  def self.display_method_menu 
    puts "To Return To".cyan + " Main Menu".yellow + " (Enter ".cyan + "'m'".yellow + ")".cyan
    puts "To".cyan + " Leave".yellow + " (".cyan + "'exit!'".yellow + ")\n".cyan
    print randQ
  end
  
  # def self.browse_menu 
  #   puts "To ".cyan + "View An Item ".yellow + "From This List (Enter Doc Number eg.".cyan + "'1'".yellow + ")".cyan
  #   puts "To ".cyan + "Browse Next Page ".yellow + "(Enter ".cyan + "'n'".yellow + ")".cyan
  #   puts "\nBack to".cyan + " Main Menu".yellow + " (Enter ".cyan + "'m'".yellow + ")\n".cyan
  #   print randQ
  # end
#===================Error====================== 
  def self.main_error 
    sleep(0.1)
    print redH("\n Input Must Be 1 Word, 'b' to browse, or 'exit!' to leave ")
    main_control
  end
  
  def self.search_error 
    puts "\nNO CIGAR!".red
    puts "I couldn't find what you're looking for.".black 
    puts "How about trying a Ruby ".black + "Method" + ", ".black + "Class" + " or ".black + "Module" + " name.".black
    puts "=".black*56
    
    puts "\nNOT SURE?".red
    puts "You can always browse with ".black + "'b'" + " & learn something new.".black + ":)"
    puts "=".black*56
    
    print redH("\n Try a new word, enter 'b' to browse, or 'exit!' to leave ")
    main_control
  end
  
  def self.list_error(matches) 
    print redH("\n Enter a number between 1 and #{matches.count}, 'm' for main or 'exit!' to leave ")
    list_control(matches)
  end
  
  def self.display_class_error(doc) 
    print redH("\n Please enter '1' to view methods, 'm' for main, or 'exit!' to leave ")
    display_class_control(doc)
  end
  
  def self.display_method_error 
    print redH("\n Please enter 'm' for main menu or 'exit!' to leave ")
    display_method_control
  end
  
  # def self.browse_error(input, currentPg, docRange) 
  #   if currentPg == "Last"
  #     list_error(docRange)
  #     browse_control(currentPg, docRange)
  #   else
  #     print redH("\n Enter a number between 1 and #{docRange.count} n for next or m for main ")
  #     browse_control(currentPg, docRange)
  #   end
  # end
#============================================== 
                                        #CANDY
#===============Quote Scraper================== 
  def self.randQ
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
    @counter == 100 || @counter == 200 || @counter == 300 || @counter == 400 || 
    @counter == 500 || @counter == 600 || @counter == 700 || @counter == 800 || 
    @counter == 900 || @counter == 1000 || @counter == 1100 || @counter == 1200 || 
    @counter == 1300 || @counter == 1400 || @counter == 1500 || @counter == 1600 || 
    @counter == 1700 || @counter == 1800 || @counter == 1900 || @counter == 2000 || 
    @counter == 2100 || @counter == 2200 || @counter == 2300 || @counter == 2320 || 
    @counter == 2340 || @counter == 2360 || @counter == 2380 || @counter == 2400
  end
#=============Colors/Candy Props=============== 
  def self.prompt 
    print " >> ".cyan
  end
  
  def self.sepL 
    puts "=".cyan*28 + "=".white*28
  end
    
  def self.sepR 
    "=".white*28 + "=".cyan*28
  end

  def self.redH(str) 
    str.colorize(color: :white, background: :magneta)
  end#red highlight
  
  def self.cyanH(str) 
    str.colorize(color: :white, background: :cyan)
  end#cyan highlight

  def self.wrapped(s, width=78) 
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