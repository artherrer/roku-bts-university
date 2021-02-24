function init()
    m.keyboard = m.top.findNode("usernameKeyboard")
    m.keyboard.buttons=["Accept", "Cancel"]
    m.keyboard.observeField("buttonSelected", "OnKeyboardOptionSelected")

    m.about = m.top.findNode("aboutDialog")
    m.about.buttons = ["Accept"]
    m.about.observeField("buttonSelected", "closeAboutDialog")


    dialog = CreateObject("roSGNode", "Dialog")
    dialog.title = "Test"
    dialog.message = "Test 2"
    dialog.buttons = ["Set Username", "About BTS University"]
    dialog.observeField("buttonSelected", "OnOptionSelected")
    dialog.visible = true
    dialog.optionsDialog = true
    dialog.setFocus(true)
    m.top.dialog = dialog
end function



function OnOptionSelected(event)
    index = event.getData()

    if index = 0
        m.dialog.visible = false
        m.keyboard.visible = true
        m.keyboard.setFocus(true)
    else
        m.dialog.visible = false
        m.about.visible = true
        m.about.setFocus(true)
    end if

end function

