#!/bin/bash
WHEREAMI="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
cd $WHEREAMI
TERM="$(cat TERM.CONFIG.TXT)"
$TERM --title "Thomas' Text-quiz System" -e $(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)/text-quiz.sh