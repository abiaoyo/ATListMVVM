#import "ATMVVM_Collection_Proxy.h"
#import "ATMVVM_Collection_Cell.h"
#import "ATMVVM_Collection_ReusableView.h"

@interface ATMVVM_Collection_Proxy()

@property (nonatomic, strong) ATMVVM_Collection_Section * defaultSectionVM;
@property (nonatomic, strong) NSMutableArray<ATMVVM_Collection_Section *> * sectionVMs;

@end

@implementation ATMVVM_Collection_Proxy

- (ATMVVM_Collection_Section *)defaultSectionVM {
    if(!_defaultSectionVM){
        _defaultSectionVM = [[ATMVVM_Collection_Section alloc] init];
    }
    return _defaultSectionVM;
}

- (NSMutableArray<ATMVVM_Collection_Section *> *)sectionVMs {
    if(!_sectionVMs){
        _sectionVMs = [NSMutableArray new];
    }
    return _sectionVMs;
}

- (ATMVVM_Collection_Section *)getSectionVM:(NSInteger)section {
    if(_defaultSectionVM == nil) {
        return self.sectionVMs[section];
    }
    return self.defaultSectionVM;
}

- (ATMVVM_Collection_Item *)getItemVM:(NSInteger)section item:(NSInteger)item {
    return [self getSectionVM:section].itemVMs[item];
}

- (ATMVVM_Collection_Item *)getItemVM:(NSIndexPath *)indexPath {
    return [self getSectionVM:indexPath.section].itemVMs[indexPath.item];
}

//UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    if(_defaultSectionVM == nil){
        return self.sectionVMs.count;
    }
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self getSectionVM:section].itemVMs.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ATMVVM_Collection_Item * itemVM = [self getItemVM:indexPath];
    ATMVVM_Collection_Cell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:itemVM.cellId forIndexPath:indexPath];
    [cell configWithItemVM:itemVM indexPath:indexPath];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    ATMVVM_Collection_Section * sectionVM = [self getSectionVM:indexPath.section];
    if([kind isEqualToString:UICollectionElementKindSectionHeader]){
        if(sectionVM.headerId){
            ATMVVM_Collection_ReusableView * header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:sectionVM.headerId forIndexPath:indexPath];
            [header configWithSectionVM:sectionVM indexPath:indexPath];
            return header;
        }
    }
    if([kind isEqualToString:UICollectionElementKindSectionFooter]){
        if(sectionVM.headerId){
            ATMVVM_Collection_ReusableView * footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:sectionVM.footerId forIndexPath:indexPath];
            [footer configWithSectionVM:sectionVM indexPath:indexPath];
            return footer;
        }
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    ATMVVM_Collection_Section * sectionVM = [self getSectionVM:indexPath.section];
    sectionVM.indexPath = indexPath;
    sectionVM.reloadViewBlock = ^{
        [collectionView reloadData];
    };
    
    ATMVVM_Collection_Item * itemVM = [self getItemVM:indexPath];
    itemVM.indexPath = indexPath;
    itemVM.reloadViewBlock = ^{
        [collectionView reloadData];
    };
    return itemVM.itemSize;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return [self getSectionVM:section].headerSize;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return [self getSectionVM:section].footerSize;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return [self getSectionVM:section].sectionInset;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return [self getSectionVM:section].minimumLineSpacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return [self getSectionVM:section].minimumInteritemSpacing;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ATMVVM_Collection_Item * itemVM = [self getItemVM:indexPath];
    if(itemVM.didSelectItemBlock){
        itemVM.didSelectItemBlock(collectionView, indexPath, itemVM);
    }
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    if (self.forwarder && [self.forwarder respondsToSelector:[anInvocation selector]])
        [anInvocation invokeWithTarget:self.forwarder];
    else
        [super forwardInvocation:anInvocation];
}

//- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector{
//    NSMethodSignature *signature = [super methodSignatureForSelector:selector];
//    if (!signature && self.forwarder) {
//        signature = [self.forwarder methodSignatureForSelector:selector];
//    }
//    return signature;
//}

- (BOOL)respondsToSelector:(SEL)aSelector{
    return [super respondsToSelector:aSelector] || (self.forwarder && [self.forwarder respondsToSelector:aSelector]);
}


@end
