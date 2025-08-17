.PHONY: compile rule support_line_continuation
# No comment, no help
compile:

rule:  ## some rule

support_line_continuation: \
	like \
	this \
	## it support line continuation

.DEFAULT_GOAL = help
.PHONY: help
help:
	@./help.awk $(MAKEFILE_LIST)

.PHONY: minify
minify: makefile.in  ## create minified version for reusing elsewhere
makefile.in:
	@echo '.DEFAULT_GOAL = help' > $@
	@echo '.PHONY: help' >> $@
	@echo 'help:  ## print this help message' >> $@
	@printf '\t%s' '@awk '\''$(shell ./minify_awk.sh help.awk)'\'' $$(MAKEFILE_LIST)' >> $@
