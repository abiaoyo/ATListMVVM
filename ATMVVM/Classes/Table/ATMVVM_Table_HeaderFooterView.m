#import "ATMVVM_Table_HeaderFooterView.h"

@implementation ATMVVM_Table_HeaderFooterView

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
- (void)configWithSectionVM:(ATMVVM_Table_Section *)sectionVM section:(NSInteger)section{
    self.section = section;
    [self configAndRefresh:sectionVM];
}
- (void)configAndRefresh:(ATMVVM_Table_Section *)sectionVM{
    self.sectionVM.refreshViewBlock = nil;
    self.sectionVM = sectionVM;
    
    __weak typeof(self) weakSelf = self;
    self.sectionVM.refreshViewBlock = ^{
        [weakSelf refreshSubviews:YES];
        [weakSelf layoutIfNeeded];
    };
    [self refreshSubviews:NO];
    [self layoutIfNeeded];
}
- (void)refreshSubviews:(BOOL)isFromVM{}

@end
