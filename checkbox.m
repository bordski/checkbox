//
//  checkbox.m
//  checkbox
//
//  Created by Retina01 on 5/22/15.
//
//

#import "checkbox.h"

@interface checkbox ()

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation checkbox

@synthesize dataSource = _dataSource;

- (NSMutableArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = @[@{@"description" : @"Male", @"value" : @NO}.mutableCopy,
                        @{@"description" : @"Female", @"value" : @NO}.mutableCopy].mutableCopy;
    }
    
    return _dataSource;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSDictionary *checkboxData = self.dataSource[indexPath.row];
    
    UILabel *descriptionLabel = (UILabel *)[cell viewWithTag:2];
    UIImageView *imageValue = (UIImageView *)[cell viewWithTag:1];
    
    descriptionLabel.text = checkboxData[@"description"];
    if ([checkboxData[@"value"] isEqualToNumber:@NO]) {
        imageValue.backgroundColor = [UIColor blueColor];
    } else {
        imageValue.backgroundColor = [UIColor greenColor];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableDictionary *checkboxData = (NSMutableDictionary *)self.dataSource[indexPath.row];
    if ([checkboxData[@"value"] isEqualToNumber:@NO]) {
        checkboxData[@"value"] = @YES;
    } else {
        checkboxData[@"value"] = @NO;
    }
    
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
}

@end
