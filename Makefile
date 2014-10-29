CPP         = g++

.PHONY : clean

OBJECTS = $(patsubst %.cpp, %.o,$(wildcard *.cpp))

libdependency.a: $(OBJECTS)
	ar -rsc $@ $(OBJECTS)

$(OBJECTS): %.o: %.cpp *.hpp
	$(CPP) -c $(CPPFLAGS) $< -o $@
	-@echo
clean:
	-@rm -f *.o *~ libdependency.a
