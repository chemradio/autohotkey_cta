#SingleInstance, Force
FormatTime, CurrentDate,, yyMMdd
FormatTime, CurrentYear,, yyyy
FormatTime, CurrentMonth,, MM

CurrentDateFolder = \\bishkeknas02\CurrentTimeAsia\%CurrentYear%\%CurrentYear%-%CurrentMonth%\%CurrentDate%
CurrentDateFinalFolder = %CurrentDateFolder%\FINAL
MasterFilesFolder = \\bishkeknas01\Master_Files

Gui, add, text, 	w70 y15 r1 section,FINAL Folder
Gui, add, text, 	w70 r1,Master_Files
Gui, add, Edit, 	w520 r1 vIN1Folder ys-5,%CurrentDateFinalFolder%
Gui, add, Edit, 	w520 r1 vIN2Folder,%MasterFilesFolder%

Gui, add, Button, 	x620 y20 w70 ys-8 gBut vIN1	, Browse
Gui, add, Button, 	x620 y37 w70 	gBut vIN2	, Browse

Gui, Add, ListView, x10 w600 r25, Filename|FileSize Dir1|FileSize Dir2|Consistency
Gui, add, Button, Default 	w70 x620 h70 yp	gGo		, GO
Gui, add, Button, 	w70 x620 h30 yp+80 gExit , Exit
Gui,show
return

	
But:
	FileSelectFolder, fold
	if (fold = "")
		return
	GuiControl,,%A_GuiControl%folder, %fold%
return

Go:
	LV_Delete()
	Gui, Submit, NoHide
	loop, %IN1Folder%\*CTA.mp4 {		
		thisFile := A_LoopFileName
		thisSize := A_LoopFileSize
		IfExist, %IN2Folder%\%thisFile%
		{
			FileGetSize, size, %IN2Folder%\%thisFile%
			
			If (thisSize != size) {
				LV_Add("", thisFile, thisSize, size, "Error!!!")
			} else {
				LV_Add("", thisFile, thisSize, size, "OK")
			}
		} 
		IfNotExist, %MasterFilesFolder%\%thisFile%
			LV_Add("", thisFile, thisSize, "","Missing!!!")
	}
	LV_ModifyCol()
	LV_ModifyCol(2,"100 Integer")
	LV_ModifyCol(3,"100 Integer")
	LV_ModifyCol(4,"100")
		
return




exit:
GuiEscape:
GuiClose:
	ExitApp

return