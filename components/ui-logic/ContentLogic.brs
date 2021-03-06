sub RunContentTask()
    m.loadingIndicator.visible = true ' show loading indicator while content is loading
    m.contentTask = CreateObject("roSGNode", "LoadCategoriesTask") ' create task for feed retrieving
    ' observe content so we can know when feed content will be parsed
    m.contentTask.ObserveField("content", "OnMainContentLoaded")
    m.contentTask.control = "run" ' GetContent(see MainLoaderTask.brs) method is executed
end sub

sub OnMainContentLoaded() ' invoked when content is ready to be used
    m.CategoryScreen.SetFocus(true) ' set focus to GridScreen
    m.CategoryScreen.content = m.contentTask.content ' populate GridScreen with content
    m.loadingIndicator.visible = false ' hide loading indicator because content was retrieved
end sub