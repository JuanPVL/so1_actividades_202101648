#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>

// Variables para contar procesos y hilos
int num_procesos = 0;
int num_hilos = 0;

void *thread_function(void *arg) {
    // Función de hilo
    printf("Hilo creado\n");
    num_hilos++;
    pthread_exit(NULL);
}

int main() {
    pid_t pid;

    // Contar el proceso principal
    num_procesos++;

    pid = fork();
    if (pid == 0) {
        // Este bloque se ejecuta en el proceso hijo
        fork();
        num_procesos++;

        // Crear un hilo en el proceso hijo
        pthread_t thread;
        pthread_create(&thread, NULL, thread_function, NULL);
    }

    // Ambos procesos (padre e hijo) ejecutarán el siguiente bloque
    fork();
    num_procesos++;

    // Imprimir el número total de procesos y hilos
    printf("Procesos creados: %d\n", num_procesos);
    printf("Hilos creados: %d\n", num_hilos);

    return 0;
}
