.PHONY: all
all: install

.PHONY: install
install:
	poetry run pip install --upgrade pip
	poetry install

.PHONY: run
run: install
	poetry run jupyter notebook
