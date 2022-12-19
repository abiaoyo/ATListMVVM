#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ATMVVM_Table_RowVM;
typedef void (^ATMVVM_Table_RowVM_ReloadViewBlock)(void);
typedef void (^ATMVVM_Table_RowVM_RefreshViewBlock)(void);
typedef void (^ATMVVM_Table_RowVM_DidSelectItemBlock)(UITableView * tableView, NSIndexPath * indexPath, ATMVVM_Table_RowVM * itemVM);

@interface ATMVVM_Table_RowVM : NSObject

//这几个属性不能自己赋值使用
@property (nonatomic, copy, readonly) ATMVVM_Table_RowVM_ReloadViewBlock _Nonnull reloadViewBlock;
@property (nonatomic, copy, readonly) ATMVVM_Table_RowVM_RefreshViewBlock _Nonnull refreshViewBlock;

@property (nonatomic, weak) UITableView * tableView;
@property (nonatomic, strong) NSIndexPath * _Nullable indexPath;

//以下属性可以自己赋值使用
@property (nonatomic, copy) ATMVVM_Table_RowVM_DidSelectItemBlock _Nullable didSelectItemBlock;
@property (nonatomic, copy) NSString * _Nullable cellId;
@property (nonatomic, assign) CGFloat rowHeight;
@property (nonatomic, strong) id _Nullable data;

- (void)setupData; //初始化数据
- (void)createLayout;

@end

NS_ASSUME_NONNULL_END
