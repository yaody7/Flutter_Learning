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
