SetWorkingDir, C:\Users\timaevt\Desktop\Personal\AHK\Scripts
;Menu, Tray, Icon, shell32.dll, 283 ;if commented in, this line will turn the H icon into a little grey keyboard-looking thing.

#NoEnv
SendMode Input
#InstallKeybdHook
;#InstallMouseHook ;<--You'll want to use this if you have scripts that use the mouse.
#UseHook On
#SingleInstance force ;only one instance of this script may run at a time!
#MaxHotkeysPerInterval 2000

;;The lines below are optional. Delete them if you need to.
#HotkeyModifierTimeout 60 ; https://autohotkey.com/docs/commands/_HotkeyModifierTimeout.htm
#KeyHistory 200 ; https://autohotkey.com/docs/commands/_KeyHistory.htm ; useful for debugging.
#WinActivateForce ;https://autohotkey.com/docs/commands/_WinActivateForce.htm ;prevent taskbar flashing.
;;The lines above are optional. Delete them if you need to.

FormatTime, CurrentDate,, yyMMdd
FormatTime, CurrentYear,, yyyy
FormatTime, CurrentMonth,, MM

CurrentDateFolder = \\bishkeknas02\CurrentTimeAsia\%CurrentYear%\%CurrentYear%-%CurrentMonth%\%CurrentDate%
CurrentDateFinalFolder = %CurrentDateFolder%\FINAL
MasterFilesFolder = \\bishkeknas01\Master_Files
CTA_files = \\bishkekdc02\Redak\CTA files
CTA_NAS = \\bishkeknas02\CurrentTimeAsia
TricasterExportFolder = \\BISHKEKNAS02\production\Tricaster_Export
PremiereProjectsFolder = \\bishkeknas02\CurrentTimeAsia\Projects\%CurrentYear%\%CurrentYear%-%CurrentMonth%

SubFolders := [Anushervon, Dasha, Jazgul, Sholpan, Sveta, TJ, KG, KZ, TM, UZ, REUTERS, Screens, Teaser, FINAL]

;AdobeAppsAHKClasses := [Premiere Pro, Adobe Media Encoder CC 2017, AE_CApplication_14.2, audition12, Photoshop, illustrator]

XButton1::
    currentDateEntry("path")
return

XButton2::superLauncher()

#WheelDown::volume_down

#WheelUp::volume_up

!q::!F4

;;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++;;
;;+++++++++++++++++ BEGIN SECOND KEYBOARD F24 ASSIGNMENTS +++++++++++++++++++++;;
;;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++;;

F24::return

F24 & escape::tooltip, "Avoid binding ESC."

F24 & F1::
    ifWinActive ahk_class #32770
    {
        Send, %CTA_NAS%
        Send, {Enter}
    }
    else
        Run, %CTA_NAS%
return

F24 & F2::
    ifWinActive ahk_class #32770
    {
        Send, %CTA_files%
        Send, {Enter}
    }
    else
        Run, %CTA_files%
return

F24 & F3::
    ifWinActive ahk_class #32770
    {
        Send, %MasterFilesFolder%
        Send, {Enter}
    }
    else
        Run, %MasterFilesFolder%
return

F24 & F4::
    ifWinActive ahk_class #32770
    {
        Send, %TricasterExportFolder%
        Send, {Enter}
    }
    else
        Run, %TricasterExportFolder%
return

F24 & F5::
    ifWinActive ahk_class #32770
    {
        Send, %PremiereProjectsFolder%
        Send, {Enter}
    }
    else
        Run, %PremiereProjectsFolder%
return

F24 & F6::
    octopusItem("NEW", "OC")
    sleep 50
    octopusItem("CAM2", "0")
return

F24 & F7::
    octopusItem("NEW", "OTS")
    sleep 50
    octopusItem("CAM2", "0")
return

F24 & F8::
    octopusItem("NEW", "VO")
return

F24 & F9::
    octopusItem("NEW", "PKG")
return

F24 & F10::
    octopusItem("NEW", "SOT")
return

F24 & F11::
    octopusItem("NEW", "B-ROLL")
return

F24 & F12::
    octopusItem("NEW", "TRANSITION")
return

;;tooltip, you pressed the function key %A_thishotkey% on the [F24] keyboard
;;Note that the assignment on the above line will apply to ALL prior lines ending in "::"
;;...which you should know from the AHK tutorial I linked you to.

;;------------------------NEXT ROW--------------------------;;

F24 & sc029::
    activateRunPremiere()
return

F24 & 1::
    activateRunAfterFX()
return

F24 & 2::
    activateRunAudition()
return

F24 & 3::
    activateRunPhotoshop()
return

F24 & 4::
    activateRunIllustrator()
return

F24 & 5::
    activateRunEncoder()
return

F24 & 6::
    activateRunFilezilla() 
return

F24 & 7::
    digaMagic()
return

F24 & 8::
    activateRunChrome()
return

F24 & 9::
    activateRunWord()
return

F24 & 0::
    activateRunMSTeams()
return

F24 & -::
    Run, https://outlook.office.com/owa/?realm=rferl.org&exsvurl=1&ll-cc=2057&modurl=0&path=/mail/inbox
return

F24 & =::
    activateRunOctopus() 
return

F24 & backspace::
    MouseClick, left, 870, 225
return
;tooltip, [F24]  %A_thishotKey%

;;------------------------NEXT ROW--------------------------;;

F24 & tab::
    ;;#ifWinNotActive, ahk_class Premiere Pro
    ;;    currentDateEntry("path")
    ;;#ifWinNotActive
    Return

;;F24 & q::
premiereFindMogrt("SuperGeo Tim v2")
return

F24 & w::
    premiereFindMogrt("UltraLT")
return

F24 & e::
    premiereFindMogrt("UltraLT")
return

F24 & r::
    premiereFindMogrt("Source-v2")
return

F24 & t::
    premiereFindMogrt("CT_Phoner")
return

F24 & y::
    premiereFindMogrt("Subtitles")
return

;F24 & u::

F24 & i::
    spatialLinearKeyframe()
return

F24 & o::
    temporalLinearKeyframe()
return

F24 & p::
    easeKeyframe()
return

