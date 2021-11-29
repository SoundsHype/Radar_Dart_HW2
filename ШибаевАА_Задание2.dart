import 'dart:math';
import 'dart:io';

double func(double x){
	return (5*pow(x,3) - 3*x)/2;
}

double integtrap(double left, double right, var N){
	double sum = 0;
	double h = (right - left)/N;
	for (double i = left + h; i < right - h/2; i += h)
		sum += func(double.parse(i.toStringAsFixed(3)));
	return h*((func(left)+func(right))/2+sum);
}

void main(){
	List<double> variantN = [10, 50, 100, 500, 1000, 5000, 10000];
	double left = 0, right = 10;
	String fileName = "result.txt";
	File myFile = new File(fileName);
	myFile.writeAsStringSync("");

	variantN.forEach((N){
		myFile.writeAsStringSync("${integtrap(left, right, N)}\n", mode: FileMode.APPEND);
	});
}
