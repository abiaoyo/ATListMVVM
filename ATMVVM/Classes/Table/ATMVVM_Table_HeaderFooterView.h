#import <UIKit/UIKit.h>
#import "ATMVVM_Table_Section.h"
NS_ASSUME_NONNULL_BEGIN

@interface ATMVVM_Table_HeaderFooterView : UITableViewHeaderFooterView

@property (nonatomic, strong) ATMVVM_Table_Section * _Nullable sectionVM;
@property (nonatomic, assign) NSInteger section;

- (void)setupData;
- (void)setupSubviews;
- (void)setupLayout;
- (void)configWithSectionVM:(ATMVVM_Table_Section *)sectionVM section:(NSInteger)section;
- (void)refreshSubviews:(BOOL)isFromVM;

@end

NS_ASSUME_NONNULL_END
