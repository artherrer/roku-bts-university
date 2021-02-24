' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********

' Note that we need to import this file in MainScene.xml using relative path.

sub ShowCategoryScreen()
    m.CategoryScreen = CreateObject("roSGNode", "CategoryScreen")
    m.CategoryScreen.observeField("rowListSelected", "OnCategoryItemSelected")
    ShowScreen(m.CategoryScreen) '
end sub

sub OnCategoryItemSelected(event)
    index = event.getData()
    node = m.CategoryScreen.findNode("rowList")
    categoryNode = node.content.getChild(index)
    ShowContentScreen(categoryNode )
end sub 


sub OnPosterItemSelected(event as Object)
    layouts = m.CategoryScreen.findNode("posterGrid")
    selectedIndex = event.GetData()
    nodeContent = layouts.content.GetChild(selectedIndex)
    ShowVideoScreen(nodeContent)
end sub 