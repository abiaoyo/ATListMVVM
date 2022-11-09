#import "UICollectionView+ATMVVM.h"

@implementation UICollectionView(ATMVVM)

- (void)setupWithViewProxy:(ATMVVM_Collection_Proxy *)viewProxy {
    self.delegate = viewProxy;
    self.dataSource = viewProxy;
}

@end
