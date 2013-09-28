class ProgramsController < ApplicationController
	attr_accessor :method_loc, :program
	def new
	end
	def create
		#HASH MAP OF METHOD LOCATIONS
		@method_loc = Hash.new
		parse_lines
	end
	
	private
		#PASSES THROUGH PROGRAM TO GAIN ESSENTIAL INFORMATION YAY
		def parse_lines
			#"TOKENIZE" THE PROGRAM (HAHA)
			@program = params[:post][:code].split("\r\n")
			mem_method(program)
		end
		#RECORDS METHOD LOCATIONS 
		def mem_method(program)
			in_method = false
			saw_body = false
			method_begin = false
			index = 0
			for line in program
				if !in_method and !(line.split(' ')[0] == "Serves" or line == "")
					method_loc[line.downcase] = index
					in_method = true
					method_begin = false
					saw_body = false
				else
					if saw_body
						in_method = false
					else
						if line == "Method."
							method_begin = true
						elsif method_begin
							saw_body = true
						end
					end
				end
				index = index + 1
			end
			logger.info method_loc.inspect
		end
end
