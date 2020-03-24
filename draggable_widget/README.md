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