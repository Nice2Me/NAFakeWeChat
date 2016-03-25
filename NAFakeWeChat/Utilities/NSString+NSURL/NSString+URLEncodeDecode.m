//
//  NSString+URLEncodeDecode.m
//
//  Created by zuopengl on 3/24/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "NSString+URLEncodeDecode.h"


const char kUnreservedChar[] = {
  //0  1  2  3  4  5  6  7  8  9  A  B  C  D  E  F
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 0
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 1
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, // 2
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, // 3
    0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, // 4
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, // 5
    0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, // 6
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, // 7
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 8
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 9
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // A
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // B
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // C
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // D
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // E
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  // F
};

const char kHexToNum[] = {
  // 0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, // 0
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, // 1
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, // 2
     0,  1,  2,  3,  4,  5,  6,  7,  8,  9, -1, -1, -1, -1, -1, -1, // 3
    -1, 10, 11, 12, 13, 14, 15, -1, -1, -1, -1, -1, -1, -1, -1, -1, // 4
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, // 5
    -1, 10, 11, 12, 13, 14, 15, -1, -1, -1, -1, -1, -1, -1, -1, -1, // 6
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, // 7
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, // 8
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, // 9
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, // A
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, // B
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, // C
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, // D
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, // E
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1  // F
};

inline NSString *na_urlEncodeForString(NSString *string) {
    if ([string length] <= 0) {
        
    }
    
    CFStringRef encodedString = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge CFStringRef)string , NULL, CFSTR(":/?#[]@!$&'()*+,;="), kCFStringEncodingUTF8);
    return (__bridge NSString *)(encodedString);
}

inline NSString *na_urlDecodeForString(NSString *string) {
    if ([string length] <= 0) {
        return @"";
    }
    
    CFStringRef decodedString = CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault, (__bridge CFStringRef)string, CFSTR(""), kCFStringEncodingUTF8);
    return (__bridge NSString *)(decodedString);
}

BOOL na_validateNotURLEncodeForString(NSString *string) {
    if ([string length] <= 0) {
        return NO; // is valid url encoded string
    }
    
    const char *cString = [string cStringUsingEncoding:NSUTF8StringEncoding];
    long i = 0, len = strlen(cString);
    while (i < len) {
        if (cString[i] == '%') {
            if (++i == len) {
                return YES;
            }

            if (kHexToNum[cString[i]] < 0) {
                return YES;
            }
            
            if (++i == len) {
                return YES;
            }

            if (kHexToNum[cString[i]] < 0) {
                return YES;
            }
            
            ++i;
        } else {
            // judge if in the set of unreserved keyword
            if (!kUnreservedChar[cString[i]]) {
                return YES; // not in unreserved
            }
            i++;
        }
    }
    return NO;
}



@implementation NSString (URLEncode)
+ (NSString *)na_urlEncodeForString:(NSString *)string {
    // 编码前，先解码以防止多次编码问题
    return na_urlEncodeForString(string);
}

- (NSString *)na_urlEncodedString {
    return na_urlEncodeForString(self);
}

- (NSString *)na_urlOneEncodedString {
    return na_urlEncodeForString([self na_genuineUrlDecodedString]);
}

- (NSString *)na_appendStringForUrlEncode:(NSString *)newString {
    return [NSString stringWithFormat:@"%@%@", self, [newString na_urlOneEncodedString]];
}

- (NSString *)na_appendString:(NSString *)newString {
    return [self stringByAppendingString:newString];
}

- (BOOL)na_notURLEncodedString {
    return na_validateNotURLEncodeForString(self);
}
@end


@implementation NSString (URLDecode)
+ (NSString *)na_urlDecodeForString:(NSString *)string {
    return na_urlDecodeForString(string);
}

- (NSString *)na_urlDecodedString {
    return na_urlDecodeForString(self);
}

- (NSString *)na_genuineUrlDecodedString {
    NSString *newDecodedString = self;
    NSString *decodedString = na_urlDecodeForString(newDecodedString);
    while (![newDecodedString isEqualToString:decodedString]) {
        newDecodedString = decodedString;
        decodedString = na_urlDecodeForString(newDecodedString);
    }
    return newDecodedString;
}
@end


@implementation NSURL (URLFromEncodedString)
+ (instancetype)na_URLWithString:(NSString *)URLString {
    URLString = [URLString na_urlOneEncodedString];
    return [self URLWithString:URLString];
}
@end