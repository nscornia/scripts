SetTitleMatchMode, 2 ; So that we can partial match window title

; Fix MRU in NetBeans
#IfWinActive, NetBeans IDE
#f::
  OldClipboard = %Clipboard%
  Clipboard := ""
  Sleep 50
  SendInput, !+f ; copy selected text
  Sleep 50
  SendInput, ^a^c ; copy selected text

  ClipWait 0
  If ErrorLevel
    {
      MsgBox, No Text Selected!
      Return
    }
  ReplacementCount := 0
  Clipboard := RegExReplace(Clipboard, "\s*\{\s+\}", "{}", ReplacementCount)
  SendInput, ^v ; paste
  Sleep 50
  Clipboard = %OldClipboard%
  Sleep 50

Return
