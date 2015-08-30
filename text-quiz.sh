#!/bin/bash
WHEREAMI="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
cd $WHEREAMI
echo "---------------------------------------------------------"
echo "|Thomas' Text-quiz System                               |"
echo "|v 1.0 beta                                             |"
echo "---------------------------------------------------------"
echo ""
echo "these quiz files were found:"
$WHEREAMI/quiz/quizsearch.sh
echo ""
WHEREAMI="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
cd $WHEREAMI
echo "enter name of valid .quiz file"
echo "only type .quiz files found above"
echo "quiz files should be in quiz directory in the script's directory"
read FNAME1
echo ""
QUIZNAME=$(sed '1q;d' $WHEREAMI/quiz/$FNAME1)
echo $QUIZNAME
QUIZAUTH=$(sed '2q;d' $WHEREAMI/quiz/$FNAME1)
echo $QUIZAUTH
echo ""
echo "now building quiz, please wait..."
echo "3" > qcount.txt
echo "0" > score.txt
echo "0" > scoreof.txt
SCOREOF=$(cat $WHEREAMI/scoreof.txt)
SCORE=$(cat $WHEREAMI/score.txt)
QCOUNT=$(cat $WHEREAMI/qcount.txt)
until [ "$QUIZDONE" = "1" ]
do
  echo ""
  AWNSER=NONE
  if [ "$(sed ''$QCOUNT'q;d' $WHEREAMI/quiz/$FNAME1)" = "DONE" ]; then
    QUIZDONE=1
  else
    echo "$SCOREOF+1" | bc > scoreof.txt
    SCOREOF=$(cat $WHEREAMI/scoreof.txt)
    echo "$(sed ''$QCOUNT'q;d' $WHEREAMI/quiz/$FNAME1)"
    echo "$QCOUNT+1" | bc > qcount.txt
    QCOUNT=$(cat $WHEREAMI/qcount.txt)
    echo "$(sed ''$QCOUNT'q;d' $WHEREAMI/quiz/$FNAME1)"
    echo "$QCOUNT+1" | bc > qcount.txt
    QCOUNT=$(cat $WHEREAMI/qcount.txt)
    echo "$(sed ''$QCOUNT'q;d' $WHEREAMI/quiz/$FNAME1)"
    echo "$QCOUNT+1" | bc > qcount.txt
    QCOUNT=$(cat $WHEREAMI/qcount.txt)
    echo "$(sed ''$QCOUNT'q;d' $WHEREAMI/quiz/$FNAME1)"
    echo "$QCOUNT+1" | bc > qcount.txt
    QCOUNT=$(cat $WHEREAMI/qcount.txt)
    echo "$(sed ''$QCOUNT'q;d' $WHEREAMI/quiz/$FNAME1)"
    echo "$QCOUNT+1" | bc > qcount.txt
    QCOUNT=$(cat $WHEREAMI/qcount.txt)
    read AWNSER
    if [ "$AWNSER" = "$(sed ''$QCOUNT'q;d' $WHEREAMI/quiz/$FNAME1)" ]; then
      echo "$AWNSER is correct"
      echo "$SCORE+1" | bc > score.txt
      SCORE=$(cat $WHEREAMI/score.txt)
      echo "$QCOUNT+1" | bc > qcount.txt
      QCOUNT=$(cat $WHEREAMI/qcount.txt)
    else
      echo "$AWNSER is incorrect the Awnser was $(sed ''$QCOUNT'q;d' $WHEREAMI/quiz/$FNAME1)"
      echo "$QCOUNT+1" | bc > qcount.txt
      QCOUNT=$(cat $WHEREAMI/qcount.txt)
    fi
  fi
done

echo "final score: $SCORE of $SCOREOF"
echo "press enter to exit"
read exittellx
