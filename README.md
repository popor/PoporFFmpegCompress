# PoporFFmpegCompress

[![CI Status](https://img.shields.io/travis/popor/PoporFFmpegCompress.svg?style=flat)](https://travis-ci.org/popor/PoporFFmpegCompress)
[![Version](https://img.shields.io/cocoapods/v/PoporFFmpegCompress.svg?style=flat)](https://cocoapods.org/pods/PoporFFmpegCompress)
[![License](https://img.shields.io/cocoapods/l/PoporFFmpegCompress.svg?style=flat)](https://cocoapods.org/pods/PoporFFmpegCompress)
[![Platform](https://img.shields.io/cocoapods/p/PoporFFmpegCompress.svg?style=flat)](https://cocoapods.org/pods/PoporFFmpegCompress)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

PoporFFmpegCompress is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'PoporFFmpegCompress'
```
<p>
<img src='https://github.com/popor/PoporFFmpegCompress/blob/master/Example/PoporFFmpegCompress/screen1.png' width="30%" height="30%">

</p>

##### 因为cocoapod对c++的依赖不完善，所以将FFmpeg做了静态包处理，静态包仓库位于 <a href='https://github.com/popor/PoporFFmpeg'>PoporFFmpeg </a>  , 原始文件位于 <a href='https://github.com/popor/PoporFFmpegLib'>PoporFFmpegLib </a> , 原始的FFmpeg pod仓库位于 <a href='https://github.com/popor/FFMpegCompress'>FFMpegCompress</a>

#### 放弃对mac的支持,文件太大了,请选择使用FFmpeg官网的dmg文件,应该比这个小很多,而且还可以使用最新版本.

#### 放弃对iPhone32CPU,iPhone5的支持,文件太大了,github不支持超过100MB文件.

```
使用方法
#import <PoporFFmpegCompress/PoporFFmpegCompress.h>

@property (nonatomic, strong) PoporFFmpegCompress * ffmpegCmd;

NSString *videoPath;
NSString *resultPath;

if (!self.fCompress) {
    self.fCompress = [PoporFFmpegCompress new];
}
[self.fCompress compressVideoUrl:videoUrlPath size:size tPath:tPath finish:^(BOOL      finished, NSString *info) {
    if (finished) {
        NSLog(@"PoporFFmpeg finish");
    }else{
        NSLog(@"PoporFFmpeg error: %@", info);
    }
}];
```

## Author

popor, 908891024@qq.com

## License

PoporFFmpegCompress is available under the MIT license. See the LICENSE file for more info.
