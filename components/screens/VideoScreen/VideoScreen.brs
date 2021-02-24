sub init()
  m.top.setFocus(true)
  m.top.observeField("content", "OnVideoSet")
end sub


sub OnVideoSet()
  video = m.top.content
  videoContent = createObject("RoSGNode", "ContentNode")
  videoContent.url = video.url
  videoContent.title = video.title
  videoContent.streamformat = video.format

  m.video = m.top.findNode("videoPlayer")
  m.video.content = videoContent
  m.video.control = "play"
end sub