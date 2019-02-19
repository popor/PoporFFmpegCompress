<a href='https://github.com/popor/mybox'> MyBox </a>

# PoporFFmpeg

[![CI Status](https://img.shields.io/travis/popor/PoporFFmpeg.svg?style=flat)](https://travis-ci.org/popor/PoporFFmpeg)
[![Version](https://img.shields.io/cocoapods/v/PoporFFmpeg.svg?style=flat)](https://cocoapods.org/pods/PoporFFmpeg)
[![License](https://img.shields.io/cocoapods/l/PoporFFmpeg.svg?style=flat)](https://cocoapods.org/pods/PoporFFmpeg)
[![Platform](https://img.shields.io/cocoapods/p/PoporFFmpeg.svg?style=flat)](https://cocoapods.org/pods/PoporFFmpeg)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

PoporFFmpeg is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'PoporFFmpeg'
```

<p>
<img src='https://github.com/popor/PoporFFmpegCompress/blob/master/Example/screen1.png' width="30%" height="30%">

</p>

##### 因为cocoapod对c++的依赖不完善，所以将FFmpeg做了静态包处理，静态包仓库位于 <a href='https://github.com/popor/PoporFFmpeg'>PoporFFmpeg </a>  , 原始文件位于 <a href='https://github.com/popor/PoporFFmpegLib'>PoporFFmpegLib </a> , 原始的FFmpeg pod仓库位于 <a href='https://github.com/popor/FFMpegCompress'>FFMpegCompress</a>

#### 放弃对mac的支持,文件太大了,请选择使用FFmpeg官网的dmg文件,应该比这个小很多,而且还可以使用最新版本.

#### 放弃对iPhone32CPU,iPhone5的支持,文件太大了,github不支持超过100MB文件.

```
使用方法
#import <PoporFFmpeg/PoporFFmpegCompress.h>

@property (nonatomic, strong) PoporFFmpegCompress * ffmpegCmd;

NSString *videoPath;
NSString *resultPath;

if (!self.ffmpegCmd) {
    self.ffmpegCmd = [PoporFFmpegCompress new];
}
[self.ffmpegCmd compressVideoUrl:videoPath size:CGSizeMake(540, 960) tPath:resultPath finish:^(BOOL finished, NSString *info) {
    
    if (finished) {
        if (IsDebugVersion) {
            NSData * data = [NSData dataWithContentsOfFile:resultPath];
            NSLog(@"FFMpeg video size : %02fMB", data.length/1024.0f/1024.0f);
        }
    }else{
        
    }
}];
```





## Author

popor, 908891024@qq.com

## License

PoporFFmpeg is available under the MIT license. See the LICENSE file for more info.
