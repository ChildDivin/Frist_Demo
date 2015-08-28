//
//  Global.h
//

// API Base URL
#define g_APIBaseURL    @"http://192.168.0.16/pareds/trunk/ws/user/" //Local
//#define g_APIBaseURL    @""


// API Request Name
#define g_Request_Login             @"login"
#define g_Request_FBLogin           @"fb_login"
#define g_Request_SignUP            @"simple_signup"
#define g_Request_Unlock            @""
#define g_Request_Image_Upload       @"upload_image"
#define g_Request_ForgotPass        @"forgot_password"
#define g_Request_Edit_Details      @"edit_profile"
#define g_Request_ChangePassword    @"change_password"


#define g_Request_EmailReport       @""
#define g_Request_delete_record     @""
#define g_Request_Add_Record        @""
#define g_Request_invite_user       @""

// Fonts
#define g_Font_Lato_Regular_13 [UIFont fontWithName:@"Lato-Regular" size:13.0]
#define g_Font_Lato_Bold_13 [UIFont fontWithName:@"Lato-Bold" size:13.0]

// RGB Color
#define g_RGB(R, G, B)      [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1]
#define g_RGBA(R, G, B, A)  [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

// NSDictionary Key
#define g_Dict_SelectedType             @"SelectedType"
#define g_Dict_SelectedPaymentMethod    @"SelectedPaymentMethod"
#define g_Dict_SelectedCurrency         @"SelectedCurrency"
#define g_Dict_SelectedFromDate         @"SelectedFromDate"
#define g_Dict_SelectedToDate           @"SelectedToDate"

// NSNotificationCenter Key
#define g_NotificationCenter_AddExpense         @"AddExpense"

// NSUserDefaults Key
#define g_UserDefaults_IsUserLock           @"IsUserLock"
#define g_UserDefaults_IsUserLogin          @"IsUserLogin"
#define g_UserDefaults_AppLunchFirstTime    @"AppLunchFirstTime"
#define g_UserDefaults_DictExpensesSorting  @"DictExpensesSorting"
#define g_UserDefaults_AddImageId           @"AddImageId"


#define g_UserDefaults_Token    @"TOKEN"
#define g_UserDefaults_FBId    @"FACEBOOK_ID"
#define g_UserDefaults_UserID    @"USER_ID"
#define g_UserDefaults_FB_PROFILE    @"FACEBOOK_PROFILE"
// Check Screen Size
#define g_ScreenWidth   [[UIScreen mainScreen] bounds].size.width
#define g_ScreenHeight  [[UIScreen mainScreen] bounds].size.height

//Image Default
#define g_imagePassHide @"ipass_Hide.png"
#define g_imagePassShow @"ipass_Show.png"

// Check View Size
#define g_ViewWidth(view)   view.frame.size.width
#define g_ViewHeight(view)  view.frame.size.height

// Check Version Compatibility
#define g_IS_IOS_6  ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0)
#define g_IS_IOS_7  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define g_IS_IOS_8  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

// Check Device Compatibility
#define g_IS_IPAD   ([[[UIDevice currentDevice] model] isEqualToString:@"iPad"])
#define g_IS_IPHONE ([[[UIDevice currentDevice] model] isEqualToString:@"iPhone"])
#define g_IS_IPOD   ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

#define g_IS_IPHONE_4_SCREEN        [[UIScreen mainScreen] bounds].size.height >= 480.0f && [[UIScreen mainScreen] bounds].size.height < 568.0f
#define g_IS_IPHONE_5_SCREEN        [[UIScreen mainScreen] bounds].size.height >= 568.0f && [[UIScreen mainScreen] bounds].size.height < 667.0f
#define g_IS_IPHONE_6_SCREEN        [[UIScreen mainScreen] bounds].size.height >= 667.0f && [[UIScreen mainScreen] bounds].size.height < 736.0f
#define g_IS_IPHONE_6Plus_SCREEN    [[UIScreen mainScreen] bounds].size.height >= 736.0f && [[UIScreen mainScreen] bounds].size.height < 1024.0f

// Slider Width
//#define g_SliderWidth_Left  200

// Other

#define g_ExoenseType_Add   @"add"
#define g_ExoenseType_Edit   @"edit"

#define g_ImageFolderName   @"ExpenseImages"
#define g_ImageName      @"_Image.png"
#define g_ImageNameAdd      @"_Add_Image.png"
#define g_ImageNameEdit      @"_Edit_Image.png"

#define g_StringFormate(fmt, args...)   [NSString stringWithFormat:fmt, ##args]
#define g_AppDelegate ((AppDelegate *)  [[UIApplication sharedApplication] delegate])
