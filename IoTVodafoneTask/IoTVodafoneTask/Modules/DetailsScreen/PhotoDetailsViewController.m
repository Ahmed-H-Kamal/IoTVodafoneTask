//
//  PhotoDetailsViewController.m
//  IoTVodafoneTask
//
//  Created by Ahmed Hamdy on 16/10/2021.
//

#import "PhotoDetailsViewController.h"
#import "SDWebImage.h"
#import "IoTVodafoneTask-Swift.h"

@interface PhotoDetailsViewController ()

@end

@implementation PhotoDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if(self.photo.author != nil){
        self.author.text = self.photo.author;
    }
    if(self.photo.downloadURL != nil){
        self.urlLabel.text = self.photo.downloadURL;
    }
    
    if(self.photo.downloadURL != nil){
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.photoImageView sd_setImageWithURL:[NSURL URLWithString:self.photo.downloadURL] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                
                UIColor* color = [ImageHelper getAverageColorWithImage:image];
                if (color != nil) {
                    self.view.backgroundColor = color;
                }
                
            }];
            
        });
    }
    // Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
   
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
