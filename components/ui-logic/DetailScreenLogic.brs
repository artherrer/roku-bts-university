sub ShowDetailScreen(posterGridNode, selectedItem)
    m.DetailScreen = CreateObject("roSGNode", "DetailScreen")
    m.DetailScreen.ObserveField("playButtonSelected", "OnPlayButtonSelected")
    m.DetailScreen.posterGridNode = posterGridNode
    m.DetailScreen.jumpToItem = selectedItem
    ShowScreen(m.DetailScreen)
end sub



sub OnPlayButtonSelected()
    index = m.DetailScreen.itemFocused
    videoNode = m.DetailScreen.posterGridNode.content.GetChild(index)
    ShowVideoScreen(videoNode)
end sub