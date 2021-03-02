sub init()
  m.video = m.top.findNode("videoPlayer")
  m.video.setFocus(true)
  m.top.observeField("content", "OnVideoSet")
  m.top.observeField("visible", "OnVisibleSet")
end sub


function OnVisibleSet(visible)
  m.video.control = "stop"
  m.video.visible = false
  m.video.content = invalid
end function


sub OnVideoSet()
  itemIndex = m.top.itemIndex
  ? itemIndex
  videoCount = m.top.content.getChildCount()
  videos = m.top.content.getChildren(videoCount, 0)

  if itemIndex <> 0
    videos = m.top.content.getChildren(videoCount - itemIndex, itemIndex)
  end if

  videoContent = createObject("RoSGNode", "ContentNode")
  videosToAppend = []
  for each item in videos
    videoTemp = createObject("RoSGNode", "ContentNode")
    videoTemp.url = item.url
    videoTemp.title = item.title
    videoTemp.streamformat = item.streamformat
    videoTemp.description = item.description

    videosToAppend.push(videoTemp)
  end for
  videoContent.update({ children: videosToAppend }, true)

  m.video.contentIsPlaylist = true
  m.video.visible = true
  m.video.content = videoContent
  m.video.control = "play"
end sub