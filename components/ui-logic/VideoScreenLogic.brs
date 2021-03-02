' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********

' Note that we need to import this file in MainScene.xml using relative path.

sub ShowVideoScreen(categoryNode, itemIndex)
    ? itemIndex
    m.VideoScreen = CreateObject("roSGNode", "VideoScreen")
    m.VideoScreen.observeField("state", "OnVideoPlayerStateChange")
    m.VideoScreen.itemIndex = itemIndex
    m.VideoScreen.content = categoryNode
    ShowScreen(m.VideoScreen) '
end sub


sub OnVideoPlayerStateChange() ' invoked when video state is changed
    state = m.VideoScreen.state
    ' close video screen in case of error or end of playback
    if state = "error" or state = "finished"
        CloseScreen(m.VideoScreen)
    end if
end sub
