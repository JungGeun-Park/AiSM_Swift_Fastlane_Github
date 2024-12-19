//
//  ViewController.m
//  AiSM_Swift_Fastlane_Github
//
//  Created by 박정근 on 12/19/24.
//

#import "ViewController.h"
#import "AppsealingiOS.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    //############################################################## AppSealing Code-Part BEGIN: DO NOT MODIFY THIS LINE !!!
#if true  //--------------------------------------- APPSEALING-GetDeviceID [BEGIN] : DO NOT REMOVE THIS COMMENT !!!
    NSString* _appsealing_msg1 = @"\n\n* AppSealing Device ID : ";
    char _appSealingDeviceID_auto_generated[64];
    
    // query AppSealing device unique identifier (optional)
    if ( ObjC_GetAppSealingDeviceID( _appSealingDeviceID_auto_generated ) == 0 )
        _appsealing_msg1 = [_appsealing_msg1 stringByAppendingString:[[NSString alloc] initWithUTF8String:_appSealingDeviceID_auto_generated]];
    else
        _appsealing_msg1 = [_appsealing_msg1 stringByAppendingString:@"Unknown"];
    NSLog( [_appsealing_msg1 stringByAppendingString:@"%s"], "\n" );
#endif    //--------------------------------------- APPSEALING-GetDeviceID [END] : DO NOT REMOVE THIS COMMENT !!!
    
#if true  //--------------------------------------- APPSEALING-SecurityThreadCheck [BEGIN] : DO NOT REMOVE THIS COMMENT !!!
    int _appsealing_tamper_auto_generated = ObjC_IsAbnormalEnvironmentDetected();
    NSLog( @"AppSealing Security Threat = %08X", _appsealing_tamper_auto_generated );
    if ( _appsealing_tamper_auto_generated > 0 )
    {
        NSString* _appsealing_msg2 = @"-------------------------------------\n Abnormal Environment Detected !!\n-------------------------------------";
        if (( _appsealing_tamper_auto_generated & DETECTED_JAILBROKEN ) > 0 )
            _appsealing_msg2 = [_appsealing_msg2 stringByAppendingString:@"\n - Jailbroken"];
        if (( _appsealing_tamper_auto_generated & DETECTED_DRM_DECRYPTED ) > 0 )
            _appsealing_msg2 = [_appsealing_msg2 stringByAppendingString:@"\n - Executable is not encrypted"];
        if (( _appsealing_tamper_auto_generated & DETECTED_DEBUG_ATTACHED ) > 0 )
            _appsealing_msg2 = [_appsealing_msg2 stringByAppendingString:@"\n - App is debugged"];
        if (( _appsealing_tamper_auto_generated & ( DETECTED_HASH_INFO_CORRUPTED | DETECTED_HASH_MODIFIED )) > 0 )
            _appsealing_msg2 = [_appsealing_msg2 stringByAppendingString:@"\n - App integrity corrupted"];
        if (( _appsealing_tamper_auto_generated & ( DETECTED_CODESIGN_CORRUPTED | DETECTED_EXECUTABLE_CORRUPTED )) > 0 )
            _appsealing_msg2 = [_appsealing_msg2 stringByAppendingString:@"\n - App executable has corrupted"];
        if (( _appsealing_tamper_auto_generated & DETECTED_CERTIFICATE_CHANGED ) > 0 )
            _appsealing_msg2 = [_appsealing_msg2 stringByAppendingString:@"\n - App has re-signed"];
        if (( _appsealing_tamper_auto_generated & DETECTED_BLACKLIST_CORRUPTED ) > 0 )
            _appsealing_msg2 = [_appsealing_msg2 stringByAppendingString:@"\n - Blacklist/Whitelist has corrupted or missing"];
        if (( _appsealing_tamper_auto_generated & DETECTED_CHEAT_TOOL ) > 0 )
            _appsealing_msg2 = [_appsealing_msg2 stringByAppendingString:@"\n - Cheat tool has detected"];
        
        UIAlertController *_alert_auto_generated = [UIAlertController alertControllerWithTitle:@"AppSealing"
                                                                                       message:_appsealing_msg2
                                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *_confirm_auto_generated = [UIAlertAction actionWithTitle:@"Confirm" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
                                                  {
#if !DEBUG && !defined(DEBUG) // Debug mode does not kill app even if security threat has found
            exit( 0 );
#endif
        }];
        [_alert_auto_generated addAction:_confirm_auto_generated];
        [self presentViewController:_alert_auto_generated animated:YES completion:^{}];
    }
#endif    //--------------------------------------- APPSEALING-SecurityThreadCheck [END] : DO NOT REMOVE THIS COMMENT !!!
#if true  //--------------------------------------- APPSEALING-GetCredential [BEGIN] : DO NOT REMOVE THIS COMMENT !!!
    NSString* _appsealing_msg3 = @"\n\n* AppSealing Credential : ";
    char _appSealingCredential_auto_generated[290];
    if ( ObjC_GetEncryptedCredential( _appSealingCredential_auto_generated ) == 0 )
        _appsealing_msg3 = [_appsealing_msg3 stringByAppendingString:[[NSString alloc] initWithUTF8String:_appSealingCredential_auto_generated]];
    else
        _appsealing_msg3 = [_appsealing_msg3 stringByAppendingString:@"Unknown"];
    NSLog( [_appsealing_msg3 stringByAppendingString:@"%s"], "\n" );
    // use thie credential value in your authentication function
#endif    //--------------------------------------- APPSEALING-GetDeviceID [END] : DO NOT REMOVE THIS COMMENT !!!
    
#if false //--------------------------------------- APPSEALING-AntiSwizzling [BEGIN] : DO NOT REMOVE THIS COMMENT !!!
    [AppSealingInterface _NotifySwizzlingDetected:^( NSString* msg ) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"AppSealing"
                                                                       message:msg
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"Confirm"
                                                          style:UIAlertActionStyleDefault
                                                        handler:^( UIAlertAction * _Nonnull action ) {
#if !DEBUG && !defined(DEBUG) // Debug mode does not kill app even if security threat has found
            exit( 0 );
#endif
        }];
        [alert addAction:confirm];
        [self presentViewController:alert animated:YES completion:nil];
    }];
#endif    //--------------------------------------- APPSEALING-GetDeviceID [END] : DO NOT REMOVE THIS COMMENT !!!
    //############################################################## AppSealing Code-Part END: DO NOT MODIFY THIS LINE !!!
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
