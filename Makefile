# Command to clean the last generation public folder
clean:
	@if [ -d "./public" ]; then \
		echo "Clean up..."; \
		rm -rf ./public; \
	else \
		echo "The environment is clean."; \
	fi

# Command to clean the last generation and make a new one
build: clean
	@echo "Build..."
	@if which hugo > /dev/null; then \
		hugo; \
	else \
		~/go/bin/hugo; \
	fi
	@echo "Build done."

# Command to run the local server
run:
	@echo "Running..."
	@if which hugo > /dev/null; then \
		hugo server -D; \
	else \
		~/go/bin/hugo server -D; \
	fi