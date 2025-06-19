param (
    [Parameter(Mandatory=$true)]
    [string]$reposName
)

if (-not $reposName) {
    Write-Host "Error: repository is requreid, example value: central spring"
    exit 1
}

Write-Host "Mvn Repository Name to scan: $reposName"

java -showversion `
 -verbose:gc `
 -verbose:module `
 -Xdiag `
 -Xlog:codecache,gc*,safepoint:file=../log/jvmunified.log:level,tags,time,uptime,pid:filesize=209715200,filecount=10 `
 -XshowSettings:all `
 -XX:+UnlockDiagnosticVMOptions `
 -XX:NativeMemoryTracking=summary `
 -XX:+ExtensiveErrorReports `
 -XX:+HeapDumpOnOutOfMemoryError `
 -XX:+PerfDataSaveToFile `
 -XX:+PrintClassHistogram `
 -XX:+PrintCommandLineFlags `
 -XX:+PrintConcurrentLocks `
 -XX:+PrintNMTStatistics `
 -XX:+DebugNonSafepoints `
 -XX:FlightRecorderOptions=repository=../log `
 -XX:StartFlightRecording=disk=true,dumponexit=true,filename=../log/profile.jfr,name=Profiling,settings=profile `
 -Xmx16g `
 -server `
 -jar ../mavendb.jar -r $reposName
