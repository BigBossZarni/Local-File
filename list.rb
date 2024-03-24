

dat_info = [
     { name: "Htun Htun", position: "Senior Software Engineer" ,experiance:"4 years",certificate:"Yes",curr_pj:"Java Project"},
    { name: "Su Su", position: "Software Engineer" ,experiance:"3 years",certificate:"Yes",curr_pj:"Ruby Project"},
     { name: "Ma Ma", position: "Programmer" ,experiance:"3 years",certificate:"No",curr_pj:"Python Project"},
   ]

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
    next
  end

  if line.match(end_pattern)
    inside_staff_list = false
    break
  end

  if inside_staff_list
    #datFile.each_line do |output_file|
      3.times do
        new_line = line.gsub("$$$Name$$$", dat_info.first[:name])
        new_line=line.gsub("$$$Position$$$", dat_info.first[:position])
        datFile.write(new_line)
      end
      dat_info.rotate!
    
  end
end
  

staff_infoFile.close
datFile.close


