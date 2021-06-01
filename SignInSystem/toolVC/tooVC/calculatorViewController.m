//
//  calculatorViewController.m
//  signIn
//
//  Created by xuchenfei on 2021/4/12.
//

#import "calculatorViewController.h"

@interface calculatorViewController ()

@end

@implementation calculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   // NSLog(@"%@",SCREENHEIGHT);
    int width = self.view.bounds.size.width;
    int height = self.view.bounds.size.height;
    //NSLog(@"%d  %d",width,height);
    self.view.backgroundColor = [UIColor grayColor];
    self.showLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, height-140-110-110-110-110-60-120, width, 80)];
    //showLabel.backgroundColor = [UIColor redColor];
    self.ShowContent = @"";
    self.result = @"";
    self.expression = @"";
    self.tempString = @"";
    self.showLabel.text = self.ShowContent;
    self.showLabel.font = [UIFont systemFontOfSize:75];
    self.showLabel.textColor = [UIColor whiteColor];
    self.showLabel.textAlignment = NSTextAlignmentRight;
   
    
    
    //char * s= "Blah blah";
    //NSString * bar = @"1+2+3";
   // s = [bar UTF8String];//NSString转char*
   // NSLog(@"s = %s",s);
    
    
   // int a = [self calculateWith:s];
    //NSLog(@"s = %d",a);
    
    
    [self.view addSubview:self.showLabel];
    
    //0
    self.buttonValue0 = [[UIButton alloc]initWithFrame:CGRectMake(0, height-200, (width/4)+100, 100)];
    self.buttonValue0.backgroundColor = [UIColor blackColor];
    [self.buttonValue0 setTitle:@"0" forState:UIControlStateNormal];
    [self.buttonValue0 addTarget:self action:@selector(buttonValue0Click) forControlEvents:UIControlEventTouchUpInside];
    
    //.
    self.buttonValuePoint = [[UIButton alloc]initWithFrame:CGRectMake((width/4)*2, height-200, 100, 100)];
    self.buttonValuePoint.backgroundColor = [UIColor blackColor];
    [self.buttonValuePoint setTitle:@"." forState:UIControlStateNormal];
    [self.buttonValuePoint addTarget:self action:@selector(buttonValuePointClick) forControlEvents:UIControlEventTouchUpInside];

    //等于
    self.buttonValueEqual = [[UIButton alloc]initWithFrame:CGRectMake((width/4)*3, height-200, 100, 100)];
    self.buttonValueEqual.backgroundColor = [UIColor orangeColor];
    [self.buttonValueEqual setTitle:@"=" forState:UIControlStateNormal];
    [self.buttonValueEqual addTarget:self action:@selector(buttonValueEqualClick) forControlEvents:UIControlEventTouchUpInside];

    
    
    //1
    self.buttonValue1 = [[UIButton alloc]initWithFrame:CGRectMake(0, height-140-110-60, 100, 100)];
    self.buttonValue1.backgroundColor = [UIColor blackColor];
    [self.buttonValue1 setTitle:@"1" forState:UIControlStateNormal];
    [self.buttonValue1 addTarget:self action:@selector(buttonValue1Click) forControlEvents:UIControlEventTouchUpInside];

    //2
    self.buttonValue2 = [[UIButton alloc]initWithFrame:CGRectMake((width/4), height-140-110-60, 100, 100)];
    self.buttonValue2.backgroundColor = [UIColor blackColor];
    [self.buttonValue2 setTitle:@"2" forState:UIControlStateNormal];
    [self.buttonValue2 addTarget:self action:@selector(buttonValue2Click) forControlEvents:UIControlEventTouchUpInside];

    //3
    self.buttonValue3 = [[UIButton alloc]initWithFrame:CGRectMake((width/4)*2, height-140-110-60, 100, 100)];
    self.buttonValue3.backgroundColor = [UIColor blackColor];
    [self.buttonValue3 setTitle:@"3" forState:UIControlStateNormal];
    [self.buttonValue3 addTarget:self action:@selector(buttonValue3Click) forControlEvents:UIControlEventTouchUpInside];

    //加
    self.buttonValuePlus = [[UIButton alloc]initWithFrame:CGRectMake((width/4)*3, height-140-110-60, 100, 100)];
    self.buttonValuePlus.backgroundColor = [UIColor orangeColor];
    [self.buttonValuePlus setTitle:@"➕" forState:UIControlStateNormal];
    [self.buttonValuePlus addTarget:self action:@selector(buttonValuePlusClick) forControlEvents:UIControlEventTouchUpInside];

    
    //4
    self.buttonValue4 = [[UIButton alloc]initWithFrame:CGRectMake(0, height-140-110-110-60, 100, 100)];
    self.buttonValue4.backgroundColor = [UIColor blackColor];
    [self.buttonValue4 setTitle:@"4" forState:UIControlStateNormal];
    [self.buttonValue4 addTarget:self action:@selector(buttonValue4Click) forControlEvents:UIControlEventTouchUpInside];

    //5
    self.buttonValue5 = [[UIButton alloc]initWithFrame:CGRectMake((width/4), height-140-110-110-60, 100, 100)];
    self.buttonValue5.backgroundColor = [UIColor blackColor];
    [self.buttonValue5 setTitle:@"5" forState:UIControlStateNormal];
    [self.buttonValue5 addTarget:self action:@selector(buttonValue5Click) forControlEvents:UIControlEventTouchUpInside];

    //6
    self.buttonValue6 = [[UIButton alloc]initWithFrame:CGRectMake((width/4)*2, height-140-110-110-60, 100, 100)];
    self.buttonValue6.backgroundColor = [UIColor blackColor];
    [self.buttonValue6 setTitle:@"6" forState:UIControlStateNormal];
    [self.buttonValue6 addTarget:self action:@selector(buttonValue6Click) forControlEvents:UIControlEventTouchUpInside];

    //减
    self.buttonValueMinus = [[UIButton alloc]initWithFrame:CGRectMake((width/4)*3, height-140-110-110-60, 100, 100)];
    self. buttonValueMinus.backgroundColor = [UIColor orangeColor];
    [self.buttonValueMinus setTitle:@"➖" forState:UIControlStateNormal];
    [self.buttonValueMinus addTarget:self action:@selector(buttonValueMinusClick) forControlEvents:UIControlEventTouchUpInside];

    
    //7
    self.buttonValue7 = [[UIButton alloc]initWithFrame:CGRectMake(0, height-140-110-110-110-60, 100, 100)];
    self.buttonValue7.backgroundColor = [UIColor blackColor];
    [self.buttonValue7 setTitle:@"7" forState:UIControlStateNormal];
    [self.buttonValue7 addTarget:self action:@selector(buttonValue7Click) forControlEvents:UIControlEventTouchUpInside];

    //8
    self.buttonValue8 = [[UIButton alloc]initWithFrame:CGRectMake((width/4), height-140-110-110-110-60, 100, 100)];
    self.buttonValue8.backgroundColor = [UIColor blackColor];
    [self.buttonValue8 setTitle:@"8" forState:UIControlStateNormal];
    [self.buttonValue8 addTarget:self action:@selector(buttonValue8Click) forControlEvents:UIControlEventTouchUpInside];

    //9
    self.buttonValue9 = [[UIButton alloc]initWithFrame:CGRectMake((width/4)*2, height-140-110-110-110-60, 100, 100)];
    self.buttonValue9.backgroundColor = [UIColor blackColor];
    [self.buttonValue9 setTitle:@"9" forState:UIControlStateNormal];
    [self.buttonValue9 addTarget:self action:@selector(buttonValue9Click) forControlEvents:UIControlEventTouchUpInside];

    //乘
    self.buttonValueRide = [[UIButton alloc]initWithFrame:CGRectMake((width/4)*3, height-140-110-110-110-60, 100, 100)];
    self.buttonValueRide.backgroundColor = [UIColor orangeColor];
    [self.buttonValueRide setTitle:@"✖️" forState:UIControlStateNormal];
    [self.buttonValueRide addTarget:self action:@selector(buttonValueRideClick) forControlEvents:UIControlEventTouchUpInside];

    
    //清空
    self.buttonValueAC = [[UIButton alloc]initWithFrame:CGRectMake(0, height-140-110-110-110-110-60, 100, 100)];
    self.buttonValueAC.backgroundColor = [UIColor blackColor];
    [self.buttonValueAC setTitle:@"AC" forState:UIControlStateNormal];
    [self.buttonValueAC addTarget:self action:@selector(buttonValueACClick) forControlEvents:UIControlEventTouchUpInside];

    //正负
    self.buttonValueDouble = [[UIButton alloc]initWithFrame:CGRectMake((width/4), height-140-110-110-110-110-60, 100, 100)];
    self.buttonValueDouble.backgroundColor = [UIColor blackColor];
    [self.buttonValueDouble setTitle:@"+/-" forState:UIControlStateNormal];
    [self.buttonValueDouble addTarget:self action:@selector(buttonValueDoubleClick) forControlEvents:UIControlEventTouchUpInside];

    //%
    self.buttonValueBai = [[UIButton alloc]initWithFrame:CGRectMake((width/4)*2, height-140-110-110-110-110-60, 100, 100)];
    self.buttonValueBai.backgroundColor = [UIColor blackColor];
    [self.buttonValueBai setTitle:@"%" forState:UIControlStateNormal];
    [self.buttonValueBai addTarget:self action:@selector(buttonValueBaiClick) forControlEvents:UIControlEventTouchUpInside];

    //除
    self.buttonValueDivide = [[UIButton alloc]initWithFrame:CGRectMake((width/4)*3, height-140-110-110-110-110-60, 100, 100)];
    self.buttonValueDivide.backgroundColor = [UIColor orangeColor];
    [self.buttonValueDivide setTitle:@"➗" forState:UIControlStateNormal];
    [self.buttonValueDivide addTarget:self action:@selector(buttonValueDivideClick) forControlEvents:UIControlEventTouchUpInside];



    
    [self.view addSubview:self.buttonValue0];
    [self.view addSubview:self.buttonValuePoint];
    [self.view addSubview:self.buttonValueEqual];
    
    [self.view addSubview:self.buttonValue1];
    [self.view addSubview:self.buttonValue2];
    [self.view addSubview:self.buttonValue3];
    [self.view addSubview:self.buttonValuePlus];

    [self.view addSubview:self.buttonValue4];
    [self.view addSubview:self.buttonValue5];
    [self.view addSubview:self.buttonValue6];
    [self.view addSubview:self.buttonValueMinus];

    [self.view addSubview:self.buttonValue7];
    [self.view addSubview:self.buttonValue8];
    [self.view addSubview:self.buttonValue9];
    [self.view addSubview:self.buttonValueRide];

    [self.view addSubview:self.buttonValueAC];
    [self.view addSubview:self.buttonValueDouble];
    [self.view addSubview:self.buttonValueBai];
    [self.view addSubview:self.buttonValueDivide];

}

