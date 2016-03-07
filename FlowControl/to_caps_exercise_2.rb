# 

def	case_finder (stringvar)
   if stringvar.length > 10
     stringvar.upcase
   else
     stringvar
   end
 end  
   
 puts case_finder("Hello World")
 puts case_finder("Bobby")