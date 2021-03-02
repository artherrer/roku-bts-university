sub ShowDetailScreen(posterGridContent, itemIndex)
    m.DetailScreen = CreateObject("roSGNode", "DetailScreen")
    m.DetailScreen.ObserveField("playButton", "OnPlayButtonSelected")
    m.DetailScreen.itemIndex = itemIndex
    m.DetailScreen.content = posterGridContent
    ShowScreen(m.DetailScreen)
end sub



sub OnPlayButtonSelected()
     poster = m.DetailScreen.findNode("posterGrid")
     index = m.DetailScreen.itemIndex
    ShowVideoScreen(poster.content, index)
end sub