# YXWListBinder

### 使用

只需要进行如下步骤:

- 克隆这个项目到本地.
- 移动YXWListBinder.h 和 YXWListBinder.m 文件到你的项目.
- 执行pod install.

提示 :)

- 该项目依赖于ReactCocoa，请在Podfile中添加 pod 'ReactiveObjC'.

- 项目中包含Demo.

- 根据自己的需求制定自己的ViewModelProtocol 和 CellProtocol

- Protocol中要有MVVM的绑定机制的方法，如：

  ```obje
  /*
   Cell
   */
  - (void)bindViewModel:(id)viewModel;
  /*
   ViewModel
   */
  - (NSString *)cellIdentifier;
  ```

- 注意区分以下两个初始化方法：

  ```objective-c
  /*
   根据nib注册Cell
   */
  - (instancetype)initBinder:(UITableView *)tableView
                 dataCommand:(RACCommand *)dataCommand
                  hasSection:(BOOL)hasSection
                    nibsCell:(NSArray *)nibs
                 identifiers:(NSArray *)identifiers;
  ```

  ```objective-c
  /*
   根据name注册Cell
   */
  - (instancetype)initBinder:(UITableView *)tableView
                 dataCommand:(RACCommand *)dataCommand
                  hasSection:(BOOL)hasSection
              cellClassNames:(NSArray *)names
                 identifiers:(NSArray *)identifiers;
  ```

  ​