#import <UIKit/UIKit.h>

#import "ATMVVM_Collection_Section.h"

#ifndef ATMVVM_Collection_Proxy_h
#define ATMVVM_Collection_Proxy_h

@interface ATMVVM_Collection_Proxy : NSObject<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong, readonly) ATMVVM_Collection_Section * defaultSectionVM;
@property (nonatomic, strong, readonly) NSMutableArray<ATMVVM_Collection_Section *> * sectionVMs;

@property (nonatomic, weak) id forwarder;

@end

#endif
