class Checklist
    def self.display
        file = File.open("list.txt")
        file_data = file.readlines.map(&:chomp)

        iterator = 1
        file_data.each do |line|
            if line.index("-&-") != 0
                puts "#{iterator} #{line}"
                iterator += 1
            end
        end
        file.close
    end
end

def main(arg)
    case arg
    when "display"
        Checklist.display
    end
end

mains