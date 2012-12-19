#!/bin/sh
# made by BME2 TEAM

# Project Path to Web-inf folder (with no trailing /)
TARGET="/home/nikotsunami2/git10/bme2/target";
BASE="$TARGET/bme-0.1.0.BUILD-SNAPSHOT/WEB-INF";


#----------------------------
# don't have to edit below - unless you have more Application Request Factories

OUTPUT="$TARGET/generated-sources/gwt";
if [ ! -d "$DIRECTORY" ]; then
    # Control will enter here if $DIRECTORY doesn't exist.
  mkdir -p "$OUTPUT";
fi

CP="";
CP="$CP$BASE/classes:";
CP="$CP$BASE/lib/*:"; # '*' will only work with java 1.6+

# these need to be in there
#CP="$CP$BASE/lib/requestfactory-apt.jar:";
#CP="$CP$BASE/lib/requestfactory-server+src.jar:";

echo "DEBUG ClassPath: $CP";

java -cp $CP com.google.web.bindery.requestfactory.apt.ValidationTool $OUTPUT \
  medizin.client.a_nonroo.app.request.McAppRequestFactory \
  medizin.client.managed.request.ApplicationRequestFactory \
  medizin.shared.scaffold.ScaffoldRequestFactory
  # Do you need more Request Factories???
  

# the end
exit;
