' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********

' Note that we need to import this file in MainScene.xml using relative path.

sub ShowCategoryScreen()
    m.CategoryScreen = CreateObject("roSGNode", "CategoryScreen")
    m.CategoryScreen.observeField("rowItemSelected", "OnCategoryItemSelected")
    ShowScreen(m.CategoryScreen) '
end sub

sub OnCategoryItemSelected(event)
    index = event.getData()
    rowList = m.CategoryScreen.findNode("rowList")
    categoryNode = rowList.content.getChild(index[0]) ' That node include ThumbnailNode children
    ShowContentScreen(categoryNode, index[1])
end sub 