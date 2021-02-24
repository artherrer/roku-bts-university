function init()
	? "===>>> [MainScene] init"

    m.top.backgroundURI = ""
	m.top.backgroundColor = "0x171F5E"
	m.loadingIndicator = m.top.FindNode("loadingIndicator") ' store loadingIndicator node to m

	InitScreenStack()
    ShowCategoryScreen()
    RunContentTask()
end function

function OnSelectOption(index)
    index = index.getData()
    if index = 0
        dialog = CreateObject("roSGNode", "KeyboardDialog")
        dialog.observeField("buttonSelected", "OnSetUsername")
        dialog.title = "Set your username"
        dialog.buttons = ["Accept"]
        dialog.visible = true
        dialog.optionsDialog = true
        dialog.setFocus(true)
        m.top.dialog = dialog
    else if index = 1
        dialog = CreateObject("roSGNode", "Dialog")
        dialog.observeField("buttonSelected", "OnSelectOption")
        dialog.title = "About BTS University"
        dialog.message = "BTS University is the online platform where you can learn about software technologies completely free. Join our University with thousand students arround the world!"
        dialog.visible = true
        dialog.optionsDialog = true
        dialog.setFocus(true)
        m.top.dialog = dialog
    end if
    
end function

' The OnKeyEvent() function receives remote control key events
function OnkeyEvent(key as String, press as Boolean) as Boolean
    result = false
    if press
        ? key
        ' handle "back" key press
        if key = "back"
            numberOfScreens = m.screenStack.Count()
            ' close top screen if there are two or more screens in the screen stack
            if numberOfScreens > 1
                CloseScreen(invalid)
                result = true
            end if
        end if

        if key = "options"
            dialog = CreateObject("roSGNode", "Dialog")
            dialog.observeField("buttonSelected", "OnSelectOption")
            dialog.title = "Options"
            dialog.message = "Choose your option:"
            dialog.buttons = ["Set Username", "About BTS University"]
            dialog.visible = true
            dialog.optionsDialog = true
            dialog.setFocus(true)
            m.top.dialog = dialog
        end if
    end if
    ' The OnKeyEvent() function must return true if the component handled the event,
    ' or false if it did not handle the event.
    return result
end function


Function GetUsername() As Dynamic
     sec = CreateObject("roRegistrySection", "User")
     if sec.Exists("username")
         return sec.Read("username")
     endif
     return invalid
End Function

Function OnSetUsername() As Void
    username  = m.top.dialog.text
    sec = CreateObject("roRegistrySection", "User")
    sec.Write("username", username)

     userLabel = m.global.findNode("globalUsername")
     if userLabel = invalid
        label = CreateObject("roSGNode", "Label")
        label.id = "globalUsername"
        label.text = username
        userLabel = m.global.AppendChild(label)
     else
        userLabel.text = username
     end if

     m.top.dialog.close = true
End Function


