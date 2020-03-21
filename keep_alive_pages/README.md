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
