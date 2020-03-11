<cfdump var="#url#" label="url">
<cfdump var="#session#" label="session">
<cfquery datasource="ogrkou" name="getSinif">
	SELECT sinif, bolumid FROM ogrenciler WHERE ogrenciid = '#url.ogrenciid#'
</cfquery>
<cfif session.Bolumid eq mid(url.ogrenciid , 3, 4) and session.sinif eq getSinif.sinif>
	<cfif url.ogrenciid mod 2 eq 0>
		<cfquery datasource="ogrkou" name="updateSinif" maxrows="100" result="sonuc">
			UPDATE	ogrenciler 
			SET		adi = adi + '_'
			WHERE	ogrenciid = '#url.ogrenciid#'
		</cfquery>
		<cfdump var="#sonuc#">
	<cfelse>
		<p>
			Öðrencinin modu 1'dir.
		</p>
	</cfif>
<cfelse>
	<p>
		Ýzinsiz eriþim talebi.
	</p>
</cfif>
