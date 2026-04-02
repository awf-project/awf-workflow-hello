.PHONY: pack install install-global clean validate

PACK_NAME := hello
VERSION := 1.0.1
ARCHIVE := awf-workflow-$(PACK_NAME)_$(VERSION).tar.gz
LOCAL_DIR := .awf/workflow-packs/$(PACK_NAME)
GLOBAL_DIR := $(HOME)/.local/share/awf/workflow-packs/$(PACK_NAME)

pack:
	tar czf $(ARCHIVE) manifest.yaml workflows/ prompts/ scripts/
	sha256sum $(ARCHIVE) | sed 's|  .*$$|  $(ARCHIVE)|' > checksums.txt

install:
	@mkdir -p $(LOCAL_DIR)
	cp -r manifest.yaml workflows prompts scripts $(LOCAL_DIR)/
	@echo "Installed to $(LOCAL_DIR)"

install-global:
	@mkdir -p $(GLOBAL_DIR)
	cp -r manifest.yaml workflows prompts scripts $(GLOBAL_DIR)/
	@echo "Installed to $(GLOBAL_DIR)"

validate:
	@grep -q '^name: $(PACK_NAME)$$' manifest.yaml
	@test -f workflows/hello.yaml
	@test -f workflows/greet.yaml
	@echo "OK"

clean:
	rm -f awf-workflow-*.tar.gz checksums.txt
