qname="LQUE.DOT04.EF001"
variance=8
env="ST"

for i in 1..variance
    case env
    when "R1A7"
        if i<10
            puts "LQUE.DOT04.EF00#{i}.ITA7"
        else
            puts "LQUE.DOT04.EF0#{i}.ITA7"
        end 
    when "R1A8"
        if i==1
            puts "LQUE.DOT04.EF001.ITA8" 
            next
        end
        break if i>=variance
        puts "LQUE.DOT04.EF002.ITA8"
    when "R1A9"
        if i==1
            puts "LQUE.DOT04.EF001.ITA9" 
            next
        end
        break if i>=variance
        puts "LQUE.DOT04.EF002.ITA9"   
    when "IT3"
        if i<10
            puts "LQUE.DOT04.EF00#{i}.IT3"
        else
            puts "LQUE.DOT04.EF0#{i}.IT3"
        end 
    when "ST"
        if i<10
            puts "LQUE.DOT04.EF00#{i}"
        else
            puts "LQUE.DOT04.EF0#{i}"
        end 
    else
        puts "Wrong Environment"
    end
end