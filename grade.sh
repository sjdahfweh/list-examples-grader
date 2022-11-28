# Create your grading script here
set -e

rm -rf student-submission
JU=".:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar"
git clone $1 student-submission

cp TestListExamples.java student-submission
cd student-submission


if [[ -e ListExamples.java ]]
then
echo "ListExamples.java does exist!"
else
echo "ListExamples.java does not exist!"
exit 1
fi

javac -cp $JU *.java
java -cp $JU org.junit.runner.JUnitCore TestListExamples > result.txt

if [[ $? -eq 0 ]]
then 
grep "file compile successfully and all correct" result.txt
exit 0
else
grep "Something is wrong:" result.txt
exit 1
fi
