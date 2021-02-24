' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********

' Note that we need to import this file in MainScene.xml using relative path.

sub ShowContentScreen(categoryNode)
    m.ContentScreen = CreateObject("roSGNode", "ContentScreen")
    m.ContentScreen.ObserveField("playButtonSelected", "OnVideoSelected")
    m.ContentScreen.ObserveField("posterGridSelected", "OnItemSelected")
    m.ContentScreen.content = categoryNode
    m.ContentScreen.posterGridNode = categoryNode
    ShowScreen(m.ContentScreen) '
end sub


sub OnVideoSelected()
    videoNode = m.ContentScreen.videoNode
    ShowVideoScreen(videoNode)
end sub


sub OnItemSelected(event)
    selectedItem = event.getData()
    posterGridNode = m.ContentScreen.findNode("posterGrid")
    ShowDetailScreen(posterGridNode, selectedItem)
end sub

