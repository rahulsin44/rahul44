#include <stdio.h>
int main() {
char operation;
double num1, num2;
printf("Enter an operator (+, -, *, /): ");
scanf("%c", &operation);
printf("Enter two numbers: ");
scanf("%lf %lf", &num1, &num2);
if (operation == '+') {
printf("Result: %.2lf\n", num1 + num2);
} else if (operation == '-') {
printf("Result: %.2lf\n", num1 - num2);
} else if (operation == '*') {
printf("Result: %.2lf\n", num1 * num2);
} else if (operation == '/') {
if (num2 != 0) {
printf("Result: %.2lf\n", num1 / num2);
} else {
printf("Error! Division by zero.\n");
}
} else {
printf("Invalid operator.\n");
}
return 0;
}
