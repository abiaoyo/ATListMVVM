#import <UIKit/UIKit.h>

#import "ATMVVM_Collection_Item.h"

#ifndef ATMVVM_Collection_Section_h
#define ATMVVM_Collection_Section_h

@class ATMVVM_Collection_Section;
typedef void (^ATMVVM_Collection_Section_ReloadViewBlock)(void);
typedef void (^ATMVVM_Collection_Section_RefreshViewBlock)(void);

@interface ATMVVM_Collection_Section : NSObject

//这几个属性不能自己赋值使用
@property (nonatomic, copy) ATMVVM_Collection_Section_ReloadViewBlock reloadViewBlock;
@property (nonatomic, copy) ATMVVM_Collection_Section_RefreshViewBlock refreshViewBlock;
@property (nonatomic, strong) NSIndexPath * _Nullable indexPath;

//以下属性可以自己赋值使用
@property (nonatomic, copy) NSString * _Nullable headerId;
@property (nonatomic, copy) NSString * _Nullable footerId;

@property (nonatomic, assign) CGSize headerSize;
@property (nonatomic, assign) CGSize footerSize;

@property (nonatomic, strong) NSMutableArray<ATMVVM_Collection_Item *> * itemVMs;

@property (nonatomic, assign) UIEdgeInsets sectionInset;
@property (nonatomic, assign) CGFloat minimumLineSpacing;
@property (nonatomic, assign) CGFloat minimumInteritemSpacing;

- (void)setupData;

- (void)createLayout;
@end

#endif
