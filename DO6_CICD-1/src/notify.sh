#!/bin/bash

TELEGRAM_BOT_TOKEN="6652655162:AAGpGu5hEYN2QhrnQUOWzSUdGhAllE9KSIM"
TELEGRAM_USER_ID="889851983"

URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"
TEXT="Stage: $1%0AStatus: +$2%0AProject:+$CI_PROJECT_NAME%0AURL:+$CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/%0ABranch:+$CI_COMMIT_REF_SLUG"

curl -s -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null
