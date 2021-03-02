' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********

' Note that we need to import this file in MainScene.xml using relative path.

sub ShowContentScreen(categoryNode, index)
    m.ContentScreen = CreateObject("roSGNode", "ContentScreen")
    m.ContentScreen.ObserveField("runPlaylist", "RunPlaylist")
    m.ContentScreen.ObserveField("itemSelected", "OnItemSelected")
    m.ContentScreen.index = index
    m.ContentScreen.content = categoryNode
    ShowScreen(m.ContentScreen) '
end sub


sub RunPlaylist()
    itemIndex = 0
    categoryNode = m.ContentScreen.content
    ShowVideoScreen(categoryNode, itemIndex)
end sub


sub OnItemSelected(event)
    itemIndex = event.getData()
    posterGridNode = m.ContentScreen.findNode("posterGrid")
    ShowDetailScreen(posterGridNode.content, itemIndex)
end sub

