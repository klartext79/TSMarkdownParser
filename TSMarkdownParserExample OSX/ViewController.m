//
//  ViewController.m
//  TSMarkdownParserExample OSX
//
//  Created by Antoine Cœur on 3/29/16.
//  Copyright © 2016 Computertalk Sweden. All rights reserved.
//

#import "ViewController.h"
#import "TSMarkdownParser.h"


@interface ViewController () <NSTextViewDelegate>

@property (strong, nonatomic) TSMarkdownParser *parser;
@property (unsafe_unretained) IBOutlet NSTextView *markdownInput;
@property (weak) IBOutlet NSTextField *markdownOutput;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    self.markdownInput.string = @"# header 1\n\
## header 2\n\
### header 3\n\
#### header 4\n\
##### header 5\n\
###### header 6\n\
* list, _emphasis_, *emphasis*\n\
++ list, __bold__, **bold**\n\
--- list, `code`, ``code``\n\
> quote\n\
>> quote\n\
\\# \\*escaping\\* \\_escaping\\_ \\`escaping\\`\n\
[link](http://example.net)\n\
http://example.net\n\
![image](markdown)";
    
    self.parser = [TSMarkdownParser standardParser];
    
    // updating output
    [self textDidChange:[NSNotification notificationWithName:@"NSTextDidChangeNotification" object:self.markdownInput]];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

#pragma mark -

- (void)textDidChange:(NSNotification *)aNotification
{
    self.markdownOutput.attributedStringValue = [self.parser attributedStringFromMarkdown:self.markdownInput.string];
}

@end
