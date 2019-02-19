//
//  PoporFFmpegViewController.m
//  PoporFFmpeg
//
//  Created by popor on 02/01/2019.
//  Copyright (c) 2019 popor. All rights reserved.
//

#import "PoporFFmpegCompressViewController.h"

#import "PoporFFmpegCompress.h"

@interface PoporFFmpegCompressViewController ()

@property (nonatomic, strong) UILabel  * inputL;
@property (nonatomic, strong) UILabel  * outputL;
@property (nonatomic, strong) UIButton * startBT;

@property (nonatomic, strong) PoporFFmpegCompress * fCompress;

@end

@implementation PoporFFmpegCompressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"PoporFFmpeg";
    
    [self addViews];
}

- (void)addViews {
    
    float width   = self.view.frame.size.width-40;
    float height  = 40;
    
    self.inputL = ({
        UILabel * l = [UILabel new];
        l.frame              = CGRectMake(20, 20, width, height);
        l.backgroundColor    = [UIColor clearColor];
        l.font               = [UIFont systemFontOfSize:15];
        l.textColor          = [UIColor darkGrayColor];
        
        l.numberOfLines      = 1;
        
        l.layer.cornerRadius = 5;
        l.layer.borderColor  = [UIColor lightGrayColor].CGColor;
        l.layer.borderWidth  = 1;
        l.clipsToBounds      = YES;
        
        [self.view addSubview:l];
        l;
    });
    self.outputL = ({
        UILabel * l = [UILabel new];
        l.frame              = CGRectMake(20, CGRectGetMaxY(self.inputL.frame) + 20, width, height);
        l.backgroundColor    = [UIColor clearColor];
        l.font               = [UIFont systemFontOfSize:15];
        l.textColor          = [UIColor darkGrayColor];
        
        l.numberOfLines      = 1;
        
        l.layer.cornerRadius = 5;
        l.layer.borderColor  = [UIColor lightGrayColor].CGColor;
        l.layer.borderWidth  = 1;
        l.clipsToBounds      = YES;
        
        [self.view addSubview:l];
        l;
    });
    
    self.startBT = ({
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame =  CGRectMake(20, CGRectGetMaxY(self.outputL.frame) + 20, width, height);
        [button setTitle:@"start" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor brownColor]];
        
        button.layer.cornerRadius = 5;
        button.layer.borderColor = [UIColor lightGrayColor].CGColor;
        button.layer.borderWidth = 1;
        button.clipsToBounds = YES;
        
        [self.view addSubview:button];
        
        [button addTarget:self action:@selector(startCompressAction) forControlEvents:UIControlEventTouchUpInside];
        
        button;
    });
}


- (void)setCornerView:(UIView *)view {
    view.layer.cornerRadius = 5;
    view.clipsToBounds = YES;
    
}

- (void)startCompressAction {
    
    // local disk video url path
    NSString * videoUrlPath = [[NSBundle mainBundle] pathForResource:@"input1" ofType:@"MOV"];
    // @"file://var/xxxxxx"; // @"var/xxxxxx";
    videoUrlPath = [[NSBundle mainBundle] pathForResource:@"input1" ofType:@"MOV"];
    
    CGSize size = CGSizeMake(540, 960);//
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    NSString *tPath = [NSString stringWithFormat:@"%@/output.mp4", docDir]; // compress video save path
    
    if (![self isFileExist:videoUrlPath]) {
        NSLog(@"videoUrlPath error.");
        return;
    }
    
    if ([self isFileExist:tPath]) {
        [self deleteFile:tPath];
    }
    NSData * inputData = [NSData dataWithContentsOfFile:videoUrlPath];
    self.inputL.text = [NSString stringWithFormat:@" input mov size is %@", [self humanSize:inputData.length]];
    
    __weak typeof(self) weakSelf = self;
    
    if (!self.fCompress) {
        self.fCompress = [PoporFFmpegCompress new];
    }
    [self.fCompress compressVideoUrl:videoUrlPath size:size tPath:tPath finish:^(BOOL finished, NSString *info) {
        if (finished) {
            NSLog(@"PoporFFmpeg finish");
            NSData * outputData = [NSData dataWithContentsOfFile:tPath];
            weakSelf.outputL.text = [NSString stringWithFormat:@" output mp4 size is %@", [weakSelf humanSize:outputData.length]];
        }else{
            NSLog(@"PoporFFmpeg error: %@", info);
            weakSelf.inputL.text = @" error";
        }
    }];
    
}

- (BOOL)isFileExist:(NSString *)filePath {
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        // 如果存在的话，直接返回就好了。
        return YES;
    }else {
        return NO;
    }
    // end.
}

- (void)deleteFile:(NSString *)filePath {
    if (!filePath) {
        return;
    }else{
        filePath = [filePath stringByRemovingPercentEncoding];
    }
    if([self isFileExist:filePath]){
        NSError *error;
        if ([[NSFileManager defaultManager] removeItemAtPath:filePath error:&error] != YES){
            NSLog(@"Unable to delete file: %@", [error localizedDescription]);
        }
        // end.
    }
}

- (NSString *)humanSize:(float)fileSizeFloat {
    if (fileSizeFloat<1048576.0f) {
        return [NSString stringWithFormat:@"%.02fKB", fileSizeFloat/1024.0f];
    }else if(fileSizeFloat<1073741824.0f) {
        return [NSString stringWithFormat:@"%.02fMB", fileSizeFloat/1048576.0f];
    }else {
        return [NSString stringWithFormat:@"%.02fGB", fileSizeFloat/1073741824.0f];
    }
}


@end
