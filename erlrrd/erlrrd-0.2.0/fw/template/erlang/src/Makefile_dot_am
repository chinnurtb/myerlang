SUBDIRS =

@FW_PACKAGE_NAME@.app: fw-erl-app-template.app
	@ln -f $< $@

fw-erl-app-template.app: $(wildcard *.erl) $(wildcard *.hrl) Makefile
	@fw-exec template/erlang/make-app-file --top @top_srcdir@

CLEANFILES =			\
  fw-erl-app-template.app	\
  @FW_PACKAGE_NAME@.app

MAINTAINERCLEANFILES = 		\
  Makefile.am			\
  Makefile.in			\
  fw-erl-app-template.app.in

include $(top_srcdir)/Makefile.otp
include $(top_srcdir)/src/Makefile.am.local
