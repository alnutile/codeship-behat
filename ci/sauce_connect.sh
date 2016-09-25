#!/bin/sh

chmod +x ci/bin/sc
ci/bin/sc -u ${SAUCE_ACCOUNT_NAME} -k ${SAUCE_ACCOUNT_KEY} --shared-tunnel -i ci &