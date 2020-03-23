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
>   ​    opacity: animation,
>
>   ​    child: Widget
>
>   )
>
> 这样我们就完成了我们的动画效果。
>
> **坑点：**
>
> 我们需要看到，这次我们是做一个页面跳转，所以我们的动画效果应该是从1.0跳转到0.0

