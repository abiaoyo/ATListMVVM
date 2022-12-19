#import "ATMVVM_Collection_ItemVM.h"
#import "ATMVVM_Collection_Cell.h"

@interface ATMVVM_Collection_ItemVM()

@property (nonatomic, copy) ATMVVM_Collection_ItemVM_ReloadViewBlock _Nonnull reloadViewBlock;
@property (nonatomic, copy) ATMVVM_Collection_ItemVM_RefreshViewBlock _Nonnull refreshViewBlock;

@end

@implementation ATMVVM_Collection_ItemVM

- (instancetype)init{
    self = [super init];
    if (self) {
        [self _setupBlocks];
        [self setupData];
    }
    return self;
}

- (void)_setupBlocks{
    __weak typeof(self) weakSelf = self;
    self.reloadViewBlock = ^{
        [weakSelf.collectionView reloadData];
    };
    self.refreshViewBlock = ^{
        UICollectionView * collectionView = weakSelf.collectionView;
        NSIndexPath * indexPath = weakSelf.indexPath;
        
        if(collectionView && indexPath) {
            ATMVVM_Collection_Cell * cell = (ATMVVM_Collection_Cell *)[collectionView cellForItemAtIndexPath:indexPath];
            if(cell){
                [cell refreshSubviews:YES];
                [cell layoutIfNeeded];
            }
        }
    };
}

- (void)setupData{
    
}

- (void)createLayout{
    
}

@end
