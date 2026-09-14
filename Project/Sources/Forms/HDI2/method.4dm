
Case of 
	: (Form event code:C388=On Load:K2:1)
		
		initHDI
		
		ARRAY LONGINT:C221(_Heights; 0)
		ARRAY TEXT:C222(_Names; 0)
		ARRAY TEXT:C222(_Ipsum; 0)
		
		vRow:=1
		vHeight:=50
		
		ALL RECORDS:C47([LOREM:4])
		SELECTION TO ARRAY:C260([LOREM:4]Name:2; _Names; [LOREM:4]Ipsum:3; _Ipsum; [LOREM:4]Height:4; _Heights)
		
	: (Form event code:C388=On Page Change:K2:54)
		
		OBJECT SET VISIBLE:C603(*; "LB0"; (FORM Get current page:C276>1))
		
End case 

