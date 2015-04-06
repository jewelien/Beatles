//
//  ViewController.m
//  Beatles
//
//  Created by Julien Guanzon on 4/5/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "ViewController.h"
#import "BeatlesController.h"
#import "DetailViewController.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark tableView Datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [BeatlesController sharedInstance].beatles.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"nameCell"];
    
    NSString *name = [[[BeatlesController sharedInstance].beatles objectAtIndex:indexPath.row]valueForKey:nameKey];
    //objectForKey and valueForKey working the same.
    cell.textLabel.text = name;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UITableViewCell *cell = sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    DetailViewController *detailVC = segue.destinationViewController;
    [detailVC updateWithBeatle:[BeatlesController sharedInstance].beatles [indexPath.row]];

}


@end
