#!/usr/bin/ruby

class Tree 
	DEBUG = false
	TAB = "-"
	VER = "|"
	def initialize(param_info)
		@root = param_info.root
		@t = TAB
		@size = param_info.size
		@excl_hidden = param_info.excl_hidden
		@threshold = param_info.threshold
	end
	
	def print(current = @root, tab = @t)
		printf("Entering with current: " + current + " tab: " + tab, true)
		all_files = Dir.entries(current)
		last_slash = current.rindex("/") + 1
		to_print = current[last_slash..-1]
		size_str = ""
		if @size  
			#kinda dirty removal of symbols in the name that break du. Must remove with regex
			exec_str = "du -sm " + current.gsub(" ", "\\ ").gsub("(", "\\(").gsub(")", "\\)")
			printf(exec_str, true)
			size_str = `#{exec_str}`
			size_str = size_str.match("^[0-9]+").to_s
			if @threshold > 0
				sz = size_str.to_i
				if sz < @threshold
					return
				end
			end
			
			size_str = " (" + size_str + "MB)"
		end
		printf(tab + to_print + size_str, false)
		all_files.each do |file|
			if file == "." || file == ".."
				next
			end
			if @excl_hidden && file.start_with?(".")
				next
			end
			slash = current.end_with?("/") ? "" : "/"
			full_file = current + slash + file
			printf("Diagnostic: file: " + full_file + " is dir: " + File.directory?(full_file).to_s, true)
			if File.directory?(full_file)
				printf("calling recursively with" + full_file, true)
				print(full_file, tab + VER + TAB)	
			end
		end
	end

	def printf(what, diag = false)
		if !diag || DEBUG
			puts what + "\n"
		end	
	end

	class ParamInfo
		attr_accessor:size
		attr_accessor:excl_hidden
		attr_accessor:threshold
		attr_accessor:root

		def self.parse_params
			result =  ParamInfo.new
			result.size= false
			result.excl_hidden = true
			result.threshold= -1

			ARGV.each do |param|
				if param.start_with?("-s")
					result.size= true
				elsif param.start_with?("-h")
					result.excl_hidden=false
				elsif param.start_with?("-t")
					sz = param[2..-1].to_i
					if sz > 0
						result.threshold= sz
					end
				else
					result.root= param
				end
			end
			return result
		end
	end

	if (__FILE__ == $0)
		a = ARGV[0]
		if a == nil
			puts "Usage:\n./tree.rb directory <-s -h -tNUM>\n\n-s: calculate size of each directory\n-h: include hidden directories\n-t: threshold (active only when -s is activated) -- skip directories smaller than threshold\n\nexample:\n./tree.rb ~ -s -h -t100 #displays the tree of all subdirs in the home folder larger than 100 MB"
		else

			param_info = ParamInfo.parse_params
			tree = Tree.new(param_info)
			tree.print
		end
	end
end
