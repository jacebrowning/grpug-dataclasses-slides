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

.PHONY: run
run: install
	poetry run jupyter notebook --browser=firefox

.PHONY: clean
clean:
	rm -rf .venv
