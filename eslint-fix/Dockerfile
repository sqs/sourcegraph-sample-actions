FROM node:12-alpine3.10
VOLUME /cache
ENV YARN_CACHE_FOLDER=/cache/yarn
ENV npm_config_cache=/cache/npm
ENV MODULES_FOLDER=/tmp/node_modules
CMD package_json_bkup=$(mktemp) && \
	cp package.json $package_json_bkup; \
	yarn_lockfile_arg=$(test -f yarn.lock && echo '--pure-lockfile' || echo '--no-lockfile'); \
	yarn -s --non-interactive $(yarn_lockfile_arg) --ignore-optional --ignore-scripts --ignore-engines --ignore-platform --no-progress --modules-folder $MODULES_FOLDER && \
	yarn add --no-progress --modules-folder $MODULES_FOLDER eslint --ignore-workspace-root-test --non-interactive --ignore-optional --ignore-scripts --ignore-engines --ignore-platform $(yarn_lockfile_arg) -D @typescript-eslint/parser @typescript-eslint/eslint-plugin && \
	$MODULES_FOLDER/.bin/eslint \
	--fix \
	--plugin $MODULES_FOLDER/@typescript-eslint \
	--parser $MODULES_FOLDER/@typescript-eslint/parser \
	--parser-options '{"ecmaVersion": 8, "sourceType": "module", "project": "tsconfig.json"}' \
	--rule '@typescript-eslint/prefer-optional-chain: 2' \
	--rule '@typescript-eslint/no-unnecessary-type-assertion: 2' \
	--rule '@typescript-eslint/no-unnecessary-type-arguments: 2' \
	--rule '@typescript-eslint/no-unnecessary-condition: 2' \
	--rule '@typescript-eslint/no-unnecessary-type-arguments: 2' \
	--rule '@typescript-eslint/prefer-includes: 2' \
	--rule '@typescript-eslint/prefer-readonly: 2' \
	--rule '@typescript-eslint/prefer-string-starts-ends-with: 2' \
	--rule '@typescript-eslint/prefer-nullish-coalescing: 2' \
	--rule '@typescript-eslint/no-non-null-assertion: 2' \
	'**/*.ts'; \
	mv $package_json_bkup package.json; \
	echo SKIPPED yarn upgrade --latest --ignore-workspace-root-test --non-interactive --ignore-optional --ignore-scripts --ignore-engines --ignore-platform --no-progress --modules-folder $MODULES_FOLDER typescript