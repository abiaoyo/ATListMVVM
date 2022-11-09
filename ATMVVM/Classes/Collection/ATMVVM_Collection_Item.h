#import <Foundation/Foundation.h>

#ifndef ATMVVM_Collection_Item_h
#define ATMVVM_Collection_Item_h

@class ATMVVM_Collection_Item;
typedef void (^ATMVVM_Collection_Item_ReloadViewBlock)(void);
typedef void (^ATMVVM_Collection_Item_RefreshViewBlock)(void);
typedef void (^ATMVVM_Collection_Item_DidSelectItemBlock)(UICollectionView * collectionView, NSIndexPath * indexPath, ATMVVM_Collection_Item * itemVM);


@interface ATMVVM_Collection_Item : NSObject

//这几个属性不能自己赋值使用
@property (nonatomic, copy) ATMVVM_Collection_Item_ReloadViewBlock _Nullable reloadViewBlock;
@property (nonatomic, copy) ATMVVM_Collection_Item_RefreshViewBlock _Nullable refreshViewBlock;
@property (nonatomic, strong) NSIndexPath * _Nullable indexPath;

//以下属性可以自己赋值使用
@property (nonatomic, copy) ATMVVM_Collection_Item_DidSelectItemBlock _Nullable didSelectItemBlock;
@property (nonatomic, copy) NSString * _Nullable cellId;
@property (nonatomic, assign) CGSize itemSize;
@property (nonatomic, strong) id _Nullable data;

- (void)setupData; //初始化数据
- (void)createLayout;
@end

#endif
