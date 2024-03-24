require 'pg'
# make DB connection
begin
    db = PG::connect(host: 'localhost', port: '5432', user: 'postgres', password: 'root', dbname: 'test')
    puts "Connection OK"
rescue
    puts "Connection Error"
end

begin
    query = "Select * from dat_staff"
    result_query = db.exec(query)
rescue
    puts "Query Error"
end
    # print Name form DataBase
    name = result_query[0]['Name']
    # to read tempalte file
    tempalte = []
    # to write stdff file
    dat_staff = []
    # temp array
    temp = []
    get = 0
    skip = 0

begin
    File.open("staff_info.txt") { |f| tempalte = f.readlines.map &:chomp}
rescue
    puts "File read Error"
end

    tempalte.each do |line|
        next if line.strip[0] == "#"

        if line.include?("$$$DAT_STAFF_START$$$")
            skip = 0
            next
        end

        if line.include?("$$$DIR_STAFF_START$$$")
            skip = 1
            next
        end

        next if skip == 1

        if line.include?("$$$LIST_START$$$")
            temp.clear
            get = 1
            next
        end

        if line.include?("$$$LIST_END$$$")
            get == 0

            result_query.each do |curr|
                name = curr['Name']
                position = curr['Position']
                experience = curr['Experience']
                certificate = curr['Certificate']
                current_project = curr['Current_Project']

                temp.each do |row|
                    dat_staff << row.gsub('$$$NAME$$$') {name}
                                    .gsub('$$$POSITION$$$') {position}
                                    .gsub('$$$EXPERIENCE$$$') {experience}
                                    .gsub('$$$CERTIFICATE$$$') {certificate == '0' ?  "No" : "Yes"}
                                    .gsub('$$$PROJECT$$$') {current_project}
                end
            end
            next
        end

        if get == 1
            temp.push(line)
            next
        end

        dat_staff << line
    end

    begin
        File.open('DATStaff_Info.txt','w') {|f| dat_staff.each {|s| f.puts(s)}}
        rescue
            puts "Write Error"
    end