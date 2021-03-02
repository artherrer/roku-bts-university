sub init()
    m.title = m.top.findNode("title")
    m.poster = m.top.findNode("poster")
    m.description = m.top.findNode("description")
    m.playButton = m.top.findNode("playButton")
    m.posterGrid = m.top.findNode("posterGrid")
    
    m.top.ObserveField("content", "OnPosterGridUpdate")
    m.posterGrid.observeField("itemFocused", "OnFocusItem")
end sub


sub OnPosterGridUpdate(content)
    m.posterGrid.content = m.top.content
    m.posterGrid.jumpToItem = m.top.itemIndex

    video = m.posterGrid.content.getChild(m.top.itemIndex)
    m.title.text = video.title
    m.description.text = video.description
    m.poster.uri = video.thumbnail
end sub


sub OnFocusItem(event)
    index = event.getData()
    video = m.posterGrid.content.getChild(index)

    m.top.itemIndex = index
    m.title.text = video.title
    m.description.text = video.description
    m.poster.uri = video.thumbnail
end sub


function onKeyEvent(key, press) as boolean
    if key = "left"
        m.posterGrid.setFocus(false)
        m.playButton.setFocus(true)
    end if

    if key = "right"
        m.posterGrid.setFocus(true)
        m.playButton.setFocus(false)
    end if
end function