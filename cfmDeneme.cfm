<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9" />
<title>Zeynep ve Cihan Deneme</title>
</head>

<body>
<cfoutput>

<cfset i = 1>
<!---<cfset ad = "Samet">
<cfset metin = "Hoşgeldin " & ad>
#metin#

<cfset "#ad#" = metin>
<cfdump var="#variables#" label="vars">
<cfscript>
	/*degisken = "deneme";
	writeoutput(degisken);
	writedump(var = session, label="session");*/
</cfscript>
<cfdump var='#CGI.REMOTE_ADDR#'>
<cfset liste = "a,b-czeynep-d-e">
<cfset delim = "-">
<cfset elem = 2>
#listLen(liste, "-")#<br />
#listGetAt(liste, elem, delim)#<br />
<cfdump var="#liste#" label="liste">
<cfset dizi = arrayNew(1)>
<cfdump var="#dizi#" label="dizi">
<cfset dizi1 = [1, 2, 3, [1,2,3,4]]>
<cfdump var="#dizi1#" label="dizi1">
#dizi1[3]#<br />
<cfdump var="#dizi1[4]#"><br />
#dizi1[4][2]#
<cfset yeniDizi = listToArray(liste, "-")>
<cfdump var="#yeniDizi#" label="yeniDizi">
<cfset yeniListe = arrayToList(dizi1[4], ";")>
<cfdump var="#yeniListe#" label="yeniListe">

<cfset yapi = structNew()>
<cfset yapi.adi[1] = "Samet">
<cfset yapi.yas[1] = 32>
<cfset yapi.dizi[1] = dizi1[4]>
<cfset yapi.adi[2] = "Cihan">
<cfset yapi.yas[2] = 32>
<cfset yapi.dizi[2] = dizi1>
<cfdump var="#yapi#" label="yapi">
<cfset yapi1 = {adi = "Zeynep", yas = 18, dizi = dizi1}>
<cfdump var="#yapi1#" label="yapi1">
<cfdump var="#serializeJSON(yapi)#">--->
<cfquery datasource="ogrkou" name="getOgrencilerToplu" <!---cachedwithin="5"--->>
	SELECT	ogrenciid, adi, soyadi, sinif
	FROM 	Ogrenciler 
	WHERE 	bolumid = '0201' AND
			okdurum = '1'
</cfquery>
<cfloop query="getOgrencilerToplu">
	<cfset getOgrencilerToplu.sinif = 0>
</cfloop>
<cfquery dbtype="query" name="getOgrencilerTopluQoQ">
	SELECT DISTINCT sinif, count(ogrenciid) FROM getOgrencilerToplu GROUP BY sinif
</cfquery>
<cfdump var="#getOgrencilerTopluQoQ#">

<cfset qry = QueryNew("id,adi,soyadi")>
<cfset QueryAddColumn(qry, "sinif", [0,1,2,3,4,5,6,7,8,9])>
<cfloop index="i" from="1" to="10">
	<cfset queryAddRow(qry)>
	<cfset QuerySetCell(qry, "id", "#i#")>
	<cfset QuerySetCell(qry, "adi", "Samet")>
	<cfset QuerySetCell(qry, "soyadi", "Diri")>
</cfloop>
<cfdump var="#qry#" label="qry">

<!---<cfset server.deneme = "Samet">
<cfdump var="#server#">

<cfset session.Bolumid = '0201'>
<cfset session.Sinif = 1>
<cfquery datasource="ogrkou" name="getOgrenciler" <!---cachedwithin="5"--->>
	SELECT	ogrenciid, adi, soyadi 
	FROM 	Ogrenciler 
	WHERE 	bolumid = '0201' AND 
			sinif = '1' AND 
			okdurum = '1'
</cfquery>
<!---<cfdump var="#getOgrenciler#">--->
<table border="1">
	<tr>
		<th>##</th>
		<th>Öğrenci No</th>
		<th>Adı & Soyadı </th>
		<th>İşlem</th>
	</tr>
	<cfloop query="getOgrenciler">
	<tr>
		<td>#i++#</td>
		<td>#Ogrenciid#</td>
		<td>#adi# #Soyadi#</td>
		<td><a href="cfmDeneme2.cfm?ogrenciid=#ogrenciid#&okdurum=1">Kaydet</a></td>
		<!---<td>
			<form action="cfmDeneme2.cfm" method="post">
				<input type="hidden" name="ogrenciid" value="#ogrenciid#" />
				<input type="submit" name="ogrKaydet" value="Kaydet" />
			</form>
		</td>--->
	</tr>
	</cfloop>
	<!---<tr>
		<td>#i++#</td>
		<td>123456789</td>
		<td>Samet Diri</td>
		<td><a href="">Kaydet</a></td>
	</tr>
	<tr>
		<td>#i++#</td>
		<td>23456787</td>
		<td>Zeynep Sarı</td>
		<td><a href="">Kaydet</a></td>
	</tr>
	<tr>
		<td>#i++#</td>
		<td>547874654</td>
		<td>Cihan Şahin</td>
		<td><a href="">Kaydet</a></td>
	</tr>--->
</table>--->
</cfoutput>
</body>
</html>