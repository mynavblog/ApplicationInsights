page 50100 "Test Page"
{
    PageType = Card;
    InstructionalText = 'Type the number of loops';
    layout
    {
        area(Content)
        {
            field(NumberOfLoops; NumberOfLoops)
            {
                ApplicationArea = all;
                Caption = 'number';
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(TestApplInsights)
            {
                Image = InteractionLog;
                ApplicationArea = all;
                trigger OnAction()
                var
                    TestAppInsights: Codeunit "AIR Test Application Insights";
                begin
                    TestAppInsights.GoThroughTheLoopAndCheckPerformance(NumberOfLoops);
                end;
            }
        }
    }

    var
        NumberOfLoops: BigInteger;
}