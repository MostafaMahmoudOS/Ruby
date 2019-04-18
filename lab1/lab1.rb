class ComplexNumber
    attr_accessor :real,:img
    @@count={:add=>0,:bulk_multiply=>0,:multiply=>0,:bulk_add=>0}
    def initialize(real=0 ,img=0)
        @real=real
        @img=img
    end
    

    def +(num)
        raise " Argument type must be ComplexNumber" unless num.kind_of?(ComplexNumber)
        @@count[:add]+=1
        self.real+=num.real
        self.img+=num.img
        return self
    end
    def *(num)
        raise " Argument type must be ComplexNumber" unless num.kind_of?(ComplexNumber)
        @@count[:multiply]+=1
        temp=ComplexNumber.new
        temp.real=self.real*num.real-self.img*num.img
        temp.img =self.real*num.img+self.img*num.real
        self.real=temp.real
        self.img=temp.img
        return self
    end
    def self.bulk_add​(cns)
        raise " Argument type must be Array" unless cns.kind_of?(Array)
        cns.each{ |ele| raise " Array elements must be ComplexNumber" unless ele.kind_of?(ComplexNumber)}
        @@count[:bulk_add]+=1
        temp=ComplexNumber.new
        for ele in cns
            temp+=ele 
        end
        return temp
    end

    def self.bulk_multiply(cns)
        raise " Argument type must be Array" unless cns.kind_of?(Array)
        cns.each{ |ele| raise " Array elements must be ComplexNumber" unless ele.kind_of?(ComplexNumber)}
        @@count[:bulk_multiply]+=1
        temp=ComplexNumber.new(1,0)
        for ele in cns
            temp*=ele 
        end
        return temp
    end
    def self.get_stat()
        return @@count
    end
end
test=ComplexNumber.new(3,2)
test1=ComplexNumber.new(1,7)
test=test+test1
puts "=> add"
puts "real = #{test.real}"
puts  "imag=#{test.img}"
##############################
a=ComplexNumber.new(3,2)
b=ComplexNumber.new(1,7)
re=ComplexNumber.new
re=ComplexNumber.bulk_add​([a,b])
puts "=> bulk_add"
puts "real = #{re.real}"
puts  "imag=#{re.img}"
##############################
reM=ComplexNumber.bulk_multiply([a,b])
puts "=> bulk_multiply"
puts "real = #{reM.real}"
puts "imag= #{reM.img}"
##############################
puts "=>stat"
puts ComplexNumber.get_stat()