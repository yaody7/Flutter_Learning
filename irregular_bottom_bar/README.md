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

