#import "ATMVVM_Collection_Section.h"

@implementation ATMVVM_Collection_Section

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

- (NSMutableArray<ATMVVM_Collection_Item *> *)itemVMs{
    if(!_itemVMs){
        _itemVMs = [NSMutableArray new];
    }
    return _itemVMs;
}

@end
