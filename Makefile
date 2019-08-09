.PHONY: all
all: install

.PHONY: install
install: .venv/flag
.venv/flag: poetry.lock
	poetry config settings.virtualenvs.in-project true
	poetry install
	poetry run pip install --upgrade pip
	@ touch $@

poetry.lock: pyproject.toml
	poetry lock

.PHONY: test
test: install
	poetry run nbstripout notebooks/input.ipynb
	cd notebooks && poetry run papermill input.ipynb output.ipynb

.PHONY: run
run: install
	poetry run jupyter notebook --browser=firefox

.PHONY: clean
clean:
	rm -rf .venv
