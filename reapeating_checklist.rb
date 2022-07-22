class Checklist
    @@tasks = []

    def self.display
        file = File.open("list.txt")
        file_data = file.readlines.map(&:chomp)

        iterator = 1
        file_data.each do |line|
            if line.index("-&-") != 0
                puts "#{interator} #{line}"
                interator += 1
            end
        end
        file.close
    end

    def self.setup
        File.open("list.txt", [a]) {|f| f.write("wake up") }
    end 
end