- (void)buttonValue0Click
{
    
    self.ShowContent = [self.ShowContent stringByAppendingString:@"0"];
    self.expression = [self.expression stringByAppendingString:@"0"];
    
    self.showLabel.text = self.ShowContent;
    NSLog(@"expression :%@",self.expression);
    NSLog(@"showcontent :%@",self.ShowContent);
    NSLog(@"-------");
    self.buttonValue0.showsTouchWhenHighlighted = YES;
}
- (void)buttonValue1Click
{
    //NSLog(@"1111");
    self.ShowContent = [self.ShowContent stringByAppendingString:@"1"];
    self.tempString = @"1";
    //self.expression = [self.expression stringByAppendingString:@"9"];

    
    self.showLabel.text = self.ShowContent;
    NSLog(@"expression :%@",self.expression);
    NSLog(@"showcontent :%@",self.ShowContent);
    NSLog(@"-------");
    self.buttonValue1.showsTouchWhenHighlighted = YES;
}
- (void)buttonValue2Click
{
    //NSLog(@"222");
    self.ShowContent = [self.ShowContent stringByAppendingString:@"2"];
    self.tempString = @"2";
    //self.expression = [self.expression stringByAppendingString:@"9"];

    
    self.showLabel.text = self.ShowContent;
    NSLog(@"expression :%@",self.expression);
    NSLog(@"showcontent :%@",self.ShowContent);
    NSLog(@"-------");
    self.buttonValue2.showsTouchWhenHighlighted = YES;
}
- (void)buttonValue3Click
{
    self.ShowContent = [self.ShowContent stringByAppendingString:@"3"];
    self.tempString = @"3";
    //self.expression = [self.expression stringByAppendingString:@"9"];

    
    self.showLabel.text = self.ShowContent;
    NSLog(@"expression :%@",self.expression);
    NSLog(@"showcontent :%@",self.ShowContent);
    NSLog(@"-------");
    self.buttonValue3.showsTouchWhenHighlighted = YES;
}
- (void)buttonValue4Click
{
    //NSLog(@"444");
    self.ShowContent = [self.ShowContent stringByAppendingString:@"4"];
    self.tempString = @"4";
    //self.expression = [self.expression stringByAppendingString:@"9"];

    
    self.showLabel.text = self.ShowContent;
    NSLog(@"expression :%@",self.expression);
    NSLog(@"showcontent :%@",self.ShowContent);
    NSLog(@"-------");
    self.buttonValue4.showsTouchWhenHighlighted = YES;
}
- (void)buttonValue5Click
{
    self.ShowContent = [self.ShowContent stringByAppendingString:@"5"];
    self.tempString = @"5";
    //self.expression = [self.expression stringByAppendingString:@"9"];

    
    self.showLabel.text = self.ShowContent;
    NSLog(@"expression :%@",self.expression);
    NSLog(@"showcontent :%@",self.ShowContent);
    NSLog(@"-------");
    self.buttonValue5.showsTouchWhenHighlighted = YES;
}
- (void)buttonValue6Click
{
    self.ShowContent = [self.ShowContent stringByAppendingString:@"6"];
    self.tempString = @"6";
    //self.expression = [self.expression stringByAppendingString:@"9"];

    
    self.showLabel.text = self.ShowContent;
    NSLog(@"expression :%@",self.expression);
    NSLog(@"showcontent :%@",self.ShowContent);
    NSLog(@"-------");
    self.buttonValue6.showsTouchWhenHighlighted = YES;
}
- (void)buttonValue7Click
{
    self.ShowContent = [self.ShowContent stringByAppendingString:@"7"];
    self.tempString = @"7";
    //self.expression = [self.expression stringByAppendingString:@"9"];

    
    self.showLabel.text = self.ShowContent;
    NSLog(@"expression :%@",self.expression);
    NSLog(@"showcontent :%@",self.ShowContent);
    NSLog(@"-------");
    self.buttonValue7.showsTouchWhenHighlighted = YES;
}

