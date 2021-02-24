function init()
  ' m.categoryList = m.top.findNode("categoryList")
  ' m.posterGrid = m.top.FindNode("posterGrid")
  m.welcomeLabel = m.top.FindNode("welcomeLabel")
  ' Handle Focus on back to this Screen
  m.top.observeField("visible", "onVisibleChange")
  ' Handle Dialog on exit
  m.exitDialog = m.top.findNode("exitDialog")
  ' Handle load of Thumbnails
  m.categorySelected = invalid
  m.rowList = m.top.findNode("rowList")
end function


function OnItemSelected(data) 
  print data.getData()
  
end function


sub onVisibleChange()
  if m.top.visible = true then
    m.rowList.setFocus(true)
  end if
end sub


sub showExitDialog()
  m.exitDialog.title = "ERROR"
  m.exitDialog.message = "message"
  m.exitDialog.visible = true
  m.exitDialog.buttons = ["Accept", "Cancel"]
  m.exitDialog.focusButton = 0
  m.top.dialog = m.exitDialog
end sub

