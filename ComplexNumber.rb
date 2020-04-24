#!/user/bin/ruby -w

    class ComplexNumber
        @@add_count =0
        @@multiply_count =0
        @@add_array_count =0
        @@multily_array_count =0

        attr_reader :real_part
        attr_reader :img_part

        def initialize(real_part, img_part)
            @real_part = real_part
            @img_part = img_part
        end        

        def addComplex​(cn1)
            @@add_count +=1
            realsum = self.real_part + cn1.real_part
            imgsum = self.img_part + cn1.img_part

            if imgsum > 0
                puts "#{realsum}+#{imgsum}i"
            else
                puts "#{realsum}#{imgsum}i"
            end
        end

        def multiplyComplex(cn1)
            @@multiply_count += 1
            realp = (self.real_part * cn1.real_part)-(self.img_part * cn1.img_part)
            imgp = (self.real_part * cn1.img_part)+(self.img_part * cn1.real_part)

            if imgp > 0
                puts "#{realp}+#{imgp}i"
            else
                puts "#{realp}#{imgp}i"
            end
        end

        def bulk_add​ (cns)
            @@add_array_count += 1
           realsum=0
           imgsum=0
           count=0
            while count < cns.length 
                realsum=realsum + cns[count].real_part
                imgsum=imgsum + cns[count].img_part
                count += 1
            end
            
            if imgsum > 0
                puts "#{realsum}+#{imgsum}i"
            else
                puts "#{realsum}#{imgsum}i"
            end
        end

        def bulk_multiply​ (cns)
            @@multily_array_count += 1
           realp=cns[0].real_part
           imgp=cns[0].img_part
           count=1
            while count < cns.length
                real_before=realp
                realp = (realp * cns[count].real_part)-(imgp * cns[count].img_part)
                imgp = (real_before * cns[count].img_part)+(imgp * cns[count].real_part)
                count += 1
            end
            real_str=realp.to_s
            img_str=imgp.to_s
            if imgp > 0
                puts "#{realp}+#{imgp}i"
            else
                puts "#{realp}#{imgp}i"
            end
        end


        def get_stats​ ()
            puts "addComplex count: #{@@add_count }" 
            puts "multiplyComplex count: #{@@multiply_count} "
            puts "bulk_add count: #{@@add_array_count} "
            puts "bulk_multiply count: #{@@multily_array_count}"
        end

    end


    cm1=ComplexNumber.new(3,2)
    cm2=ComplexNumber.new(1,7)

    puts "Add method:"
    cm1.addComplex​(cm2)
    puts "************************************"
# ===========================================
    puts "Multiply method:"
    cm1.multiplyComplex(cm2)
    puts "************************************"

# ===========================================

    comparr = [] 
    comparr.push( cm1 )
    comparr.push( cm2 )
# ===========================================
    puts "bulk_add method:"
    cm1.bulk_add​(comparr)
    puts "************************************"

# ===========================================
    puts "bulk_multiply method:"
    cm1.bulk_multiply​(comparr)
    cm1.bulk_multiply​(comparr)
    puts "************************************"

# ===========================================
    puts "stats method:"
    cm1.get_stats​()
    puts "************************************"

  