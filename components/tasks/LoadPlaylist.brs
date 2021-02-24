sub init()
    m.top.functionname = "getPlaylist"
    m.top.response = ""
end sub

function getPlaylist()
  app_info = createObject("roAppInfo")
  http = CreateObject("roURLTransfer")
  http.SetCertificatesFile("common:/certs/ca-bundle.crt")
  http.SetURL(app_info.getValue("base_url"))
  response = http.GetToString()

  ' parse the feed and build a tree of ContentNodes to populate the GridView
  json = ParseJson(response)
  if json <> invalid
      for each playlists in json.playlists
          if m.top.playlistName = playlists.name then
            m.top.response = FormatJson(playlists)
          end if
      end for
  end if
end function