//
//  NAMacros.h
//  NAFakeWeChat
//
//  Created by zuopengl on 3/17/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#ifndef NAMacros_h
#define NAMacros_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "NABlockMacros.h"
#import "NAAssociationMacros.h"


#define ViewControllerWithNameInBundler(idName, bundle) ([UIStoryboard storyboardWithName:idName bundle:bundle)
#define ViewControllerWithName(idName)                  (ViewControllerByIdentifierInBundler(idName, [NSBundle mainBundle]))



#define guardAssignment(left, right)      if (right) { left = right; }
#define guardArrayAssignment(left, right) if ([right count] > 0) { left = right; }
#define safeRespondsToSelector(cls, selectorName)  if ([cls respondsToSelector:NSSelectorFromString(selectorName)]) {[cls performSelector:NSSelectorFromString(selectorName)];}


#endif /* NAMacros_h */
