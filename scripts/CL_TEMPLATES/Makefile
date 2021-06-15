.PHONY: all clean watch

all: ${PROJECT_NAME}

${PROJECT_NAME}: src/main.lisp
	sbcl --noinform \
		--load ${PROJECT_NAME}.asd \
		--eval "(ql:quickload :${PROJECT_NAME})" \
		--eval "(sb-ext:save-lisp-and-die \"${PROJECT_NAME}\" :executable t :save-runtime-options t :toplevel '${PROJECT_NAME}:main)"

run-tests: ${PROJECT_NAME} test/main-test.lisp
	sbcl --noinform \
	--load ${PROJECT_NAME}.asd \
		--eval "(ql:quickload :${PROJECT_NAME}/test)" \
		--eval "(sb-ext:save-lisp-and-die \"run-tests\" :executable t :save-runtime-options t :toplevel '${PROJECT_NAME}-test:main)"

watch-tests:
	while true; do $(MAKE) -q run-tests || ($(MAKE) run-tests && ./run-tests); sleep 0.5; done

clean:
	rm ${PROJECT_NAME} run-tests

