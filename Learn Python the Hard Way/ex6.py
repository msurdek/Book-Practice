#create variables to form a programming joke
x = "There are %d types of people." % 10
binary = "binary"
do_not = "don't"
y = "Those who know %s and those who %s." % (binary, do_not)

#print the joke
print(x)
print(y)

#repeat the joke
print("I said: %r." % x)
print("I also said: '%s'." % y)

#create new variables for feedback
hilarious = False
joke_evaluation = "Isn't that joke so funny?! %r"

#print feedback
print(joke_evaluation % hilarious)

#another joke
w = "This is the left side of..."
e = "a string with a right side"
print(w + e)