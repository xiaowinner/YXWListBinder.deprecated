# YXWListBinder

### 使用

只需要进行如下步骤:

- 克隆这个项目到本地.
- 移动YXWListBinder.h 和 YXWListBinder.m 文件到你的项目.
- 该项目依赖于ReactCocoa，请在Podfile中添加 pod 'ReactiveObjC'.
- 项目中包含Demo.

提示 :)

/*
 根据nib注册Cell
 */
`
- (instancetype)initBinder:(UITableView *)tableView

​               dataCommand:(RACCommand *)dataCommand

​                     hasSection:(BOOL)hasSection

​                          nibsCell:(NSArray *)nibs

​                       identifiers:(NSArray *)identifiers;

`

/*
 根据name注册Cell
 */
`
- (instancetype)initBinder:(UITableView *)tableView

​               dataCommand:(RACCommand *)dataCommand

​                    hasSection:(BOOL)hasSection

​            cellClassNames:(NSArray *)names

​                      identifiers:(NSArray *)identifiers;

`