- (void)buttonValue8Click
{
    //NSLog(@"888");
    self.ShowContent = [self.ShowContent stringByAppendingString:@"8"];
    self.tempString = @"8";
    //self.expression = [self.expression stringByAppendingString:@"9"];

    
    self.showLabel.text = self.ShowContent;
    NSLog(@"expression :%@",self.expression);
    NSLog(@"showcontent :%@",self.ShowContent);
    NSLog(@"-------");
    self.buttonValue8.showsTouchWhenHighlighted = YES;
}
- (void)buttonValue9Click
{
    //NSLog(@"999");
    self.ShowContent = [self.ShowContent stringByAppendingString:@"9"];
    self.tempString = @"9";
    //self.expression = [self.expression stringByAppendingString:@"9"];

    
    self.showLabel.text = self.ShowContent;
    NSLog(@"expression :%@",self.expression);
    NSLog(@"showcontent :%@",self.ShowContent);
    NSLog(@"-------");
    self.buttonValue9.showsTouchWhenHighlighted = YES;
}
- (void)buttonValueBaiClick
{
    NSLog(@"百分号");
    
    float floatString = [self.tempString floatValue]/100;
    
    NSLog(@"%f",floatString);
    
    self.ShowContent = [NSString stringWithFormat:@"%f",floatString];
    self.tempString = [NSString stringWithFormat:@"%f",floatString];
    
    self.showLabel.text = self.ShowContent;


    //self.showLabel.text = self.ShowContent;
    self.ShowContent = @"";
    NSLog(@"expression :%@",self.expression);
    NSLog(@"showcontent :%@",self.ShowContent);
    NSLog(@"-------");
    
    self.buttonValueBai.showsTouchWhenHighlighted = YES;
}
- (void)buttonValuePlusClick
{
    //NSLog(@"+");
    //self.ShowContent = [self.ShowContent stringByAppendingString:@"+"];
    NSLog(@"temp :%@",self.tempString);
    if(self.tempString != nil)
    {
        self.expression = [self.expression stringByAppendingString:self.tempString];
    }
    self.tempString = @"";
    self.expression = [self.expression stringByAppendingString:@"+"];

    
    self.ShowContent = @"";
    NSLog(@"expression :%@",self.expression);
    NSLog(@"showcontent :%@",self.ShowContent);
    NSLog(@"-------");
    self.buttonValuePlus.showsTouchWhenHighlighted = YES;
}