F24 & [::
    easeOutKeyframe()
return

F24 & ]::
    easeInKeyframe()
return

;;F24 & \::tooltip, [F24] %A_thisHotKey%

F24 & capslock::tooltip, [F24] capslock - this should have been remapped to F20. Keep this line commented out.

;;------------------------NEXT ROW--------------------------;;

F24 & a::
    MouseClick, Right
    Sleep, 250
    Send, {Up 4}
    Send {Enter}
    Return

F24 & s::
    MouseClick, Right
    Sleep, 250
    Send, {Up 3}
    Send {Enter}
    Return

F24 & d::
    MouseClick, Right
    Sleep, 250
    Send, {Up 2}
    Send {Enter}
    Return

;F24 & f::
F24 & g::
    sendCountryName("KG")
return

F24 & h::
    sendCountryName("KZ")
return

F24 & j::
    sendCountryName("TJ")
return

F24 & K::
    sendCountryName("TM")
return

F24 & l::
    sendCountryName("UZ")
return

F24 & `;::
    premiereFindMogrt("B-ROLL BG ANI")
return

F24 & '::
    premiereFindEffect("CTA B-ROLL BOX Video")
    Return

F24 & \::
    premiereFindEffect("CTA B-ROLL BOX Guest")
    Return
    
;for the above line, (semicolon) note that the ` is necessary as an escape character -- and that the syntax highlighting might get it wrong.
;;::tooltip, [F24]  %A_thisHotKey%

F24 & enter::
    finalToMasterFiles()
return

;;------------------------NEXT ROW--------------------------;;

F24 & z::
    pasteColor("pool")
return

F24 & x::
    pasteColor("midnight")
return

F24 & c::
    pasteColor("raspberry")
return

F24 & v::
    pasteColor("heather")
return

F24 & b::
    sendCountryName("RU")
return

F24 & n::
    sendCountryName("CN")
return

F24 & m::
    sendCountryName("US")
return

F24 & ,::
    sendCountryName("UA")
return

F24 & .::
    premiereFindEffect("CTA B-ROLL OVERLAY Video")
    Return
    
F24 & /::
    premiereFindEffect("CTA B-ROLL OVERLAY Guest")
    Return

F24 & space::
    superLauncher()

    tooltip, [F24] SPACEBAR. This will now clear remaining tooltips.
    sleep 500
    tooltip,
return

;;And THAT^^ is how you do multi-line instructions in AutoHotkey.
;;Notice that the very first line, "space::" cannot have anything else on it.
;;Again, these are fundamentals that you should have learned from the tutorial.

;;===================== MODIFIERS =========================;;

;Lshift::tooltip, Even if you used the "F22_with_modifiers" hex file, these woudn't be wrapped unless you were already holding down some OTHER key. hmm.
;If you DID use F24.hex, then these won't get pressed in the first place.
;Lctrl::tooltip, do not use
;Lwin::tooltip, do not use
;Lalt::tooltip, do not use

;Ralt::tooltip, do not use
;Rwin::tooltip, do not use
;appskey::tooltip, This is not a modifier, but I replaced it with INTERNATIONAL4 (SC079) anyway, because it was able to misbehave.
;Rctrl::tooltip, do not use
;Rshift::tooltip, do not use

;;If you leave the modifier keys alone, it allows for lines like the ones below:
;+z::tooltip, you pressed SHIFT Z on the F24 keyboard.
;^z::tooltip, you pressed CTRL Z on the F24 keyboard.
;!z::tooltip, you pressed ALT Z on the F24 keyboard. I don't recommend this... ALT is dangerous because of menu acceleration, even if you try to disable it like I have
;^!z::tooltip, you pressed CTRL SHIFT Z on the F24 keyboard.
;;Etc.
;;However, I use few to no modifiers on my secondary keyboards... I prefer tap dance instead. The decision is up to you.
;;If you're super confused by all this, don't be. Just use F24.hex and don't worry about the modifiers at all.
;;Also, I have to do some more testing to see if the stuff I said above is actually true, hmmmmmm.

;;================= MODIFIERS REMAPPED ======================;;

;; When you replace these with your own functions, I recommend that you do NOT delete the tooltips. Just comment them out. That way, you always know what was changed to what. It gets very confusing very quickly otherwise.
;; Here is the full list of scan code substitutions that I made:
;; https://docs.google.com/spreadsheets/d/1GSj0gKDxyWAecB3SIyEZ2ssPETZkkxn67gdIwL1zFUs/edit#gid=824607963

F24 & SC070::tooltip, [F24] Lshift -to-> SC070-International 2

;; The following 3 assignments MUST use the UP stroke - the down stroke doesn't appear for some reason.

F24 & SC071 up::
    ;;tooltip, [F24] LCtrl -to-> SC071-Language 2
    Return
    

F24 & SC072 up::tooltip, [F24] LWin -to-> SC072-Language 1
    Return

F24 & SC073 up::
    ;;tooltip, [F24] LAlt -to-> SC073-International 1
    Run, \\bishkeknas02\CurrentTimeAsia\Projects\CT-Asia-Template-TIMUR-2022.prproj
    MsgBox,262144, Premiere Template, Launching Premiere Template, 0.5
    Return

; The above 3 assignments MUST up the UP stroke

F24 & SC077::
    ;;tooltip, [F24] RAlt -to-> SC077-Language 4
    Run, \\bishkeknas02\CurrentTimeAsia\GRAPHICS\Timur Edit\Timpate\Timlate8-2022.aep
    MsgBox,262144, AE Template, Launching AE Template, 0.5
    Return

;;F24 & SC078::tooltip, [F24] RWin -to-> SC078-Language 3

F24 & SC079:: ;tooltip, [F24] AppsKey -to-> SC079-International 4
    createCurrentDateFolder()
    Return


F24 & SC07B::
    ;;tooltip, [F24] RCtrl -to-> SC07B-International 5
    youtubeFacebookDownloader() 
    Return

F24 & SC07D::tooltip, [F24] RShift -to-> SC07D-International 3
    Return

;;================= LOCKING KEYS ======================;;

F24 & F20:: ;tooltip, [F24] CapsLock -to-> SC06B-F20
    Send, ^+{F12}
