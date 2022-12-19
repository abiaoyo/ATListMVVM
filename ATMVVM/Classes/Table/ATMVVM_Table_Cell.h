#import <UIKit/UIKit.h>
#import "ATMVVM_Table_RowVM.h"

NS_ASSUME_NONNULL_BEGIN

@interface ATMVVM_Table_Cell : UITableViewCell

@property (nonatomic, strong) ATMVVM_Table_RowVM * _Nullable rowVM;
@property (nonatomic, strong) NSIndexPath * _Nullable indexPath;

- (void)setupData;
- (void)setupSubviews;
- (void)setupLayout;
- (void)configWithRowVM:(ATMVVM_Table_RowVM *)rowVM indexPath:(NSIndexPath *)indexPath;
- (void)refreshSubviews:(BOOL)isFromVM;

@end

NS_ASSUME_NONNULL_END
