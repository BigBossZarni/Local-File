download_ftp = ['A2@A210A', 'A2@A220A']
host_ftp = ['A2@A210A', 'A2@A210B', 'A2@A210C', 'A2@A220A', 'A2@A220B', 'A2@A220C']
postfix_arr = (('A'..'C'))
rename_arr = []
ikan_jcl_read = [] 

def increment(line,ikan_name)
    increment_char =  (line[-1].ord + 1).chr
    res = ikan_name + increment_char
    return res
end

File.open('ikan_ftp.txt'){|f| ikan_jcl_read = f.readlines.map &:chomp}
download_ftp.each do |download|
    count = 0
    ikan_name = download[0..6]
    postfix_arr.each do |postfix|
        backup = "#{ikan_name}#{postfix}"
        if host_ftp.include?(backup)
            count += 1
        else
            rename_arr.push(backup)
            break
        end
    end
    if count == 3
        ikan_jcl_read2 = []
        upload_ikan_jcl = []
        ikan_jcl_read.each do |line|
            if line.include?(ikan_name)
                old_jcl = line
                final = increment(line,ikan_name)
                upload_ikan_jcl << line.gsub(old_jcl, final)
                rename_arr.push(final)
            else
                upload_ikan_jcl << line
            end
        end
        File.open("ikan_ftp.txt","w"){|f| upload_ikan_jcl.each{|s| f.puts(s)}}
    end
    upload_ikan_jcl.clear()
end
puts "==>#{rename_arr}"