return

F24 & SC05C:: ;;tooltip, [F24] NumLock -to-> SC05C-International 6
    premiereFindEffect("Crop chemradio")
return

;Numlock is an AWFUL key. I prefer to leave it permanently on.
;It's been changed to International 6, so you can use it with no fear that it'll mess up your numpad.
;;ScrollLock is in the next section.

;;================= NEXT SECTION ======================;;

F24 & PrintScreen::
    octopusItem("DELETE", "0")
return

F24 & ScrollLock::
    Run, C:\Users\timaevt\Desktop\Personal\AHK\Scripts\OneRun\ComparatorV1.ahk
return

F24 & SC07E::tooltip, [F24] Pause -to-> SC07E-Brazillian comma

;;Don't use the 3 keys below for your 2nd keyboard!
;Pause::msgbox, The Pause/Break key is a huge PITA. That's why I remapped it to SC07E
;Break::msgbox, Or is it THIS key? WHO KNOWS!
;CtrlBreak::msgbox, I have no idea what Ctrlbreak is. But it shows up sometimes.
;;Don't use the 3 keys above for your 2nd keyboard! Just don't!!

F24 & insert::
    prPanelFocus("effects")
return

F24 & delete::
    prPanelFocus("timeline")
return

F24 & home::
    prPanelFocus("project")
return

F24 & end::
    prPanelFocus("effectcontrols")
return

F24 & pgup::
    prPanelFocus("audiotrackmixer")
return

F24 & pgdn::
    prPanelFocus("essentialgraphics")
return

;;================= NEXT SECTION ======================;;

;F24 & up::

F24 & down::
    advancedPremiereExport()
return

F24 & left::
    ;;Send, {CtrlDown}{AltDown}{M}{AltUp}{CtrlUp}
    Send, ^!m
    MsgBox,262144, AME Export, Queuing in AME ,0.5
    Return

F24 & right::tooltip,[F24] %A_thishotKey%
    Return
    
    ;;=========== THE NUMPAD WITH NUMLOCK ON ==============;;
    ;;; -- (I never turn numlock off, FYI.) -- ;;
    ;;Please note that SHIFT will make numlock act like it's off...
    ;;or is it the other way around? AGH! Just don't use shift with the numpad!

F24 & numpad0::
return

F24 & numpad1::
    premiereFindEffect("Fast Blur chemradio")
return

F24 & numpad2::
    premiereFindEffect("Dip to white")
return

F24 & numpad3::
    Send, ^{F1}
return

F24 & numpad4::
    premiereFindEffect("MBC v1 chemradio")
return

F24 & numpad5::
    premiereFindEffect("ParEQ LowCut chemradio")
return

F24 & numpad6::
    premiereFindEffect("Hard Limiter -9 chemradio")
return

F24 & numpad7::
    premiereFindEffect("Cross Fade")
return

F24 & numpad8::
    premiereFindEffect("Exponential Fade")
return

F24 & numpad9::tooltip,[F24] %A_thishotKey%
return

;;============ THE NUMPAD WITH NUMLOCK OFF ============;;
;;numpadins::
;;numpadend::
;;numpaddown::
;;numpadpgdn::
;;numpadleft::
;;numpadclear::
;;numpadright::
;;numpadhome::
;;numpadup::
;;numpadpgup::tooltip,[F24] %A_thishotKey% Because numlock is off

;;====== NUMPAD KEYS THAT DON'T CARE ABOUT NUMLOCK =====;;

;NumLock::
;premiereFindEffect("Crop")
;return

F24 & numpadDiv::
    premiereFindEffect("CTA CROP PhonerV4.2 CTA")
    Return

F24 & numpadMult::
    Send, �
return

F24 & numpadSub::
    Send ^+{F2}
return

F24 & numpadAdd::
    prPanelFocus("scopes")
return

F24 & numpadEnter::
    prPanelFocus("lumetri")
return

F24 & numpadDot::
    Send, +s
    ;;tooltip, [F24] %A_thishotKey%
    Return

;;================== JUST IN CASE ======================;;
; I tested a CoolerMaster keyboard that had P1 P2 P3 and P4 keys on it,
; which corresponded to some of the super function keys. (F13-F24)
; So I've put those below too, just in case you have the same thing.
; You don't have the option to NOT wrap them, unless you make your own hex file.

