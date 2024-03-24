
#dat_info = [
#    { name: "Htun Htun", position: "Senior Software Engineer" ,experiance:"4 years",certificate:"Yes",curr_pj:"Java Project"},
#   { name: "Su Su", position: "Software Engineer" ,experiance:"3 years",certificate:"Yes",curr_pj:"Ruby Project"},
#    { name: "Ma Ma", position: "Programmer" ,experiance:"3 years",certificate:"No",curr_pj:"Python Project"},
#  ]
=begin
  
rescue => exception
  
end
  File.open("staff_info.txt", "r") do |file|
    file.each_line do |line|
      puts line
    end
  end

  File.open("DATStaff_Info.txt", "w") do |file|
    File.foreach("staff_info.txt") do |line|
      if line.include?("# This is the staff list in current financial year.")
        next
      end
      file.puts line
    end
  end
=end

staff1={
  'NAME' => 'Htun Htun',
  'POSITION' => 'Manager',
  'EXPERIENCE' => '4 years',
  'CERTIFICATE' => 'Yes',
  'PROJECT' => 'Ruby Project'
}


staff_infoFile=File.open("staff_Info.txt","r")
datFile=File.open("DATStaff_Info.txt","w")

  

start_pattern = /^\$\$\$DAT_STAFF_START\$\$\$/
end_pattern = /^\$\$\$LIST_END\$\$\$/

inside_staff_list = false

staff_infoFile.each_line do |line|
  if line.include?("# This is the staff list in current financial year.")
    
    next
  end
  if line.match(start_pattern)
    inside_staff_list = true
    #datFile.write(line)
    next
  end

  if line.match(end_pattern)
    inside_staff_list = false
    #datFile.write(line)
    break
  end

  if inside_staff_list
   new_line = line.gsub(/\$\$\$(.*?)\$\$\$/) { staff1[$1] }
   datFile.write(new_line)
 
  end
  


end
  

staff_infoFile.close
datFile.close


