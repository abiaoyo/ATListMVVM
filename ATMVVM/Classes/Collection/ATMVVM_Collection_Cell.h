#import <UIKit/UIKit.h>
#import "ATMVVM_Collection_Item.h"

#ifndef ATMVVM_Collection_Cell_h
#define ATMVVM_Collection_Cell_h

@interface ATMVVM_Collection_Cell : UICollectionViewCell

@property (nonatomic, strong) ATMVVM_Collection_Item * _Nullable itemVM;
@property (nonatomic, strong) NSIndexPath * _Nullable indexPath;

- (void)setupData;
- (void)setupSubviews;
- (void)setupLayout;
- (void)configWithItemVM:(ATMVVM_Collection_Item *)itemVM indexPath:(NSIndexPath *)indexPath;
- (void)refreshSubviews:(BOOL)isFromVM;

@end

#endif