F24 & F13::
F24 & F14::
F24 & F15::
F24 & F16::
F24 & F17::
F24 & F18::
    F24 & F19::tooltip, [F24] %A_thishotKey%
    ;;;F20:: already used by CapsLock
    ;;F21::meh
    ;;F24::might be used by some other keyboard
    ;;F23::might be used by some other keyboard
    ;;F24::do not use

    ;;== MEDIA KEYS CANNOT BE WRAPPED IN F24 WITH THE USB CONVERTER ==;;
    ;;; otherwise they would be here :(

    ;;============== END OF ALL KEYBOARD KEYS ===============;;

    ;;#if ;this line will end the F24 secondary keyboard assignments.

    ;;;---------------IMPORTANT: HOW TO USE #IF THINGIES-------------------

    ;;You can use more than one #if thingy at a time, but it must be done like so:
    ;;#if (getKeyState("F24", "P")) and if WinActive("ahk_exe Adobe Premiere Pro.exe")
    ;;F1::msgbox, You pressed F1 on your secondary keyboard while inside of Premiere Pro

    ;; HOWEVER, You still would still need to block F1 using #if (getKeyState("F24", "P"))
    ;; If you don't, it'll pass through normally, any time Premiere is NOT active.
    ;; Does that make sense? I sure hope so. Experiment with it if you don't understand.

    ;; Alternatively, you can use the following: (Comment it in, and comment out other instances of F1::)
    ;; #if (getKeyState("F24", "P"))
    ;; F1::
    ;; if WinActive("ahk_exe Adobe Premiere Pro.exe")
    ;; {
    ;; msgbox, You pressed F1 on your secondary keyboard while inside of Premiere Pro
    ;; msgbox, And you did it by using if WinActive()
    ;; }
    ;; else
    ;; msgbox, You pressed F1 on your secondary keyboard while NOT inside of Premiere Pro
    ;;This is easier to understand, but it's not as clean of a solution.

    ;; Here is a discussion about all this:
    ;; https://github.com/TaranVH/2nd-keyboard/issues/65

    ;;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    ;;+++++++++++++++++ END OF SECOND KEYBOARD F24 ASSIGNMENTS ++++++++++++++++++++++
    ;;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    ;;#if

    ;;*******************************************************************************
    ;;*************DEFINE YOUR NORMAL KEY ASSIGNMENTS BELOW THIS LINE****************
    ;;*******************************************************************************

    ;;F2::msgbox, You pressed F2 on your normal keyboard. 

    ;;~~~~~~~~~~~~~~~~~DEFINE YOUR FUNCTIONS BELOW THIS LINE~~~~~~~~~~~~~~~~~~~~~~~~~

    #IfWinActive, ahk_class #32770

        :?*:и-кщдд::
            Send,B-ROLL-
            premiereCheckMP4EnterDate()
        return

        :?*:b-roll::
            Send,B-ROLL-
            premiereCheckMP4EnterDate()
        return

        :?*:-���::
            Send,-OTS-
            premiereCheckMP4EnterDate()
        return

        :?*:-��::
            Send,-VO-
            premiereCheckMP4EnterDate()
        return

        :?*:-���::
            Send,-PKG-
            premiereCheckMP4EnterDate()
        return

        :?*:-���::
            Send,-SOT-
            premiereCheckMP4EnterDate()
        return

        :?*:-OTS::
            Send,-OTS-
            premiereCheckMP4EnterDate()
        return

        :?*:-VO::
            Send,-VO-
            premiereCheckMP4EnterDate()
        return

        :?*:-PKG::
            Send,-PKG-
            premiereCheckMP4EnterDate()
        return

        :?*:-SOT::
            Send,-SOT-
            premiereCheckMP4EnterDate()
        return

        :?*:hl1::
            Send, 0001-HL_1
            premiereCheckMP4EnterDate()
        return

        :?*:hl2::
            Send, 0002-HL_2
            premiereCheckMP4EnterDate()
        return

        :?*:hl3::
            Send, 0003-HL_3
            premiereCheckMP4EnterDate()
        return

        :?*:hl4::
            Send, 0004-HL_4
            premiereCheckMP4EnterDate()
        return

        :?*:hl5::
            Send, 0005-HL_5
            premiereCheckMP4EnterDate()
        return

        :?*:hl6::
            Send, 0006-HL_6
            premiereCheckMP4EnterDate()
        return

        :?*:hl7::
            Send, 0007-HL_7
            premiereCheckMP4EnterDate()
        return

        :?*:hl8::
            Send, 0008-HL_8
            premiereCheckMP4EnterDate()
        return

        :?*:hl9::
            Send, 0009-HL_9
            premiereCheckMP4EnterDate()
        return

        :?*:��1::
            Send, 0001-HL_1
            premiereCheckMP4EnterDate()
        return

        :?*:��2::
            Send, 0002-HL_2
            premiereCheckMP4EnterDate()
        return

        :?*:��3::
            Send, 0003-HL_3
            premiereCheckMP4EnterDate()
        return

        :?*:��4::
            Send, 0004-HL_4
            premiereCheckMP4EnterDate()
        return

        :?*:��5::
            Send, 0005-HL_5
            premiereCheckMP4EnterDate()
        return

        :?*:��6::
            Send, 0006-HL_6
            premiereCheckMP4EnterDate()
        return

        :?*:��7::
            Send, 0007-HL_7
            premiereCheckMP4EnterDate()
        return

        :?*:��8::
            Send, 0008-HL_8
            premiereCheckMP4EnterDate()
        return

        :?*:��9::
            Send, 0009-HL_9
            premiereCheckMP4EnterDate()
        return

        :?*:cg1::
            Send, 0001-CG_1
            premiereCheckMP4EnterDate()
        return

        :?*:cg2::
            Send, 0002-CG_2
            premiereCheckMP4EnterDate()
        return

        :?*:cg3::
            Send, 0003-CG_3
            premiereCheckMP4EnterDate()
        return

        :?*:cg4::
            Send, 0004-CG_4
            premiereCheckMP4EnterDate()
        return

        :?*:cg5::
            Send, 0005-CG_5
            premiereCheckMP4EnterDate()
        return

        :?*:cg6::
            Send, 0006-CG_6
            premiereCheckMP4EnterDate()
        return

        :?*:cg7::
            Send, 0007-CG_7
            premiereCheckMP4EnterDate()
        return

        :?*:cg8::
            Send, 0008-CG_8
            premiereCheckMP4EnterDate()
        return

        :?*:cg9::
            Send, 0009-CG_9
            premiereCheckMP4EnterDate()
        return

        :?*:��1::
            Send, 0001-CG_1
            premiereCheckMP4EnterDate()
        return

        :?*:��2::
            Send, {Ctrl down}A{Ctrl up}
            Send, 0002-CG_2
            premiereCheckMP4EnterDate()
        return

        :?*:��3::
            Send, 0003-CG_3
            premiereCheckMP4EnterDate()
        return

        :?*:��4::
            Send, 0004-CG_4
            premiereCheckMP4EnterDate()
        return

        :?*:��5::
            Send, 0005-CG_5
            premiereCheckMP4EnterDate()
        return

        :?*:��6::
            Send, 0006-CG_6
            premiereCheckMP4EnterDate()
        return

        :?*:��7::
            Send, 0007-CG_7
            premiereCheckMP4EnterDate()
        return

        :?*:��8::
            Send, 0008-CG_8
            premiereCheckMP4EnterDate()
        return

        :?*:��9::
            Send, 0009-CG_9
            premiereCheckMP4EnterDate()
        return

#IfWinActive

premiereCheckMP4EnterDate()
{
    clipboard =
    Send {End}
    Sleep, 10
    Send {Shift down}{Left 4}{Shift up}
    Sleep, 10
    SendInput {Ctrl down}{Ins}{Ctrl up}
    Clipwait
    clipboardChecker := clipboard

    IfNotInString, clipboardChecker, .mp4
    {
        Send {End}
        Sleep, 10
    }

    currentDateEntry("export")
    clipboardChecker =
}

createCurrentDateFolder()
{
    FormatTime, CurrentDate,, yyMMdd
    FormatTime, CurrentYear,, yyyy
    FormatTime, CurrentMonth,, MM
    global CurrentDateFolder

    IfNotExist, %CurrentDateFolder%
    {
        FileCreateDir, %CurrentDateFolder%
        FileCreateDir, %CurrentDateFolder%\Anushervon\
        FileCreateDir, %CurrentDateFolder%\FINAL\
        FileCreateDir, %CurrentDateFolder%\Karina\
        FileCreateDir, %CurrentDateFolder%\Jibek\
        FileCreateDir, %CurrentDateFolder%\Kamilla\
        FileCreateDir, %CurrentDateFolder%\AFG\
        FileCreateDir, %CurrentDateFolder%\Yernur\
        FileCreateDir, %CurrentDateFolder%\KG\
        FileCreateDir, %CurrentDateFolder%\KZ\
        FileCreateDir, %CurrentDateFolder%\TJ\
        FileCreateDir, %CurrentDateFolder%\TM\
        FileCreateDir, %CurrentDateFolder%\UZ\
        FileCreateDir, %CurrentDateFolder%\REUTERS\
        FileCreateDir, %CurrentDateFolder%\Teaser\
        FileCreateDir, %CurrentDateFolder%\Dauren\
    }

    closeExplorerWindows()
    Run, \\bishkeknas02\CurrentTimeAsia\%CurrentYear%\%CurrentYear%-%CurrentMonth%\%CurrentDate% 
}

closeExplorerWindows()
{
    GroupAdd,ExplorerGroup, ahk_class CabinetWClass
    GroupAdd,ExplorerGroup, ahk_class ExploreWClass
    if(WinExist("ahk_group ExplorerGroup"))
        WinClose,ahk_group ExplorerGroup
}

openScriptsFolder()
{
    Run, C:\Users\timaevt\Desktop\Personal\AHK\Scripts
}

activateRunPremiere() 
{
    IfWinExist, ahk_class Premiere Pro
    {
        WinActivate, ahk_class Premiere Pro
    }
    else
    {
        Run, "C:\Program Files\Adobe\Adobe Premiere Pro 2022\Adobe Premiere Pro.exe"
    }
}

activateRunEncoder() 
{
    IfWinExist, ahk_class Adobe Media Encoder 2022
    {
        WinActivate, ahk_class Adobe Media Encoder 2022
    }
    else
    {
        Run, "C:\Program Files\Adobe\Adobe Media Encoder 2022\Adobe Media Encoder.exe"
    }
}

activateRunAfterFX() 
{
    IfWinExist, ahk_class AE_CApplication_22.0
    {
        WinActivate, ahk_class AE_CApplication_22.0
    }
    else
    {
        Run, "C:\Program Files\Adobe\Adobe After Effects 2022\Support Files\AfterFX.exe"
    }
}

activateRunAudition() 
{
    IfWinExist, ahk_class audition14
    {
        WinActivate, ahk_class audition14
    }
    else
    {
        Run, "C:\Program Files\Adobe\Adobe Audition 2022\Adobe Audition.exe"
    }
}

activateRunPhotoshop() 
{
    IfWinExist, ahk_class Photoshop
    {
        WinActivate, ahk_class Photoshop
    }
    else
    {
        Run, "C:\Program Files\Adobe\Adobe Photoshop 2022\Photoshop.exe"
    }
}

activateRunIllustrator() 
{
    IfWinExist, ahk_class illustrator
    {
        WinActivate, ahk_class illustrator
    }
    else
    {
        Run, "C:\Program Files\Adobe\Adobe Illustrator 2020\Support Files\Contents\Windows\Illustrator.exe"
    }
}

activateRunWord() 
{
    IfWinExist, ahk_class OpusApp
    {
        WinActivate, ahk_class OpusApp
    }
    else
    {
        CoordMode, Mouse, Screen
        MouseClick, Left, 665, 1419
    }
}

activateRunMSTeams() 
{
    SetTitleMatchMode, 2

    IfWinExist, Microsoft Teams
    {
        winActivate, Microsoft Teams
    }
}

activateRunOctopus() 
{
    IfWinExist, ahk_class SunAwtFrame
    {
        WinActivate, ahk_class SunAwtFrame
    }
    else
    {
        Run, "C:\Program Files (x86)\Java\jre1.8.0_201\bin\javaws.exe" -localfile -J-Djnlp.application.href=http://oct-bishkek.kg.corp.rferl.org/client/octopus.jnlp "C:\Users\timaevt\AppData\LocalLow\Sun\Java\Deployment\cache\6.0\27\2f96bddb-3e796dce"
    }
}

activateRunChrome() 
{
    SetTitleMatchMode, 2
    IfWinExist, Google Chrome
    {
        WinActivate, Google Chrome
    }
    else
    {
        Run, C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
    }
}

activateRunFilezilla() 
{
    SetTitleMatchMode, 2
    IfWinExist, ahk_class wxWindowNR
    {
        WinActivate, ahk_class wxWindowNR
        WinWaitActive, ahk_class wxWindowNR, ,2
        Send {F5}
    }
    else
    {
        Run, C:\Program Files\FileZilla FTP Client\filezilla.exe
    }
}

digaMagic()
{
    IfWinExist ahk_class DIGASDBM 
    {
        IfWinActive ahk_class DIGASDBM 
        {
            MouseClick, right
            Send {Down 11}
            Send {Enter}
            Send {Down}
            Send {Tab 2}
            Send {Down 2}
            Send {Enter}
            Send {Enter}
            changeKeyboardLanguage("english")
            ;Sleep,100
            ;currentDateEntry("path")
            ;    Sleep, 4000	
        } 
        else 
        {
            WinActivate ahk_class DIGASDBM
        }
    } 
    else 
    {
        IfWinActive ahk_class #32770
        {
            BlockInput, On

            SendInput, toroevm
            Sleep, 5
            Send, {Tab}
            Sleep, 5
            SendInput, pp
            Sleep, 5
            Send, {Enter}

        }
        else
        {
            BlockInput, On
            Run, C:\DIGAS\DigaLoad.exe
            WinWaitActive, ahk_class #32770,,6
            if ErrorLevel = 1 
            {
                Errorlevel = 0
                Goto, CancelDigaMagic
            }

            SendInput, toroevm
            Sleep, 5
            Send, {Tab}
            Sleep, 5
            SendInput, pp
            Sleep, 5
            Send, {Enter}

            WinWaitActive, ahk_class DIGASDBM,,6
            if ErrorLevel = 1 
            {
                Errorlevel = 0
                Goto, CancelDigaMagic
            }
            MouseClick, left, 26,221
        } 
    }
    CancelDigaMagic:
        BlockInput, Off
    }

    finalToMasterFiles()
    {
        global CurrentDateFolder 
        global MasterFilesFolder
        CurrentDateFinalFolder = %CurrentDateFolder%\FINAL

        Loop, %CurrentDateFinalFolder%\*.*
        {

            if A_LoopFileAttrib contains H,R,S ; Skip any file that is either H (Hidden), R (Read-only), or S (System). Note: No spaces in "H,R,S".
                continue

            StringRight, ext, A_LoopFileName, 3
            if (ext != "mp4")
            {
                Msgbox, Encoding in progress. Please wait.
                Goto, EncodingProcess
            }
        }

    Okaytocopy:

        FileCopy, %CurrentDateFinalFolder%\*.mp4, %MasterFilesFolder%\*.*, false
        ErrorCount := ErrorLevel
        filesFinal =
        Loop %CurrentDateFinalFolder%\*.mp4
        {
            filesFinal = %filesFinal%`n`n%A_LoopFileName%
        }

        MsgBox,262144,Files in FINAL,% filesFinal ,5
    return

    EncodingProcess:
    return
}

changeKeyboardLanguage(language)
{
    if language = english
        Send, {Alt Down}{Shift Down}6{Shift Up}{Alt Up}
    else if language = russian
        Send, {Alt Down}{Shift Down}7{Shift Up}{Alt Up}
}

linearKeyframe()
{
    IfWinActive ahk_class Premiere Pro
    {
        changeKeyboardLanguage("english")
        Sleep, 20
        MouseClick, Right
        Sleep, 30
        Send, t
        Sleep, 30	
        Send, l
    }
    IfWinActive ahk_class AE_CApplication_14.2
    {
        Send, {Ctrl Down}{Click}{Ctrl up}
    }
}

easeInKeyframe()
{
    IfWinActive ahk_class Premiere Pro
    {
        changeKeyboardLanguage("english")
        Sleep, 20	
        MouseClick, Right
        Sleep, 30
        Send, t
        Sleep, 30	
        Send, e
        Sleep, 30	
        Send, {Enter}
    }

    IfWinActive ahk_class AE_CApplication_14.2
    {
        Send {Shift down}{F9}{Shift Up}
    }
}

easeOutKeyframe()
{
    IfWinActive ahk_class Premiere Pro
    {
        changeKeyboardLanguage("english")
        Sleep, 20
        MouseClick, Right
        Sleep, 30
        Send, t
        Sleep, 30	
        Send, e
        Sleep, 30
        Send, e
        Sleep, 30	
        Send, {Enter}
    }

    IfWinActive ahk_class AE_CApplication_14.2
    {
        Send {Ctrl down}{Shift down}{F9}{Shift Up}{Ctrl Up}
    }
}

spatialLinearKeyframe()
{
    changeKeyboardLanguage("english")
    Sleep, 20
    MouseClick, Right
    Sleep, 30
    Send, {Up}
    Sleep, 30	
    Send, {Right}
    Sleep, 30
    Send, l
}

temporalLinearKeyframe()
{
    changeKeyboardLanguage("english")
    Sleep, 20
    MouseClick, Right
    Sleep, 30
    Send, t
    Sleep, 30	
    Send, l
}

easeKeyframe()
{
    IfWinActive ahk_class Premiere Pro
    {
        changeKeyboardLanguage("english")
        Sleep, 20
        MouseClick, Right
        Sleep, 30
        Send, t
        Sleep, 30	
        Send, b
    }

    IfWinActive ahk_class AE_CApplication_14.2
    {
        Send {F9}
    }
}

currentDateEntry(additionals)
{

    global CurrentDateFolder 
    global CurrentDate

    if additionals = path
    {
        Send, %CurrentDateFolder% 
        Send, {Enter}
    }
    else if additionals = export
    {
        SetKeyDelay, -1
        Send, -
        Send %CurrentDate%
        ;Sleep, 2000
        Send, -CTA
        SetKeyDelay, -1
    }
}

currentDateEntryPath()
{
    FormatTime, CurrentDate,, yyMMdd
    FormatTime, CurrentYear,, yyyy
    FormatTime, CurrentMonth,, MM
    CurrentDateFolder = \\bishkeknas02\CurrentTimeAsia\%CurrentYear%-%CurrentMonth%\%CurrentDate%
    Send, %CurrentDateFolder% 
    Send, {Enter}
}

currentDateEntryExport()
{
    global CurrentDate
    global CurrentYear
    global CurrentMonth
    CurrentDateFolder = \\bishkeknas02\CurrentTimeAsia\%CurrentYear%-%CurrentMonth%\%CurrentDate%
    Send, -%CurrentDate%-CTA
}

prPanelFocus(panel)
{
    IfWinActive ahk_class Premiere Pro
    {
        if panel = project
            Send, +1

        else if panel = effectcontrols
            Send, +3

        else if panel = essentialgraphics
            Send, +7

        else if panel = effects
            Send, +5

        else if panel = audiotrackmixer
            Send, +6

        else if panel = timeline
            Send, +9

        else if panel = lumetri
            Send, ^+{NumpadEnter}	

        else if panel = scopes
            Send, ^+{NumpadAdd}
    }
    else
        WinActivate ahk_class Premiere Pro
}

premiereFindEffect(preffectname)
{

    SetTitleMatchMode, 2

    ifWinActive ahk_class Premiere Pro
    {
        changeKeyboardLanguage("english")
        Sleep, 20

        if preffectname = Cross Fade 
        {
            Send, +d
            return
        }

        prPanelFocus("effects")
        Sleep, 20
        Send ^!+F
        sleep 20
        Send +{backspace} ;shift backspace deletes any text that may be present.
        Sleep, 10 
        Send, %preffectname%
        if preffectname = Exponential fade 
            return
        applyPremPreset(preffectname)
    return
}
else ifWinActive ahk_class audition12
{
    if preffectname = MBC v1 chemradio
        Send, ^+1
    if preffectname = Parametric equalizer
        Send, ^+2
    if preffectname = Hard Limiter
        Send, ^+3
    if preffectname = Cross Fade
        Send, ^+4
    if preffectname = Exponential Fade
        Send, ^+5
    return
}
}

advancedPremiereExport()
{ 
    IfWinActive ahk_class Premiere Pro
    {
        FormatTime, CurrentDate,, yyMMdd
        FormatTime, CurrentYear,, yyyy
        FormatTime, CurrentMonth,, MM

        global CurrentDateFolder ;;= \\bishkeknas02\CurrentTimeAsia\%CurrentYear%-%CurrentMonth%\%CurrentDate%
        global CurrentDateFinalFolder ;;= %CurrentDateFolder%\FINAL

        changeKeyboardLanguage("english")
        Sleep, 500
        Send, {Ctrl Up}
        Send, ^m
        Send, {Ctrl Up}

        WinWaitActive, ahk_class #32770
        if ErrorLevel = 1 
            Gosub, CancelAdvancedPremiereExport

        BlockInput, On
        MouseClick, left, 875, 225
        ; 2019 MouseClick, left, 870, 225
        WinWaitActive, Save As,,5
        if ErrorLevel = 1 
            Gosub, CancelAdvancedPremiereExport

        ;click in the adress bar and enter current final folder path
        MouseClick, left, 900, 46
        Sleep, 10
        SendInput %CurrentDateFinalFolder%
        Sleep, 10
        Send, {Enter}
        Sleep, 1500

        WinWaitActive, Save As
        Sleep, 10
        Send, {Tab 6}
        Sleep, 10
        Send, {Home}

        BlockInput, Off
    return

    CancelAdvancedPremiereExport:
        ErrorLevel=0
        BlockInput, Off
    return
}
}

superLauncher()
{

    SetTitleMatchmode, 2
    IfWinExist Superlauncher
    {
        IfWinActive Superlauncher
        {
            Send, {Escape}
            Return
        } else {
            WinActivate Superlauncher
            Return
        }
    }

    global CurrentDateFolder 
    global CurrentYear
    global CurrentMonth
    global CurrentDate
    global SpecDateFolder

    Gui, Font, s13, Roboto Condensed
    Gui, Margin , 50, 15

    folders =
    Loop, %CurrentDateFolder%\*.*, 2
    {
        folders = %folders%`n%A_LoopFileName%
        Gui 1:Add, Button, w150 h40 c87BBFF gForceFolder, % A_Index ". " A_LoopFileName
    }

    Gui 1:Add, Button, w150 h30 gCTAFILES, Redak\CTA Files
    ;;Gui 1:Add, Button, w150 h30 gCURRENTTIMEASIA, Current Time Asia
    ;;Gui 1:Add, Button, w150 h30 gPREMIEREPROJECTS, Premiere Projects
    ;;Gui 1:Add, Button, w150 h30 gMASTERFILES, Master Files
    Gui 1:Add, Button, w150 h30 gSIGNIANT, SIGNIANT-TA
    Gui 1: Add, Edit, w150 vSpecDateFolder, %CurrentDate%
    Gui 1: Add, Button, Default w150 h30 gOpenSpecDateFolder, Open Date Folder
    Gui, Show, , TIM Superlauncher v1
    Return

    OpenSpecDateFolder:	
        {
            Gui, Submit
            StringLeft, folderYear, SpecDateFolder, 2
            folderFullYear = 20%folderYear%
            folderMonth := SubStr(SpecDateFolder, 3, 2)
            StringRight, folderDay, SpecDateFolder, 2

            if (folderFullYear == 2017) 
            {
                IfNotExist, \\bishkeknas02\CurrentTimeAsia\%folderFullYear%-Prague\%folderFullYear%-%folderMonth%\%folderYear%%folderMonth%%folderDay%\
                    Goto, NOSUCHFOLDER

                Run, \\bishkeknas02\CurrentTimeAsia\%folderFullYear%-Prague\%folderFullYear%-%folderMonth%\%folderYear%%folderMonth%%folderDay%\
                Gui Destroy
                Return
            }
            else 
            {
                IfNotExist, \\bishkeknas02\CurrentTimeAsia\%folderFullYear%\%folderFullYear%-%folderMonth%\%folderYear%%folderMonth%%folderDay%\
                    Goto, NOSUCHFOLDER

                Run, \\bishkeknas02\CurrentTimeAsia\%folderFullYear%\%folderFullYear%-%folderMonth%\%folderYear%%folderMonth%%folderDay%\
                Gui Destroy
                Return
            }

            Gui Destroy
            Return
        }

    ForceFolder:
        {
            ControlGetFocus, SelectedButton, A
            ControlGetText, ButtonName, %SelectedButton%, A
            StringGetPos, DotPoint, ButtonName, .
            DotPoint := DotPoint + 2
            StringTrimLeft, ButtonSplit, ButtonName, %DotPoint%
            Run, %CurrentDateFolder%\%ButtonSplit%
            Gui Destroy
            return
        }

    CTAFILES:
        {
            Run, \\bishkekdc02\Redak\CTA files
            Gui Destroy
            Return
        }

    CURRENTTIMEASIA:
        {
            Run, \\bishkeknas02\CurrentTimeAsia
            Gui Destroy
            Return
        }

    PREMIEREPROJECTS:
        {
            Run, \\bishkeknas02\CurrentTimeAsia\Projects\%CurrentYear%-%CurrentMonth%\
            Gui Destroy
            Return
        }

    MASTERFILES:
        {
            Run, \\BISHKEKNAS01\Master_Files
            Gui Destroy
            Return
        }

    SIGNIANT:
        {
            Run, \\bishkeknas02\Signiant_TA\TA-CT
            Gui Destroy
            Return
        }

    NOSUCHFOLDER:
        {
            Gui Destroy
            MsgBox, No such folder.
            Return
        }

    GuiEscape:
        Gui Destroy
    Return
}

applyPremPreset(preffectname)
{
    sleep, 100
    coordmode, pixel, Window
    coordmode, mouse, Window
    coordmode, Caret, Window

    BlockInput, On
    MouseGetPos, xposP, yposP

    loop
    {
        waiting2 ++
        sleep 33
        tooltip, counter = (%waiting2% * 33)`nCaret = %A_CaretX%
        if (A_CaretX <> "")
        {
            tooltip, CARET WAS FOUND
            break
        }

        if (waiting2 > 30)
        {
            tooltip, FAIL - no caret found. `nIf your cursor will not move`, hit the button to call the preset() function again.`nTo remove this tooltip`, refresh the script using its icon in the taskbar.
            sleep 200
        }
    }

    sleep 1
    tooltip,

    if ( preffectname = "Dip to white" )
    {
        BlockInput, Off
        Goto, presetApplyEnd
    }

    SendMode Event
    MouseMove, %A_CaretX%, %A_CaretY%
    Sleep, 30
    MouseMove, +0,+50,,R
    Sleep, 30
    MouseClickDrag, Left, , , %xposP%, %yposP%, 1

    presetApplyEnd:
        BlockInput, Off
        SendMode Input
    return
}

premiereFindMogrt(mogrt)
{

    SetTitleMatchMode, 2
    ifWinActive ahk_class Premiere Pro
    {
        changeKeyboardLanguage("english")
        Sleep, 20
        prPanelFocus("project")
        Sleep, 20
        Send ^!+F
        sleep 20
        Send +{backspace} ;shift backspace deletes any text that may be present.
        Sleep, 20 
        Send, %mogrt%
        insertMogrt(mogrt)
    }
}

insertMogrt(mogrt)
{
    sleep, 100
    coordmode, pixel, Window
    coordmode, mouse, Window
    coordmode, Caret, Window
    BlockInput, On
    MouseGetPos, xposP, yposP

    loop
    {
        waiting2 ++
        sleep 33
        tooltip, counter = (%waiting2% * 33)`nCaret = %A_CaretX%
        if (A_CaretX <> "")
        {
            tooltip, CARET WAS FOUND
            break
        }

        if (waiting2 > 30)
        {
            tooltip, FAIL - no caret found. `nIf your cursor will not move`, hit the button to call the preset() function again.`nTo remove this tooltip`, refresh the script using its icon in the taskbar.
            sleep 200
        }
    }

    sleep 1
    tooltip,

    SendMode Event
    MouseMove, %A_CaretX%, %A_CaretY%
    Sleep, 20
    MouseMove, +10,+85,,R
    Sleep, 20
    MouseClickDrag, Left, , , %xposP%, %yposP%, 1

    sleep 200	
    prPanelFocus("project")
    Sleep, 20
    Send ^!+F
    Sleep,20
    Send +{backspace}
    MouseClick, Middle

    insertMogrtEnd:
        BlockInput, Off
    return
}

pasteColor(color)
{
    if (color = "pool")
        SendRaw, 0ECAE3
    else if (color = "midnight")
        SendRaw, 102C44
    else if (color = "raspberry")
        SendRaw, FF0055
    else if (color = "heather")
        SendRaw, DEE5EC
}

sendCountryName(country)
{
    changeKeyboardLanguage("russian")
    if (country = "KG")
        SendRaw, ����������
    else if (country = "KZ")
        SendRaw, ���������
    else if (country = "TJ")
        SendRaw, �����������
    else if (country = "TM")
        SendRaw, ������������
    else if (country = "UZ")
        SendRaw, ����������
    else if (country = "RU")
        SendRaw, ������
    else if (country = "CN")
        SendRaw, �����
    else if (country = "US")
        SendRaw, ���
    else if (country = "UA")
        SendRaw, �������
}

octopusItem(action, type)
{
    if (action = "NEW")
    {
        MouseClick, right
        Send, {Down}{Right}
    }
    else if (action = "CONVERT")
    {
        MouseClick, right
        Send, {Down 5}{Right}
    }
    else if (action = "CAM1")
    {
        MouseClick, Left
        SendRaw, <<CAM1>>
    Return
}
else if (action = "CAM2")
{
    MouseClick, Left
    SendRaw, <<CAM2>>
    Return	
}
else if (action = "CAM3")
{
    MouseClick, Left
    SendRaw, <<CAM3>>
    Return
}
else if (action = "DOUBLE BOX")
{
    MouseClick, Left
    SendRaw, <<DOUBLE BOX>>
    Return
}
else if (action = "DELETE")
{
    MouseClick, right
    Send, {Down 2}{Enter}
    Return
}

if (type = "PKG")
{
    Send, {Down 9}{Enter}
}
else if (type = "VO")
{
    Send, {Down 15}{Enter}
}
else if (type = "OC")
{
    Send, {Down 4}{Enter}
}
else if (type = "OTS")
{
    Send, {Down 6}{Enter}
}
else if (type = "SOT")
{
    Send, {Down 13}{Enter}
}
else if (type = "B-ROLL")
{
    Send, {Enter}
}
else if (type = "REMOTE")
{
    Send, {Down 11}{Enter}
}
else if (type = "SKYPE")
{
    Send, {Down 12}{Enter}
}
else if (type = "TRANSITION")
{
    Send, {Down 14}{Enter}
}

}

youtubeFacebookDownloader() 
{

    Send {Ctrl down}{Ins}{Ctrl up}
    Sleep 50
    Clipwait
    fullURL = %clipboard%
    StringTrimLeft, shortURL, fullURL, 12
    StringLeft, siteID, shortURL, 7

    ;Msgbox, % shortURL
    ;Msgbox, % siteID

    if (siteID == "youtube")
        Goto, YoutubeDownload
    else if (siteID == "faceboo")
        Goto, FacebookDownload

    YoutubeDownload:
        Run, https://ss%shortURL%
    return

    FacebookDownload:
        Run, https://en.savefrom.net/#url=%fullURL%
    return
}

