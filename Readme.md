# Application Insights Mgt

 Codeunit can be used for telemetry in Dynamics 365 Business Central using Application Insights.

### AddProperty

Procedure allows to add custom property name and value in text. To add more parameters use the function multiple times before running the procedure to emit the event.
 
#### Usage
```
AddProperty(PropertyName, PropertyValue);
```
#### Parameters
*PropertyName [Text] 
*PropertyValue [Text] 

### AddMetric

Procedure allows to add custom metrics name in text and value in decimal. To add more custom metrics use the function multiple times before running the procedure to emit the event.
 
#### Usage
```
AddMetric(MetricName,MetricValue);
```
#### Parameters
*MetricName [Text] 
*MetricValue [Decimal]

### CustomEvent

Procedure allows to emit Custom Event to Application Insights. It will send Properties and Metrics.
 
#### Usage
```
CustomEvent(EventName)
```
#### Parameters
*EventName [Text] 

### ExceptionError

Procedure allows to emit Exception with Severity Error to Application Insights. It will send Properties and Metrics.
 
#### Usage
```
ExceptionError(Id,ExceptionMsg)
```
#### Parameters
*Id [Text] 
*ExceptionMsg [Text] 

### ExceptionCritical

Procedure allows to emit Exception with Severity Critical to Application Insights. It will send Properties and Metrics.
 
#### Usage
```
ExceptionCritical(Id, ExceptionMsg)
```
#### Parameters
*Id [Text] 
*ExceptionMsg [Text] 

### ExceptionWarning

Procedure allows to emit Exception with Severity Warning to Application Insights. It will send Properties and Metrics.
 
#### Usage
```
ExceptionWarning(Id, ExceptionMsg)
```
#### Parameters
*Id [Text] 
*ExceptionMsg [Text] 

### TraceInformation

Procedure allows to emit trace event with Severity Information to Application Insights. It will send Properties.
 
#### Usage
```
TraceInformation(TraceText)
```
#### Parameters
*TraceText [Text] 

### TraceWarning

Procedure allows to emit trace event with Severity Warning to Application Insights. It will send Properties.
 
#### Usage
```
TraceWarning(TraceText)
```
#### Parameters
*TraceText [Text] 

### TraceError

Procedure allows to emit trace event with Severity Error to Application Insights. It will send Properties.
 
#### Usage
```
TraceError(TraceText)
```
#### Parameters
*TraceText [Text] 

### TraceCritical

Procedure allows to emit trace event with Severity Critical to Application Insights. It will send Properties.
 
#### Usage
```
TraceCritical(TraceText)
```
#### Parameters
*TraceText [Text] 

### TrackPageOpen

Procedure allows to emit page open event with Operation Name Page to Application Insights.
 
#### Usage
```
TrackPageOpen(ObjectName)
```
#### Parameters
*ObjectName [Text] - should be name of the page which is opened.

### TrackReportOpen

Procedure allows to emit page open event with Operation Name Report to Application Insights.
 
#### Usage
```
TrackReportOpen(ObjectName)
```
#### Parameters
*ObjectName [Text] - should be name of the report which is opened.

### TrackRunAction

Procedure allows to emit page open event with Operation Name Report to Application Insights.
 
#### Usage
```
TrackRunAction(ObjectName,ActionName)
```
#### Parameters
*ObjectName [Text] - should be name of the page on which action is triggered.
*ActionName [Text] - should be name of the action which is triggered.




