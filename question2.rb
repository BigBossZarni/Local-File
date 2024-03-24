qname="LQUE.DOT04.EF001"
variance=15
env="R1A7"

for i in 1..variance
    
    if i<10
        puts "LQUE.DOT04.EF00#{i}.ITA7"
    else
        puts "LQUE.DOT04.EF0#{i}.ITA7"
    end
end
