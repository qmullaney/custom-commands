class Checklist
    @@path = File.expand_path("custom-commands/list.txt")
    
    def self.display
        file = File.open(@@path)
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

    def self.add(item, index = nil)
        lines = IO.readlines(@@path).map(&:chomp)
        index.nil? ? lines << item : lines.insert(index.to_i - 1, item)
        File.write(@@path, lines.join("\n"), mode: "w")
    end

    def self.remove(index)
        index = index.to_i - 1
        lines = IO.readlines(@@path).map(&:chomp)

        iterator = 0

        lines.each_with_index do |line, i|
            if line.index("-&-") != 0
                if iterator == index
                    lines[i] = "-&-" + lines[i]
                    break
                else
                    iterator += 1
                end
            end
        end
            
        File.write(@@path, lines.join("\n"), mode: "w")
    end

    def self.restart
        lines = IO.readlines(@@path).map(&:chomp)
        lines.each_with_index do |line, i|
            if line.index("-&-") == 0
                lines[i] = lines[i][3..-1]
            end
        end
        File.write(@@path, lines.join("\n"), mode: "w")
    end
end

def main
    action = ARGV[0]
    case action
    when "display"
        Checklist.display
    when "add"
        Checklist.add(ARGV[1], ARGV[2])
        Checklist.display
    when "restart"
        Checklist.restart
        Checklist.display
    when "remove"
        Checklist.remove(ARGV[1])
        Checklist.display
    end
end

main