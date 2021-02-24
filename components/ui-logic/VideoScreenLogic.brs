' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********

' Note that we need to import this file in MainScene.xml using relative path.

sub ShowVideoScreen(video)
    m.VideoScreen = CreateObject("roSGNode", "VideoScreen")
    m.VideoScreen.content = video
    ShowScreen(m.VideoScreen) '
end sub
