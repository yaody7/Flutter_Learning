
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

