#import "ATMVVM_Table_Section.h"

@implementation ATMVVM_Table_Section

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setupData];
    }
    return self;
}

- (void)setupData{
    
}

- (void)createLayout{
    
}

- (NSMutableArray<ATMVVM_Table_Row *> *)rowVMs{
    if(!_rowVMs){
        _rowVMs = [NSMutableArray new];
    }
    return _rowVMs;
}

@end
