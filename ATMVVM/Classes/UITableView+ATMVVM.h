#import <UIKit/UIKit.h>
#import "ATMVVM_Table_Proxy.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (ATMVVM)

- (void)setupWithViewProxy:(ATMVVM_Table_Proxy *)viewProxy;

@end

NS_ASSUME_NONNULL_END
