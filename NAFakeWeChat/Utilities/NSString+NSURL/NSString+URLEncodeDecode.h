//
//  NSString+URLEncodeDecode.h
//
//  Created by zuopengl on 3/24/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>



/**
 *  详细细节请参考文档: http://tools.ietf.org/html/rfc3986
 */

/**
 *  对字符串进行URL编码
 *
 *  【***** 切记不要对已编码字符进行编码，防止多次编码】
 *
 *  @param string 待编码的字符串
 *
 *  @return 按url进行编码后的字符串；若string为空，返回 @""
 */
extern NSString *na_urlEncodeForString(NSString *string);

/**
 *  对字符串进行URL解码
 *
 *  @param string 待解码的字符串
 *
 *  @return 按url编码规则进行解码后的字符串； 若string为空，返回 @""
 */
extern NSString *na_urlDecodeForString(NSString *string);

/**
 *  检测字符串是否为已经使用url编码后的字符串；只有YES结果有用
 *
 *  @param string 待检测的字符串
 *
 *  @return YES: 结果一定正确，表示字符串含有保留关键字且不为编码后的octel规则字符集
 *           NO: 结果不一定正确，有一定的误报率；如果原字符串包含按url编码后的octel字符集，则不能检测出来
 */
extern BOOL na_validateNotURLEncodeForString(NSString *string);


@interface NSString (URLEncode)
+ (NSString *)na_urlEncodeForString:(NSString *)string;

/**
 *  判断字符串不是合法的URL编码的字符串
 *
 *  @return YES: 不是合法的，结果一定正确
 *           NO: 是合法的URL编码字符串，结果不一定正确，有误报率
 */
- (BOOL)na_notURLEncodedString;

/**
 *  返回按url编码规则进行编码的字符串；如果原字符串已经编码，将会进行多次编码
 *
 *  @return 编码的字符串
 */
- (NSString *)na_urlEncodedString;

/**
 *  返回按url编码规则进行编码的字符串；先对原字符串解码，然后编码（仅仅编码一次）
 *
 *  @return 编码的字符串
 */
- (NSString *)na_urlOneEncodedString;

/**
 *  对新字符串进行URL编码，并追加至原字符串（不对原字符串进行编码）
 *
 *  @return 拼接后的字符串
 */
- (NSString *)na_appendStringForUrlEncode:(NSString *)newString;

/**
 *  直接拼接新字符串至原字符串
 *
 *  @return 拼接后的字符串
 */
- (NSString *)na_appendString:(NSString *)newString;
@end



@interface NSString (URLDecode)
+ (NSString *)na_urlDecodeForString:(NSString *)string;

/**
 *  返回按url编码规则进行解码的字符串，仅解码一次
 *
 *  @return 解码的字符串
 */
- (NSString *)na_urlDecodedString;

/**
 *  返回按url编码规则进行解码的字符串；若进行了多次编码，同样会进行多次解码最终得到解码的字符串
 *
 *  @return 解码的字符串
 */
- (NSString *)na_genuineUrlDecodedString;
@end



@interface NSURL (URLFromEncodedString)
+ (instancetype)na_URLWithString:(NSString *)URLString;
@end




/**
 *  宏定义：URL编码与解码
 */
#define BDNURLEncodedString(string)                                          [string na_urlEncodedString]
#define BDNURLOneEncodedString(string)                                       [string na_urlOneEncodedString]
#define BDNURLDecodedString(string)                                          [string na_urlDecodedString]
#define BDNGenuineURLDecodedString(string)                                   [string na_genuineUrlDecodedString]
#define BDNURLEncodedStringByAppendingString(originalString, appendedString) [originalString na_appendStringForUrlEncode:appendedString]
#define BDNURLFromString(string)                                             [NSURL na_URLWithString:string]

