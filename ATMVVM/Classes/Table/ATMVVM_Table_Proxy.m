#import "ATMVVM_Table_Proxy.h"
#import "ATMVVM_Table_Cell.h"
#import "ATMVVM_Table_HeaderFooterView.h"

@interface ATMVVM_Table_Proxy()
@property (nonatomic, strong) ATMVVM_Table_Section * defaultSectionVM;
@property (nonatomic, strong) NSMutableArray<ATMVVM_Table_Section *> * sectionVMs;
@end

@implementation ATMVVM_Table_Proxy

- (ATMVVM_Table_Section *)defaultSectionVM {
    if(!_defaultSectionVM){
        _defaultSectionVM = [[ATMVVM_Table_Section alloc] init];
    }
    return _defaultSectionVM;
}

- (NSMutableArray<ATMVVM_Table_Section *> *)sectionVMs {
    if(!_sectionVMs){
        _sectionVMs = [NSMutableArray new];
    }
    return _sectionVMs;
}

- (ATMVVM_Table_Section *)getSectionVM:(NSInteger)section {
    if(_defaultSectionVM == nil) {
        return self.sectionVMs[section];
    }
    return self.defaultSectionVM;
}

- (ATMVVM_Table_Row *)getRowVM:(NSInteger)section item:(NSInteger)item {
    return [self getSectionVM:section].rowVMs[item];
}

- (ATMVVM_Table_Row *)getRowVM:(NSIndexPath *)indexPath {
    return [self getSectionVM:indexPath.section].rowVMs[indexPath.item];
}

//MARK: - UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if(_defaultSectionVM == nil){
        return self.sectionVMs.count;
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self getSectionVM:section].rowVMs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ATMVVM_Table_Row * rowVM = [self getRowVM:indexPath];
    ATMVVM_Table_Cell * cell = [tableView dequeueReusableCellWithIdentifier:rowVM.cellId forIndexPath:indexPath];
    [cell configWithRowVM:rowVM indexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ATMVVM_Table_Section * sectionVM = [self getSectionVM:indexPath.section];
    sectionVM.indexPath = indexPath;
    sectionVM.reloadViewBlock = ^{
        [tableView reloadData];
    };
    
    ATMVVM_Table_Row * rowVM = [self getRowVM:indexPath];
    rowVM.indexPath = indexPath;
    rowVM.reloadViewBlock = ^{
        [tableView reloadData];
    };
    return rowVM.rowHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    ATMVVM_Table_Section * sectionVM = [self getSectionVM:section];
    return sectionVM.headerHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    ATMVVM_Table_Section * sectionVM = [self getSectionVM:section];
    return sectionVM.footerHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    ATMVVM_Table_Section * sectionVM = [self getSectionVM:section];
    if(sectionVM.headerId){
        ATMVVM_Table_HeaderFooterView * header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:sectionVM.headerId];
        [header configWithSectionVM:sectionVM section:section];
        return header;
    }
    
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    ATMVVM_Table_Section * sectionVM = [self getSectionVM:section];
    if(sectionVM.footerId){
        ATMVVM_Table_HeaderFooterView * footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:sectionVM.headerId];
        [footer configWithSectionVM:sectionVM section:section];
        return footer;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ATMVVM_Table_Row * rowVM = [self getRowVM:indexPath];
    if(rowVM.didSelectItemBlock){
        rowVM.didSelectItemBlock(tableView, indexPath, rowVM);
    }
}

//MARK: -
- (void)forwardInvocation:(NSInvocation *)anInvocation{
    if (self.forwarder && [self.forwarder respondsToSelector:[anInvocation selector]])
        [anInvocation invokeWithTarget:self.forwarder];
    else
        [super forwardInvocation:anInvocation];
}

- (BOOL)respondsToSelector:(SEL)aSelector{
    return [super respondsToSelector:aSelector] || (self.forwarder && [self.forwarder respondsToSelector:aSelector]);
}


@end
