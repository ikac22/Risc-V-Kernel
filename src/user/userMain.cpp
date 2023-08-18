//#include "test/Threads_C_API_test.hpp" // C API and synchronous context switch tests
//#include "test/Threads_CPP_API_test.hpp" // CPP API and synchronous context switch tests
//#include "test/ConsumerProducer_C_API_test.h" // complete C API with semaphores and synchronous context switch tests
//#include "test/ConsumerProducer_CPP_Sync_API_test.hpp" // complete CPP API with semaphores and synchronous context switch tests
//#include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
#include "test/ConsumerProducer_CPP_API_test.hpp" // CPP API with asynchronous context switch tests, complete test of everything

//#include"test/testing.hpp"
//#include"../../h/syscall_c.h"
//#include"test/printing.hpp"



void userMain() {
    //Threads_C_API_test(); // zadatak 2., niti C API i sinhrona promena konteksta
    //Threads_CPP_API_test(); // zadatak 2., niti CPP API i sinhrona promena konteksta
    //producerConsumer_C_API(); // zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta
    //producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta
    //testSleeping(); // thread_sleep test C API
    ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega
    //testPeriodicWorker();
    //printString("User thread eo ga\n");
    //mem_alloc(64);
    //asm volatile("csrw sstatus, 0");
    
}

void userMainWrapper(void*)
{
    userMain();
}
