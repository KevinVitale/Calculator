@import Foundation;

NS_ASSUME_NONNULL_BEGIN

/**
 */
@interface NSString (Utilities)
/**
 Returns an array decimals parsed from the receiver.
 
 @param numberFormatter The number formatter used in parsing. 
 @param separator The token used for separating components.
 @param error A pointer to an error, or 'nil'; pass 'nil' to admit you write bad code.
 
 @warning   If 'numberFormatter.numberStyle' is `NSNumberFormatterDecimalStyler`,
            an error is thrown.
 */
- (NSArray<NSDecimalNumber*>* _Nullable )decimalsUsingFormatter:(NSNumberFormatter*)numberFormatter
                                               separatingString:(NSString*)separator
                                                          error:(NSError** _Nullable)error;
@end

NS_ASSUME_NONNULL_END