- (void)buttonValuePointClick
{
    NSLog(@".");
    if(self.tempString != nil)
    {
        self.expression = [self.expression stringByAppendingString:self.tempString];
    }
    self.ShowContent = [self.ShowContent stringByAppendingString:@"."];
    self.expression = [self.expression stringByAppendingString:@"."];
    self.showLabel.text = self.ShowContent;

    self.buttonValuePoint.showsTouchWhenHighlighted = YES;
}


- (void)buttonValueMinusClick
{
    //NSLog(@"---");
    //self.ShowContent = [self.ShowContent stringByAppendingString:@"-"];
    self.expression = [self.expression stringByAppendingString:@"-"];

    //self.showLabel.text = self.ShowContent;
    self.ShowContent = @"";
    NSLog(@"expression :%@",self.expression);
    NSLog(@"showcontent :%@",self.ShowContent);
    NSLog(@"-------");
    self.buttonValueMinus.showsTouchWhenHighlighted = YES;
}

//


- (void)buttonValueRideClick
{
    //NSLog(@"***");
    //self.ShowContent = [self.ShowContent stringByAppendingString:@"*"];
    if(self.tempString != nil)
    {
        self.expression = [self.expression stringByAppendingString:self.tempString];
    }
    self.expression = [self.expression stringByAppendingString:@"*"];
    self.ShowContent = @"";
   // self.showLabel.text = self.ShowContent;
    NSLog(@"expression :%@",self.expression);
    NSLog(@"showcontent :%@",self.ShowContent);
    NSLog(@"-------");
    self.buttonValueRide.showsTouchWhenHighlighted = YES;
}

