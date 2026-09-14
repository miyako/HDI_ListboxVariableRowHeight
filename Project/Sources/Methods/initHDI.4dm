//%attributes = {"invisible":true}
ARRAY TEXT:C222(TabControl; 0)
ARRAY TEXT:C222(TextTabControl; 0)

If (Get database localization:C1009(Current localization:K5:22)="ja")
	$json:=JSON Parse:C1218(Folder:C1567(fk resources folder:K87:11).file("SAMPLES-ja.json").getText(); Is collection:K8:32)
Else 
	$json:=JSON Parse:C1218(Folder:C1567(fk resources folder:K87:11).file("SAMPLES-en.json").getText(); Is collection:K8:32)
End if 

$json:=$json.orderBy("SampleSort asc")

COLLECTION TO ARRAY:C1562($json; TabControl; "Title"; TextTabControl; "Text")

TabControl:=0
Var1:=TextTabControl{1}
Var2:=TextTabControl{2}
Var3:=TextTabControl{3}