<cfsetting showdebugoutput="yes">
<!---<cfoutput>
<cftry>
<!---<cfinvoke component="componentDemo" method="myFunction" returnvariable="nesne"/>--->
<cfset nesne = createObject("component", "KOUBS.Samet.demoDers.componentDemo")>
<cfdump var="#nesne#">
	#nesne.deneme()#ccc
	<cfset nesne.deneme(1234)>aaa
	<cfscript>
		nesne.deneme(12345);
		writeoutput(nesne.deneme(12345));
	</cfscript>
	bbbb<br /><br />
	<cfset sinif = randRange(1, 6)>
	#nesne.deneme2(sinif = sinif, ogrenciid = 12345, bolumid = 1234)#
<cfcatch type="any">
	<cfdump var="#cfcatch#">
</cfcatch>
</cftry>
</cfoutput>--->

<cfoutput>
<cftry>
<!---<cfinvoke component="componentDemo" method="myFunction" returnvariable="nesne"/>--->
<cfset nesne = createObject("component", "KOUBS.Samet.demoDers.componentDemo")>
<cfset nesne.init("0201")>
#nesne.bolumid#
#nesne.ogrenciListesi("1")#
#nesne.ogretimElemaniListesi(1)#
<cfdump var="#nesne#">
<cfcatch type="any">
	<cfdump var="#cfcatch#">
</cfcatch>
</cftry>
</cfoutput>