//
- (void)buttonValueACClick
{
    NSLog(@"Ac");
    self.ShowContent = @"";
    self.expression = @"";
    self.result = @"";
    self.showLabel.text = self.ShowContent;
    NSLog(@"expression :%@",self.expression);
    NSLog(@"showcontent :%@",self.ShowContent);
    NSLog(@"-------");
    self.buttonValueAC.showsTouchWhenHighlighted = YES;
}
- (void)buttonValueDoubleClick
{
    NSLog(@"+/-");
    self.expression = [self.expression stringByAppendingString:@"("];

    //self.showLabel.text = self.ShowContent;
    self.ShowContent = @"";
    NSLog(@"expression :%@",self.expression);
    NSLog(@"showcontent :%@",self.ShowContent);
    NSLog(@"-------");
    self.buttonValueDouble.showsTouchWhenHighlighted = YES;
}

- (void)buttonValueDivideClick
{
    //NSLog(@"///");
   // self.ShowContent = [self.ShowContent stringByAppendingString:@"/"];
    if(self.tempString != nil)
    {
        self.expression = [self.expression stringByAppendingString:self.tempString];
    }
    self.expression = [self.expression stringByAppendingString:@"/"];
    self.ShowContent = @"";
    //self.showLabel.text = self.ShowContent;
    NSLog(@"expression :%@",self.expression);
    NSLog(@"showcontent :%@",self.ShowContent);
    NSLog(@"-------");
    self.buttonValueDivide.showsTouchWhenHighlighted = YES;
}

- (void)buttonValueEqualClick
{
    NSLog(@"=");
    if(self.tempString != nil)
    {
        self.expression = [self.expression stringByAppendingString:self.tempString];
    }
    self.tempString = @"";
    NSLog(@"expression :%@",self.expression);
    
    self.buttonValue0.showsTouchWhenHighlighted = YES;
    
    char *s = "abc";
    s = [self.expression UTF8String];
    int ans = [self calculateWith:s];
    self.ShowContent = [NSString stringWithFormat:@"%d",ans];
    self.showLabel.text = self.ShowContent;
    self.expression = self.ShowContent;
    
    
    
//    int ans = [self calculateWithString:self.expression];
//    self.showLabel.text = self.result;
//    self.expression = self.result;
//    self.tempString = @"";
}



- (int)calculateWith:(char *)s
{
    int i;
    int retNum = 0;
    int value = 0;
    char sign = ' ';
    int *stackNum = (int *)malloc(strlen(s) * sizeof(int));
    int stackCnt = 0;
    for (i = 0; i < (int)strlen(s); i++) {
        // 空格跳过
        if (s[i] == ' ') {
            if (i != strlen(s) - 1) {
                continue;
            }
        }
        if (s[i] >= '0' && s[i] <= '9') {
            value = value * 10 + (s[i] - '0');
            if (i != strlen(s) - 1) {
                continue;
            }
        }
        switch (sign)
        {
        case '-':
            stackNum[stackCnt] = -value;
            stackCnt++;
            break;
        case '*':
            stackNum[stackCnt - 1] = stackNum[stackCnt - 1] * value;
            break;
        case '/':
            stackNum[stackCnt - 1] = stackNum[stackCnt - 1] / value;
            break;
        default:
            stackNum[stackCnt] = value;
            stackCnt++;
            break;
        }
        value = 0;
        sign = s[i];
    }
    // 求和
    for (i = stackCnt - 1; i >= 0; i--) {
        retNum += stackNum[i];
    }
    return retNum;
}

@end
