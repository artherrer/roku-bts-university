sub init()
    m.top.functionname = "getCategories"
end sub


function getCategories()
    app_info = createObject("roAppInfo")
    http = CreateObject("roURLTransfer")
    http.SetCertificatesFile("common:/certs/ca-bundle.crt")
    http.SetURL(app_info.getValue("base_url"))
    response = http.GetToString()
    rows = []

    ' parse the feed and build a tree of ContentNodes to populate the GridView
    m.json = ParseJson(response)
    if m.json <> invalid
        for each category in m.json.categories
            videos2 = getVideosFromPlaylist(category.playlistName)
            content = CreateObject("roSGNode", "CategoryNode")
            content.title = category.name
            content.playlistName = category.playlistName
            content.appendChildren(videos2)
            rows.Push(content)
        end for
    end if
    ' set up a root ContentNode to represent rowList on the GridScreen
    contentNode = CreateObject("roSGNode", "ContentNode")
    contentNode.Update({
        children: rows
    }, true)
    ' populate content field with root content node.
    ' Observer(see OnMainContentLoaded in MainScene.brs) is invoked at that moment
    m.top.content = contentNode
end function


function getVideosFromPlaylist(playlistName)
    if m.json <> invalid
        for each playlists in m.json.playlists
            if playlistName = playlists.name
                return getVideoFromIds(playlists.itemIds)
            end if
        end for
    end if
end function


function getVideoFromIds(ids)
    videos = []

    for each video in m.json.shortFormVideos
        for each id in ids
            if video.id = id
                node = createObject("roSGNode", "ThumbnailNode")
                node.url = video.content.videos[0].url
                node.format = video.content.videos[0].videoType
                node.title = video.title
                node.description = video.shortDescription
                node.thumbnail = video.thumbnail
                node.HDGRIDPOSTERURL = video.thumbnail
                node.SHORTDESCRIPTIONLINE1 = video.title
                videos.push(node)
            end if                
        end for
    end for

    return videos
end function


' function exampleRequest()
'     app_info = createObject("roAppInfo")
'     category = m.top.category
'     http = createObject("roUrlTransfer")
'     http.RetainBodyOnError(true)
'     port = createObject("roMessagePort")
'     http.setPort(port)
'     http.setCertificatesFile("common:/certs/ca-bundle.crt")
'     http.InitClientCertificates()
'     http.enablehostverification(false)
'     http.enablepeerverification(false)
'     http.setUrl(app_info.getValue("base_url"))
'     if http.AsyncGetToString() Then
'       msg = wait(10000, port)
'       if (type(msg) = "roUrlEvent")
'         if (msg.getresponsecode() > 0 and  msg.getresponsecode() < 400)
'           m.top.response = msg.getstring()
'         else
'           ? "feed load failed: "; msg.getfailurereason();" "; msg.getresponsecode();" "; m.top.url
'           m.top.response = ""
'         end if
'         http.asynccancel()
'       else if (msg = invalid)
'         ? "feed load failed."
'         m.top.response =""
'         http.asynccancel()
'       end if
'     end if

' end function