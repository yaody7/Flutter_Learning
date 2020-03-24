
# Flutter Learning
```
最近在自学一下Flutter，所以将自己学习过程中做的小App上传上来，并记录一些学习心得以及"坑"。
```

### BottomNavigationBar 底部导航（2020.3.20）
> 这个导航栏的制作是我第一次写一个Stateful组件，其重点就是维护这个widget的状态
> 
> 我们需要在setState这个函数中更新state，接着App就会自动给我们重新调用build方法，
> 
> 那么就可以根据最新的state对页面进行重新加载，以达到动态的目的
> 
> **坑点：**
> 
> BottomNavigationBar这个组件设计的有些特别，加入选项的个数不同，显示的方式也不同，
> 
> 像我这次做的加入了4个item，那么item的颜色就会自动变成白色，
> 
> 此时如果我们不显式地将颜色调整和背景不同的颜色，那么就会看不到我们的导航栏。

### IrregularBottomBar 不规则底部栏 （2020.3.20)
> 紧接着上午的工作，下午我又做了一个不规则底部栏。
>
> 这个不规则底部栏是比较简单的，重点就是在BottomNavigationBar这里放入BottomAppBar，
>
> 并在设计好他的形状，这里用的是一个叫做CircularNotchedRectangle的形状。
>
> 其次，我们需要在Scaffold中设置我们浮动按钮的位置，选择的是centerDocked。
>
> 这次还有一个改动就是将原来四个类似的显示页面的dart文件整合成一个，传入参数对应生成页面即可。
>
> **坑点：**
>
> floatingActionButton的位置设置是在脚手架中的，而不是在floatingActionButton中的，
>
> 之所以这样设计，我认为是设计师觉得一个Button只需要管他的展现形态即可，他的位置应该由
>
> 其父Widget来决定。

### NavigationTransition 路由切换页面动画效果 (2020.3.21)

> 这个动画效果最重点的就是要会写PageRouteBuilder，
>
> 这个组件的构造函数中包含：
>
> - transitionDuration： 转换时间
> - pageBuilder：转换后的页面
> - transitionBuilder：转换构造
>
> 我们在pageBuilder中可以选择返回一个动画过渡效果，例如RotationTransition
>
> 接着我们在turns里面选择路由自带的animation动画效果，除此之外，我们也可以在transitionBuilder中
>
> 自定义我们所需要的动画效果，可以设置对应的动画曲线等。
>
> 而RotationTransition中还可以传入一个child参数，这是用来叠加动画的，如果我么不再需要叠加动画，
>
> 那么传入转换后的页面组件即可。
>
>
> **坑点：**
>
> 首先是在页面构造的时候，一开始我使用的是IconButton而不是MaterialButton，这样的结果就是当我
>
> 在第二页面点击该按钮返回的时候，发现无法返回。
>
> 而在自定义路由切换效果的builder中，传入的第一个animation是系统自带给你的animaition，
>
> 其转换参数在进入时是0.0到1.0，而在退出的时候是从1.0到0.0。
>
> 其次，在写自定义路由切换效果builder的时候，里面传入的第二个animation我并不知道是什么意思。
>
> 查看官方文档后，了解到第二个animation是当路由在 pushed on top of this route 的时候使用的，
>
> 但是当前我好像还没有遇到这样的使用场景，所以还需要今后在工作学习中多留意一下。

### KeepAlivePages & TabController 保持页面状态以及顶部菜单栏 (2020.3.21)

> 这个小应用主要做的是一个页面保活以及顶部菜单栏。
>
> 其实设计起来也比较简单，主要是要了解一个with的使用。
>
> 在使用TabController的时候，我们需要在类里面with一个SingleTickerProviderStateMixin，
>
> 并且在TabController的构造函数中，设置vsync为this
>
> 在实现页面保活的时候，我们需要在类里面with一个AutomaticKeepAliceClientMixin
>
> 并充血wantKeepAlive函数，使其返回true
>
> **坑点：**
>
> TabController里的vsync属性，为什么传入this，这个属性的作用是什么？还需要之后再来探究。
>
> 其次，在with之后我们应该重写哪些函数，编辑器里面都没有给出来，这是写的比较痛苦的一个点。

### SearchView 搜索栏 (2020.3.21)

> 搜索栏的重点是设置一个SearchBarDelegate，这个Delegate要实现4个代理函数
>
> - buildActions：搜索栏右侧按钮
> - buildLeading：搜索栏左侧按钮
> - buildResults：搜索结果显示
> - buildSuggestion：搜索建议
>
> 其中比较难的就是buildSuggestion这个函数了。
>
> 首先我们需要制作我们的建议数组，如果我们的query是空，那么就设置为默认推荐数组，
>
> 否则则使用List的where方法，筛选出开头为query的字符，并调用toList方法重新组成List。
>
> 接着需要返回一个ListView，通过在builder中设置其条目数量以及编写条目构造器，
>
> 就可以完成搜索建议栏的实现了。
>
> 最终我们在点击AppBar右侧搜索按钮时，使用showSearch函数，并设置其中的context以及delegate，
>
> 这样我们的搜索栏就完成了。
>
> **坑点：**
>
> TextSpan的children也应该是TextSpan
>
> List的筛选方法比较难使用
>
> showSearch需要传入context，若是直接在main函数中写脚手架，会出现没有context可传入的情况。

### Wrap Layout 流式布局 (2020.3.23)

> 这个小组件十分简单，Wrap里面有一个children属性，我们将要显示的数组传到这个属性里即可。
>
> 除此之外我还学到了一个MediaQuery，通过这个组件，我们可以获取显示的宽高，
>
> 由此来设计我们Container的大小。

### Expansion Tile 可展开瓦片 (2020.3.23)

> 这个组件也十分简单，就是使用到了我们的ExpansionTile，其中可以设置大标题，以及展开后的children等。
>
> 在flutter中，还提供了一个ExpansionTileList，但是我认为那个的效果其实比较差，而且实现起来比较复杂。
>
> 我们可以直接使用一个ListView将这些ExpansionTile装起来就可以了。

### Splash Screen 闪屏动画效果 (2020.3.23)

> 这个小应用其实比较简单，就是先做一个动画效果，并添加监听，等到动画效果完成后，就跳转到主页面。
>
> 在这个小应用，我再次复习了动画的制作方法。
>
> 首先，我们需要制作动画控制器animationController
>
> - animationController = AnimationController(vsync: this, duration: Duration)
>
> 接着，我们就可以建造我们真正的动画animation
>
> - animation =  Tween(begin,end).(animationController)
>
> 最后，我们要选择一个变化效果，例如FadeTransition
>
> - FadeTransition(
>
>   ​	opacity: animation,
>
>   ​	child: Widget
>
>   )
>
> 这样我们就完成了我们的动画效果。
>
> **坑点：**
>
> 我们需要看到，这次我们是做一个页面跳转，所以我们的动画效果应该是从1.0跳转到0.0

### Tool Tip 长按提示 (2020.3.23)

> 这次我们认识一个组件Tooltip，这是一个十分简单的组件。它的效果是长按之后可以提示一个小文字，
>
> 是一个轻量型的提示工具。使用方法就是设置其child属性以及message属性即可。

### Draggable Widget 拖动组件 (2020.3.24)

> 这次学习到了一个控件Draggable，与其对应的还有DraggbleTarget。
>
> - Draggable
>
>   这个空间需要我们设置其传递信息data，还有child子控件，以及feedback拖动操作，
>
>   还有onDraggableCanceled拖动取消操作。
>
> - DraggableTarget
>
>   需要设置其OnAccept接收Draggable回调，以及设置一个builder来建立自己的样式