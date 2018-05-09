#include "types.h" 
#include "stat.h" 
#include "user.h" 

int
main(int argc, char *argv[]) 
{ 
	char *args[2];
	int id;

	for (int i = 1; i < 999; i ++) {
		printf(0, "");
		args[i-1] = argv[i];
		if (argv[i] == 0) {
			break;
		}
	}
	id = fork();
	if (id == 0) {
		// Child
		setTraceFlag();
		exec(args[0], args);
		exit();
	} else {
		// Parent
		id = wait();
	}
    exit(); 
}