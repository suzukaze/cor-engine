#ifndef ____COR_SYSTEM_SOURCES_ALLOCATION_MONITOR_H_
#define ____COR_SYSTEM_SOURCES_ALLOCATION_MONITOR_H_

#include "cor_type/sources/basic_types.h"

namespace cor
{
    namespace system
    {
        struct AllocationMonitorItnl;
    
        class AllocationMonitor;
        typedef AllocationMonitor* PAllocationMonitor;

        class AllocationMonitor
        {
            std::unique_ptr<AllocationMonitorItnl> itnl;
        
            static PAllocationMonitor& ref_instance_pointer();
        public:
        
            AllocationMonitor();
            virtual ~AllocationMonitor();

            RSize get_new_count();
            RSize get_delete_count();
            RSize get_alloc_count();
            RSize get_alloc_size();
            RString get_status_text();

            static PAllocationMonitor get_instance();

            static void* alloc(size_t n);
            static void free(void* p);
            static void* realloc(void* p, size_t n);

        };
    }
}

//#ifdef COR_CUSTOM_NEW_OPERATOR
//void* operator new(size_t n) throw(std::bad_alloc);
//void operator delete(void* p) throw();
//void* operator new[](size_t n) throw(std::bad_alloc);
//void operator delete[](void* p) throw();
//#endif

#endif
