var $json : Collection

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		initHDI
		
		ARRAY LONGINT:C221(_Heights; 0)
		ARRAY TEXT:C222(_Names; 0)
		ARRAY TEXT:C222(_Ipsum; 0)
		
		vRow:=1
		vHeight:=50
		
		If (Get database localization:C1009(Current localization:K5:22)="ja")
			$json:=JSON Parse:C1218(Folder:C1567(fk resources folder:K87:11).file("LOREM-ja.json").getText(); Is collection:K8:32)
		Else 
			$json:=JSON Parse:C1218(Folder:C1567(fk resources folder:K87:11).file("LOREM-en.json").getText(); Is collection:K8:32)
		End if 
		
		COLLECTION TO ARRAY:C1562($json; _Names; "Name"; _Ipsum; "Ipsum"; _Heights; "Height")
		
	: (Form event code:C388=On Page Change:K2:54)
		
		OBJECT SET VISIBLE:C603(*; "LB0"; (FORM Get current page:C276>1))
		
End case 

