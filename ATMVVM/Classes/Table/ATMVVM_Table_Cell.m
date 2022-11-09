#import "ATMVVM_Table_Cell.h"

@implementation ATMVVM_Table_Cell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupData];
        [self setupSubviews];
        [self setupLayout];
    }
    return self;
}

- (void)setupData{}
- (void)setupSubviews{}
- (void)setupLayout{}
- (void)configWithRowVM:(ATMVVM_Table_Row *)rowVM indexPath:(NSIndexPath *)indexPath{
    self.indexPath = indexPath;
    [self configAndRefresh:rowVM];
}
- (void)configAndRefresh:(ATMVVM_Table_Row *)rowVM{
    self.rowVM.refreshViewBlock = nil;
    self.rowVM = rowVM;
    
    __weak typeof(self) weakSelf = self;
    self.rowVM.refreshViewBlock = ^{
        [weakSelf refreshSubviews:YES];
        [weakSelf layoutIfNeeded];
    };
    [self refreshSubviews:NO];
    [self layoutIfNeeded];
}
- (void)refreshSubviews:(BOOL)isFromVM{
    
}

@end
