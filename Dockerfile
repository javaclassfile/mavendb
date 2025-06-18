# Build stage
FROM maven:3-eclipse-temurin-21 AS build

COPY .git    /app/.git
COPY pom.xml /app/
COPY src     /app/src

RUN  apt install git
RUN  cd /app && mvn clean package

# Run stage
FROM eclipse-temurin:21

ENV MAVENDB_MYSQL_HOST=localhost
ENV MAVENDB_MYSQL_PORT=3306
ENV MAVENDB_MYSQL_USER=mavendbadmin
ENV MAVENDB_MYSQL_PASS=123456
ENV MAVENDB_ARGS="-r central"

RUN mkdir -p                               /opt/mavendb
RUN mkdir -p                               /opt/mavendb/db
RUN mkdir -p                               /opt/mavendb/etc
RUN mkdir -p                               /opt/mavendb/lib
RUN mkdir -p                               /opt/mavendb/log
RUN mkdir -p                               /opt/mavendb/var

COPY --from=build /app/target/mavendb.jar  /opt/mavendb
COPY --from=build /app/target/db/          /opt/mavendb/db
COPY --from=build /app/target/etc/         /opt/mavendb/etc
COPY --from=build /app/target/lib/         /opt/mavendb/lib

ENTRYPOINT java \
 -showversion \
 -verbose:gc \
 -verbose:module \
 -Xdiag \
 -Xlog:codecache,gc*,safepoint:file=/opt/mavendb/log/jvmunified.log:level,tags,time,uptime,pid:filesize=209715200,filecount=10 \
 -XshowSettings:all \
 -XX:+UnlockDiagnosticVMOptions \
 -XX:NativeMemoryTracking=summary \
 -XX:+ExtensiveErrorReports \
 -XX:+HeapDumpOnOutOfMemoryError \
 -XX:+PerfDataSaveToFile \
 -XX:+PrintClassHistogram \
 -XX:+PrintCommandLineFlags \
 -XX:+PrintConcurrentLocks \
 -XX:+PrintNMTStatistics \
 -XX:+DebugNonSafepoints \
 -XX:FlightRecorderOptions=repository=/opt/mavendb/log \
 -XX:StartFlightRecording=disk=true,dumponexit=true,filename=/opt/mavendb/log/profile.jfr,name=Profiling,settings=profile \
 -XX:MaxRAMPercentage=85 -server -jar /opt/mavendb/mavendb.jar ${MAVENDB_ARGS}

