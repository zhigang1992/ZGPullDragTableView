ZGPullDragTableView
===================

Awesome TableView Category for Drag and Pull.

![img](https://raw.github.com/zhigang1992/ZGPullDragTableView/master/ScreenShots/Screen%20Shot%202013-02-26%20at%203.23.23%20PM.png)
![img](https://raw.github.com/zhigang1992/ZGPullDragTableView/master/ScreenShots/Screen%20Shot%202013-02-26%20at%203.23.44%20PM.png)


The cool thing about [ZGPullDragTableView][] is that, the header and the footer view is a complete functional `UIView`,
over which you have complete control.

Is also super easy to use, the API is very thright forward.    


After import `UITableView+ZGPullDrag.h` to you source file, `UITableView` will have two more method.

```
- (void)addZGPullView:(UIView *)pullView;
- (void)addZGDragView:(UIView *)dragView;
```

and also two more `Delegate`:

```
@property (nonatomic) id <ZGPullViewDelegate> ZGPullViewDelegate;
@property (nonatomic) id <ZGDragViewDelegate> ZGDragViewDelegate;
```

all of its delegate method are optional.

[![ScreenShot](https://raw.github.com/zhigang1992/ZGPullDragTableView/master/ScreenShots/Screen%20Shot%202013-02-26%20at%203.30.47%20PM.png)](http://youtu.be/1LU7k563Cmo)


[ZGPullDragTableView]: https://github.com/zhigang1992/ZGPullDragTableView


####Licsen-MIT
####Contact:
  * [@F_ZG](http://twitter.com/F_ZG)
  * [zhigang1992@gmail.com]
