//
//  PhotoDetailsViewController.h
//  IoTVodafoneTask
//
//  Created by Ahmed Hamdy on 16/10/2021.
//

#import <UIKit/UIKit.h>
//#import "IoTVodafoneTask-Swift.h"
@class PhotoElement;
@interface PhotoDetailsViewController : UIViewController
@property (nonatomic, strong) PhotoElement* photo;
@property (nonatomic, strong) UIColor* dominantColor;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *urlLabel;
@end
