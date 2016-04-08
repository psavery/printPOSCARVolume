PROGRAM = printVolume
PROGSRC = main.F90 volume.F90 datatypes.F90

COMPILER = gfortran
FFLAGS  =
OBJECTS = $(PROGSRC:%.F90=%.o)

$(PROGRAM): $(OBJECTS)
	$(COMPILER) $(FFLAGS) $^ -o $@

%.o : %.F90
	$(COMPILER) $(FFLAGS) -c $<

clean:
	rm -f $(PROGRAM) *.o
