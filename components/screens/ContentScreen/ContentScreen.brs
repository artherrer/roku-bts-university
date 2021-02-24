sub init()
    m.selectedVideo = invalid
    m.description = m.top.FindNode("description")
    m.playButton = m.top.FindNode("playButton")
    m.posterGrid = m.top.FindNode("posterGrid")
    m.thumbnail = m.top.FindNode("thumbnail")
    m.title = m.top.FindNode("title")
    
    m.posterGrid.ObserveField("itemFocused", "OnItemFocused")
    m.top.observeField("visible", "onVisibleChange")
    m.top.observeField("content", "OnLoadContent")
    m.top.observeField("posterGridNode", "OnLoadPosterGrid")
    m.playButton.setFocus(true)
end sub


sub onVisibleChange()
    if m.top.visible = true then
        m.posterGrid.setFocus(true)
    end if
end sub


sub OnLoadPosterGrid()
    m.posterGrid.content = m.top.posterGridNode
    m.top.videoNode = m.posterGrid.content.getChild(0)
end sub


sub OnLoadContent()
    categoryNode = m.top.content
    m.title.text = categoryNode.title
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