CPP         = g++

.PHONY : clean

OBJECTS = $(patsubst %.cpp, %.o,$(wildcard *.cpp))

libdependency.so: $(OBJECTS)
	$(CPP) -shared $(OBJECTS) -o $@

$(OBJECTS): %.o: %.cpp *.hpp
	$(CPP) -c $(CPPFLAGS) $< -o $@
	-@echo
clean:
	-@rm -f *.o *~ libdependency.so
