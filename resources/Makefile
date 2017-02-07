
OBJECTS = virtual-cluster-sample layers-hadoop-sample

all: $(OBJECTS)

$(OBJECTS):
	python ../evegenie/geneve.py $@.json
	sed '/eve/q'  $@.settings.py | fgrep -v "eve_" > $@-type.json

