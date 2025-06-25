.DEFAULT_GOAL = help

compile:

rule:  ## some rule

support_line_continuation: \
	like \
	this \
	## it support line continuation

help:
	@./help.awk $(MAKEFILE_LIST)
minify: makefile.in  ## create minified version for reusing elsewhere
makefile.in:
	@echo '.DEFAULT_GOAL = help' > $@
	@echo 'help:  ## print this help message' >> $@
	@printf '\t%s' '@awk '\''$(shell ./minify_awk.sh help.awk)'\'' $$(MAKEFILE_LIST)' >> $@
