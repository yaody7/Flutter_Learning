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