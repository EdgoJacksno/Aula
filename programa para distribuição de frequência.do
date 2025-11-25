
program define dist
version 16.0
    syntax varlist(min=1 max=1 numeric) [if] [in] [, Intervalo]
	
	
	if "`intervalo'"=="intervalo"{
	quietly{
	sort `varlist'
	sum  `varlist' `if' `in' 
	 local x1=r(N)
	 scalar x1=r(N)
	 local x2=r(min)
	 local x3=r(max)
	 local At=r(max)-r(min)
	 local k=round(1+3.3*log10(`x1'))
	 local Ac=`At'/`k'
	 
	 
	gen LI = `x2' + floor((`varlist' - `x2')/`Ac') * `Ac'
	gen LS = LI + `Ac'
	if (LS[`x1']==`x3') {
	    replace LI=`x3' in `x1'
		replace LS=`x3'+`Ac' in `x1'
	}
	sort LI LS
*===============================================================================	
	* 1. Criar variável de classe numérica com base nos intervalos
	egen classe = group(LI LS), label
	gen x = ""
	sum `varlist' `if' `in'
	local x1=r(N)
    forvalues i = 1/`x1' {
        local li : display %5.2f LI[`i']
        local ls : display %5.2f LS[`i']
        replace x = "`li' ├── `ls'" in `i'
    }
*===============================================================================	
	
	*gen x= string(LI, "%6.2f") + " ├── " + string(LS, "%6.2f") 
	
	}
	label var x "`varlist'"
	tab x `if' `in'
	drop x LI LS classe
	}
	else {
	 
	 tab `varlist' `if' `in'
	}

end
 
