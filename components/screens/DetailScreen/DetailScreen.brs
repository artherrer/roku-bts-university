sub init()
    m.title = m.top.findNode("title")
    m.poster = m.top.findNode("poster")
    m.description = m.top.findNode("description")
    m.playButton = m.top.findNode("playButton")
    m.posterGrid = m.top.findNode("posterGrid")
    
    m.posterGrid.observeField("itemFocused", "OnFocusItem")
    m.top.ObserveField("posterGridNode", "OnPosterGridUpdate")
end sub


sub OnPosterGridUpdate(event)
    node = event.getData()
    m.posterGrid.content = node.content
end sub


sub setVideo(video)
    if video <> invalid then
        m.title.text = video.title
        m.description.text = video.description
        m.poster.uri = video.thumbnail
    end if
end sub

sub OnFocusItem(event)
    index = event.getData()
    video = m.posterGrid.content.getChild(index)
    setVideo(video)
end sub


sub OnJumpToItem(event) ' invoked when jumpToItem field is populated
    index = event.getData()
    video = m.posterGrid.content.GetChild(index) ' get metadata of focused item
    setVideo(video)
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