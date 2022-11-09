#import <UIKit/UIKit.h>
#import "ATMVVM_Table_Section.h"

NS_ASSUME_NONNULL_BEGIN

@interface ATMVVM_Table_Proxy : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong, readonly) ATMVVM_Table_Section * defaultSectionVM;
@property (nonatomic, strong, readonly) NSMutableArray<ATMVVM_Table_Section *> * sectionVMs;

@property (nonatomic, weak) id forwarder;

@end

NS_ASSUME_NONNULL_END
