### NavigationTransition 路由切换页面动画效果 (2020.3.21)

> 这个动画效果最重点的就是要会写PageRouteBuilder，
>
> 这个组件的构造函数中包含：
>
> - transitionDuration： 转换时间
> - pageBuilder：转换后的页面
> - transitionBuilder：转换构造
>
> 最难的就是转换构造的编写，转换构造中我们要选择一个转换方法，比如RotationTransition
>
> 接着我们要设置其中的turns属性，表示该动画应该怎么完成。这里使用到的是Tween组件，他的构造
>
> 函数中就包含了begin和end两个属性来指定动画的起止状态。接着，调用其中的animate方法，
>
> 并设置其动画曲线。
>
> 在RotationTransition中还有另一个属性是child，这个用作叠加动画效果的，如果我们不叠加动画的时候，
>
> 就在这个地方填入child就可以了。
>
> **坑点：**
>
> 首先是在页面构造的时候，一开始我使用的是IconButton而不是MaterialButton，这样的结果就是当我
>
> 在第二页面点击该按钮返回的时候，发现无法返回。
>
> 其次，在写自定义路由切换效果的时候，里面传入的animation1，animation2我并不知道是什么作用。
>
> 在我看来应该是用来叠加动画的时候使用吧。具体还需要今后的学习来解决。