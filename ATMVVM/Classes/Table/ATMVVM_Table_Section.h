#import <UIKit/UIKit.h>

#import "ATMVVM_Table_Row.h"

NS_ASSUME_NONNULL_BEGIN

@class ATMVVM_Table_Section;
typedef void (^ATMVVM_Table_Section_ReloadViewBlock)(void);
typedef void (^ATMVVM_Table_Section_RefreshViewBlock)(void);

@interface ATMVVM_Table_Section : NSObject

//这几个属性不能自己赋值使用
@property (nonatomic, copy) ATMVVM_Table_Section_ReloadViewBlock _Nullable reloadViewBlock;
@property (nonatomic, copy) ATMVVM_Table_Section_RefreshViewBlock _Nullable refreshViewBlock;
@property (nonatomic, strong) NSIndexPath * _Nullable indexPath;

//以下属性可以自己赋值使用
@property (nonatomic, copy) NSString * _Nullable headerId;
@property (nonatomic, copy) NSString * _Nullable footerId;

@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, assign) CGFloat footerHeight;

@property (nonatomic, strong) NSMutableArray<ATMVVM_Table_Row *> * rowVMs;

- (void)setupData;

- (void)createLayout;

@end

NS_ASSUME_NONNULL_END
