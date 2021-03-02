sub init()
    m.playButton = m.top.FindNode("playButton")
    m.posterGrid = m.top.FindNode("posterGrid")
    m.title = m.top.FindNode("title")
    
    m.top.observeField("visible", "onVisibleChange")
    m.top.observeField("content", "OnLoadContent")
    ' m.playButton.setFocus(true)
end sub


sub onVisibleChange()
    if m.top.visible = true then
        m.posterGrid.setFocus(true)
    end if
end sub


sub OnLoadContent()
    m.title.text = m.top.content.title
    content = CreateObject("roSGNode", "ContentNode")
    m.posterGrid.content = m.top.content
    m.posterGrid.jumpToItem = m.top.index
    m.posterGrid.setFocus(true)
end sub


function onKeyEvent(key, press) as boolean
    if key = "up"
        m.posterGrid.setFocus(false)
        m.playButton.setFocus(true)
    end if

    if key = "down"
        m.posterGrid.setFocus(true)
        m.playButton.setFocus(false)
    end if
end function