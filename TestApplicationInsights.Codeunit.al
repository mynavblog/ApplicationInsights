codeunit 50100 "AIR Test Application Insights"
{
    procedure GoThroughTheLoopAndCheckPerformance(MaxI: BigInteger)
    var
        i: Integer;
        CustDimension: Dictionary of [Text, Text];
        startTime: DateTime;
        endTime: DateTime;
        duration: Integer;
    begin
        startTime := CurrentDateTime;
        for i := 0 to MaxI do begin

        end;
        endTime := CurrentDateTime;
        duration := endTime - startTime;
        Message('Duration %1 (sec)', duration / 1000);

        CustDimension.Add('number', format(MaxI));
        CustDimension.Add('duration', Format(duration));
        Session.LogMessage('cu01', 'Very big loop', Verbosity::Normal, DataClassification::SystemMetadata, TelemetryScope::ExtensionPublisher, CustDimension);
    end;
}