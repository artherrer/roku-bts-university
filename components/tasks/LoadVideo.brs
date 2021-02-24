sub init()
    m.top.functionname = "getVideo"
    m.top.response = ""
end sub

function getVideo()
  videoId = m.top.id
  app_info = createObject("roAppInfo")
  http = CreateObject("roURLTransfer")
  http.SetCertificatesFile("common:/certs/ca-bundle.crt")
  http.SetURL(app_info.getValue("base_url"))
  response = http.GetToString()

  ' parse the feed and build a tree of ContentNodes to populate the GridView
  json = ParseJson(response)
  if json <> invalid
      for each video in json.shortFormVideos
          if m.top.id = video.id then
            m.top.response = FormatJson(video)
          end if
      end for
  end if
end function