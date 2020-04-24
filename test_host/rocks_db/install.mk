FULLVERSION=6.8.0
VERSION=6
LIBRARY=rocksdb
INCLUDES=include/rocksdb

SRCDIR?=.
BUILDDIR?=$(SRCDIR)

install:
	install -D -m 644 $(BUILDDIR)/lib$(LIBRARY).so.$(FULLVERSION) \
		$(DESTDIR)/usr/lib/lib$(LIBRARY).so.$(FULLVERSION)
	cd $(DESTDIR)/usr/lib/; ln -fs lib$(LIBRARY).so.$(FULLVERSION) lib$(LIBRARY).so; ln -fs lib$(LIBRARY).so.$(FULLVERSION) lib$(LIBRARY).so.$(VERSION)
	cp -r $(SRCDIR)/include/rocksdb $(DESTDIR)/usr/include

rdb_del: $(SRCDIR)/examples/rdb_del.o
	$(CC) -o $@ $< -l$(LIBRARY)

rdb_cre: $(SRCDIR)/examples/rdb_cre.o
	$(CC) -o $@ $< -l$(LIBRARY)

rdb_insert: $(SRCDIR)/examples/rdb_insert.o
	$(CC) -o $@ $< -l$(LIBRARY)

rdb_insertn: $(SRCDIR)/examples/rdb_insertn.o
		$(CC+) -o $@ $< -l$(LIBRARY)

rdb_get: $(SRCDIR)/examples/rdb_get.o
	$(CC) -o $@ $< -l$(LIBRARY)

c_simple_example: $(SRCDIR)/examples/c_simple_example.o
		$(CC) -o $@ $< -l$(LIBRARY)

rdb_global_test: $(SRCDIR)/examples/c_simple_example.o
		$(CC) -o $@ $< -l$(LIBRARY)

rdb_test_cpp: $(SRCDIR)/examples/simple_example.cc
	  $(CXX) -o $@ $< -l$(LIBRARY)

transaction_example_cpp: $(SRCDIR)/examples/simple_example.cc
	  $(CXX) -o $@ $< -l$(LIBRARY)
