//
//  DetailViewController.m
//  Beatles
//
//  Created by Julien Guanzon on 4/5/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "DetailViewController.h"
#import "BeatlesController.h"
@import MapKit;

@interface DetailViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *birthdayLabel;
@property (weak, nonatomic) IBOutlet UILabel *birthPlaceLabel;
@property (weak, nonatomic) IBOutlet UILabel *deathDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *deathPlaceLabel;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (nonatomic, strong) id beatle;
@property (nonatomic, strong) CLLocation *deathLocation;
@property (nonatomic, strong) CLLocation *birthLocation;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self updateWithBeatle:self.beatle];
    [self addPinsToMap];


}

- (void)updateWithBeatle:(id)beatle {
    self.title = [beatle valueForKey:nameKey];
    self.beatle = beatle;

    self.birthLocation = [beatle valueForKey:birthLocationKey];
    self.deathLocation = [beatle valueForKey:deathLocationKey];
    
    self.birthdayLabel.text = [beatle valueForKey:birthDateKey];
    self.birthPlaceLabel.text = [beatle valueForKey:birthPlaceKey];
    
    if ([beatle valueForKey:deathDateKey]) {
        
        self.deathDateLabel.text = [beatle valueForKey:deathDateKey];
        self.deathPlaceLabel.text = [beatle valueForKey:deathPlaceKey];
    } else {
        self.deathDateLabel.text = @"Present";
        self.deathPlaceLabel.text = @"";
    }
    
}


- (void)addPinsToMap {
    NSMutableArray *annotationsArray = [NSMutableArray new];
        MKPointAnnotation *birthPin = [[MKPointAnnotation alloc] init];
        birthPin.coordinate = CLLocationCoordinate2DMake(self.birthLocation.coordinate.latitude, self.birthLocation.coordinate.longitude);
        birthPin.title = [NSString stringWithFormat:@"Birthplace of %@", self.title];
        birthPin.subtitle = self.birthPlaceLabel.text;
        [annotationsArray addObject:birthPin];
    if ([self.beatle valueForKey:deathDateKey]) {
        MKPointAnnotation *deathPin = [[MKPointAnnotation alloc] init];
        deathPin.coordinate = CLLocationCoordinate2DMake(self.deathLocation.coordinate.latitude, self.deathLocation.coordinate.longitude);
        deathPin.title = [NSString stringWithFormat:@"Death place of %@", self.title];
        deathPin.subtitle = self.deathPlaceLabel.text;
        [annotationsArray addObject:deathPin];
    }
    NSLog(@"annotations %@", annotationsArray);
    [self.mapView addAnnotations:annotationsArray];
}


-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pin"];
//    annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"pin"];
    annotationView.canShowCallout = YES;
    annotationView.pinColor = MKPinAnnotationColorGreen;
    return annotationView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
