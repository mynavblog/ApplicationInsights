codeunit 50017 "LGS Application Insights Mgt."
{
    trigger OnRun()
    begin

    end;

    var
        AppInsightsSDK: Codeunit "LGS Application Insights SDK";
        Properties: Dictionary of [Text, Text];
        Metrics: Dictionary of [Text, Decimal];
        AppInsightKey: Text;

        StartTime: Dictionary of [text, DateTime];
        StopTime: Dictionary of [text, DateTime];



    procedure InitKey(value: text)
    begin 
        AppInsightKey := value;
    end;

    procedure AddProperty(PropertyName: Text; PropertyValue: Text)
    begin
        if Properties.ContainsKey(PropertyName) then
            Properties.Set(PropertyName, PropertyValue)
        else
            Properties.Add(PropertyName, PropertyValue);
    end;

    procedure AddMetric(MetricName: Text; MetricValue: Decimal)
    begin
        if Metrics.ContainsKey(MetricName) then
            Metrics.Set(MetricName, MetricValue)
        else
            Metrics.Add(MetricName, MetricValue);
    end;

    procedure CustomEvent(EventName: Text)
    begin
        SetKey();
        AppInsightsSDK.TrackCustomEvent(EventName, Properties, Metrics);
    end;

    procedure ExceptionError(Id: Text; ExceptionMsg: Text)
    var
        SeverityLevel: Option Information,Verbose,Warning,Error,Critical;
    begin
        SetKey();
        AppInsightsSDK.TrackException(Id, ExceptionMsg, SeverityLevel::Error, Properties, Metrics);
    end;

    procedure ExceptionCritical(Id: Text; ExceptionMsg: Text)
    var
        SeverityLevel: Option Information,Verbose,Warning,Error,Critical;
    begin
        SetKey();
        AppInsightsSDK.TrackException(Id, ExceptionMsg, SeverityLevel::Critical, Properties, Metrics);
    end;

    procedure ExceptionWarning(Id: Text; ExceptionMsg: Text)
    var
        SeverityLevel: Option Information,Verbose,Warning,Error,Critical;
    begin
        SetKey();
        AppInsightsSDK.TrackException(Id, ExceptionMsg, SeverityLevel::Warning, Properties, Metrics);
    end;

    procedure TraceInformation(TraceText: Text)
    var
        SeverityLevel: Option Information,Verbose,Warning,Error,Critical;
    begin
        SetKey();
        AppInsightsSDK.TrackTrace(TraceText, SeverityLevel::Information, Properties);
    end;

    procedure TraceWarning(TraceText: Text)
    var
        SeverityLevel: Option Information,Verbose,Warning,Error,Critical;
    begin
        SetKey();
        AppInsightsSDK.TrackTrace(TraceText, SeverityLevel::Warning, Properties);
    end;

    procedure TraceError(TraceText: Text)
    var
        SeverityLevel: Option Information,Verbose,Warning,Error,Critical;
    begin
        SetKey();
        AppInsightsSDK.TrackTrace(TraceText, SeverityLevel::Error, Properties);
    end;

    procedure TraceCritical(TraceText: Text)
    var
        SeverityLevel: Option Information,Verbose,Warning,Error,Critical;
    begin
        SetKey();
        AppInsightsSDK.TrackTrace(TraceText, SeverityLevel::Critical, Properties);
    end;

    procedure TrackPageOpen(ObjectName: Text)
    var
        UsageObjectType: Option "Page","Report","Action";
    begin
        SetKey();
        AppInsightsSDK.TrackObjectUsage(UsageObjectType::Page, ObjectName);
    end;

    procedure TrackReportOpen(ObjectName: Text)
    var
        UsageObjectType: Option "Page","Report","Action";
    begin
        SetKey();
        AppInsightsSDK.TrackObjectUsage(UsageObjectType::Report, ObjectName);
    end;

    procedure TrackRunAction(ObjectName: Text; ActionName: Text)
    var
        UsageObjectType: Option "Page","Report","Action";
    begin
        SetKey();
        AppInsightsSDK.TrackObjectUsage(UsageObjectType::Action, StrSubstNo('%1.%2', ObjectName, ActionName));
    end;
    
    local procedure SetKey()
    begin
        AppInsightsSDK.Init(AppInsightKey);
    end;

    procedure StartFunctionExecution(functionId: text)
    begin 
    if StartTime.ContainsKey(functionId) then
        StartTime.Set(functionId,CurrentDateTime)
    else
        StartTime.Add(functionId,CurrentDateTime);
    end;

    procedure StopFunctionExecution(functionId: Text)
    begin 
        if StopTime.ContainsKey(functionId) then
            StopTime.Set(functionId,CurrentDateTime)
        else
            StopTime.Add(functionId,CurrentDateTime);
    end;

    procedure GetFunctionDuration(functionId: Text): Integer
    begin 
        exit(GetFunctionStopTime(functionId)-GetFunctionStartTime(functionId));
    end;

    local procedure GetFunctionStopTime(functionId: Text): DateTime
    begin 
        exit(StopTime.Get(functionId));
    end;

    local procedure GetFunctionStartTime(functionId: Text): DateTime
    begin 
        exit(StartTime.Get(functionId));
    end;
}