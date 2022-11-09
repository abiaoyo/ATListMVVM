#import <UIKit/UIKit.h>
#import "ATMVVM_Collection_Section.h"

#ifndef ATMVVM_Collection_ReusableView_h
#define ATMVVM_Collection_ReusableView_h

@interface ATMVVM_Collection_ReusableView : UICollectionReusableView

@property (nonatomic, strong) ATMVVM_Collection_Section * _Nullable sectionVM;
@property (nonatomic, strong) NSIndexPath * _Nullable indexPath;

- (void)setupData;
- (void)setupSubviews;
- (void)setupLayout;
- (void)configWithSectionVM:(ATMVVM_Collection_Section *)sectionVM indexPath:(NSIndexPath *)indexPath;
- (void)refreshSubviews:(BOOL)isFromVM;

@end

#endif
