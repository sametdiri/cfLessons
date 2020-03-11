<cfcomponent>
	<cfset this.DS = "ogrkou">
	<cfset this.bolumid = "">
	
	<cffunction name="init" access="public" returntype="void">
		<cfargument name="bolumid" type="string" required="yes">
		
		<cfset setBolumid(arguments.bolumid)>
	</cffunction>
	
	<cffunction name="setBolumid" access="public" returntype="void">
		<cfargument name="bolumid" type="string" required="yes">
		
		<cfset this.bolumid = arguments.bolumid>
	</cffunction>
	
	<cffunction name="getBolumid" access="public" returntype="void">
		
		<cfreturn this.bolumid>
	</cffunction>
	
	<cffunction name="ogrenciListesi" access="public" returntype="string">
		<!---<cfargument name="bolumid" type="string" required="yes">--->
		<cfargument name="sinif" type="string" required="yes">
		<cfset ogrList = getOgrenciListesi(<!---bolumid, --->arguments.sinif)>
		<cfoutput>
		<cfsavecontent variable="icerik">
			<table border="1" cellspacing="0" cellpadding="0" class="table table-bordered">
				<tr>
					<th>
						##
					</th>
					<th>
						Öðrenci No
					</th>
					<th>
						Adý
					</th>
					<th>
						Soyadý
					</th>
				</tr>
				<cfset local.i = 1>
				<cfloop query="ogrList" endrow="10">
					<tr>
						<td>
							#local.i++#
						</td>
						<td>
							#ogrenciid#
						</td>
						<td>
							#adi#
						</td>
						<td>
							#soyadi#
						</td>
					</tr>
				</cfloop>
			</table>
		</cfsavecontent>
		</cfoutput>
		<cfreturn icerik>
	</cffunction>
	
	<cffunction name="ogretimElemaniListesi" access="public" returntype="string">
		<cfargument name="aktif" type="boolean" required="yes">
		
		<cfset ogrElemList = getogretimElemaniListesi(arguments.aktif)>
		<cfoutput>
		<cfsavecontent variable="icerik">
			<table border="1" cellspacing="0" cellpadding="0" class="table table-bordered">
				<tr>
					<th>
						##
					</th>
					<th>
						Sicil No
					</th>
					<th>
						Unvan
					</th>
					<th>
						Adý
					</th>
					<th>
						Soyadý
					</th>
				</tr>
				<cfset local.i = 1>
				<cfloop query="ogrElemList" endrow="10">
					<tr <cfif BolumBsk neq "">style="background-color:green;"</cfif>>
						<td>
							#local.i++#
						</td>
						<td>
							#Kurumid#
						</td>
						<td>
							#Gorev#
						</td>
						<td>
							#adi#
						</td>
						<td>
							#soyadi#
						</td>
					</tr>
				</cfloop>
			</table>
			*Yeþil renk ile gösterilen bölüm baþkanýdýr.
		</cfsavecontent>
		</cfoutput>
		<cfreturn icerik>
	</cffunction>
	
	<cffunction name="getogretimElemaniListesi" access="private" returntype="query">
		<cfargument name="aktif" type="string" required="yes">
		<cfquery datasource="#this.DS#" name="ogrElemList">
			SELECT	dbo.Personel.Kurumid, dbo.Personel.Adi, dbo.Personel.Soyadi, dbo.Personel.Bolumid, dbo.Gorevler.Gorev, dbo.Personel.Aktif, dbo.Bolumler.BolumBsk
			FROM	dbo.Personel INNER JOIN
					dbo.Gorevler ON dbo.Personel.Gorevid = dbo.Gorevler.Gorevid LEFT OUTER JOIN
					dbo.Bolumler ON dbo.Personel.Bolumid = dbo.Bolumler.Bolumid AND dbo.Personel.Kurumid = dbo.Bolumler.BolumBsk
			WHERE	(dbo.Personel.Bolumid = '#this.bolumid#') AND 
					(dbo.Personel.Aktif = '#arguments.aktif#')
		</cfquery>
		<cfreturn ogrElemList>
	</cffunction>
	
	<cffunction name="getOgrenciListesi" access="private" returntype="query">
		<!---<cfargument name="bolumid" type="string" required="yes">--->
		<cfargument name="sinif" type="string" required="yes">
		
		<cfquery datasource="#this.DS#" name="ogrList">
			SELECT	ogrenciid, adi, soyadi
			FROM	ogrenciler
			WHERE	bolumid = '#this.bolumid#'<!---'#arguments.bolumid#'---> AND
					sinif = '#arguments.sinif#'
		</cfquery>
		<cfreturn ogrList>
	</cffunction>
	
</cfcomponent>
<!---<cfscript>
component{
	public string function deneme(numeric ogrenciid){
		if(isdefined("arguments.ogrenciid")){
			mesaj = "deneme çalýþtý" & arguments.ogrenciid;
		}
		else{
			mesaj = "deneme çalýþtý";
		}
		return mesaj;
	}
	public string function deneme2(required numeric ogrenciid, numeric bolumid, required numeric sinif){
		return bolumid & "numaralý bölümdeki " & sinif & ". sýnýftaki " & ogrenciid & "numaralý öðrenci";
	}
	
	private query 
}
</cfscript>--->