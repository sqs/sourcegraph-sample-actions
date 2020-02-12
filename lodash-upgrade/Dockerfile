FROM node:12-alpine3.10
VOLUME /cache
ENV YARN_CACHE_FOLDER=/cache/yarn
ENV npm_config_cache=/cache/npm
CMD yarn upgrade --latest --ignore-workspace-root-test --non-interactive --ignore-optional --ignore-scripts --ignore-engines --ignore-platform --no-progress lodash && \
	rm -rf node_modules