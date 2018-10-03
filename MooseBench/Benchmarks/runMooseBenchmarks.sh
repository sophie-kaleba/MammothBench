#!/bin/bash

#unzipping workloads
for PROJECT in lucene wildfly netbeans spring
do
if [ ! -f ../WorkLoads/$PROJECT.mse ]; then
	echo "unzipping $PROJECT..."
    unzip ../WorkLoads/$PROJECT.zip -d ../WorkLoads
	echo "OK"
fi
done

#getting Pharo 61
echo "loading Pharo..."
wget -O- get.pharo.org/64/61+vm | bash
echo "OK"

#Loading Moose 
echo "loading Moose..."
./pharo Pharo.image eval "Metacello new
    smalltalkhubUser: 'Moose' project: 'Moose';
    configuration: 'Moose';
    version: #development;
    load.
	Smalltalk snapshot: true andQuit: true."
echo "OK"

#loading bench scripts
echo "loading Bench scripts..."
./pharo Pharo.image CogTools-GCBenchGenerator.st 
./pharo Pharo.image eval "GCBenchEvaluator compileAll. GCBenchConfigurator compileAll. GCBenchEvaluatorV2 compileAll. GCMooseBench compileAll. Smalltalk snapshot: true andQuit: true."
echo "OK"

#running bench
for PROJECT in lucene wildfly spring
do
echo "running Bench $PROJECT..."
./pharo Pharo.image eval "GCBenchEvaluator runReference: #$PROJECT."
echo "OK"
done

echo "skipped netbeans (32Gb RAM required, disabled by default)"

echo "There should be bench res files around by now :-)"
