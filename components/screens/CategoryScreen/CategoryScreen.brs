function init()
  ' Handle Focus on back to this Screen
  m.top.observeField("visible", "onVisibleChange")
  ' Handle Dialog on exit
  m.exitDialog = m.top.findNode("exitDialog")
  ' Handle load of Thumbnails
  m.welcomeLabel = m.top.findNode("welcomeLabel")
  m.descriptionLabel = m.top.findNode("descriptionLabel")
  m.questionLabel = m.top.findNode("questionLabel")

  m.rowList = m.top.findNode("rowList")
  m.top.observeField("content", "OnContentLoad")
end function


sub onVisibleChange()
  if m.top.visible = true then
    m.rowList.setFocus(true)
  end if
end sub


function OnContentLoad(data)
  m.welcomeLabel.visible = true
  m.descriptionLabel.visible = true
  m.questionLabel.visible = true
end function


sub showExitDialog()
  m.exitDialog.title = "ERROR"
  m.exitDialog.message = "message"
  m.exitDialog.visible = true
  m.exitDialog.buttons = ["Accept", "Cancel"]
  m.exitDialog.focusButton = 0
  m.top.dialog = m.exitDialog
end sub

