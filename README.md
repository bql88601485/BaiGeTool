# BaiGeTool


# nsnull+
 服务器返回nsnull 安全处理


# UIControl+BaiGe

iOS小技巧–用runtime 解决UIButton 重复点击问题

什么是这个问题

我们的按钮是点击一次响应一次, 即使频繁的点击也不会出问题, 可是某些场景下还偏偏就是会出问题.


UIButton *tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
[tempBtn addTarget:self action:@selector(clickWithInterval:) forControlEvents:UIControlEventTouchUpInside];
 tempBtn.BaiGe_acceptEventInterval = 0.5;
