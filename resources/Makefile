
OBJECTS = virtual-cluster-sample

all: $(OBJECTS)

$(OBJECTS):
	python ../evegenie/geneve.py $@.json
	sed '/eve/q'  $@.settings.py | fgrep -v "eve_" > $@-type.json

