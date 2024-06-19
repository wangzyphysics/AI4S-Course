.PHONY: all init test lint format clean

init:
	git config core.hooksPath .git/hooks/
	git config --unset-all core.hooksPath
	cp .githooks/* .git/hooks/
	pre-commit install

lint:
	python -m mypy                          calypso tests
	python -m black -S              --check calypso tests
	python -m isort --profile black --check calypso tests

format:
	python -m black -S              calypso tests docs
	python -m isort --profile black calypso tests docs


