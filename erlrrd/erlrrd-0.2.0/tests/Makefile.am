SUBDIRS =

CLEANFILES = 			\
  .flass			\
  $(wildcard module-*) 		\
  $(wildcard *.test.out) 	\
  $(wildcard *.COVER.out)

MAINTAINERCLEANFILES = 		\
  Makefile.am			\
  Makefile.in			\
  otp-test-wrapper.sh

TESTS_ENVIRONMENT = ./otp-test-wrapper.sh

EXTRA_DIST = otp-test-wrapper.sh

module-%: 
	@touch $@

include $(top_srcdir)/Makefile.otp
include $(top_srcdir)/tests/Makefile.am.local
