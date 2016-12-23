#include "stdio.h"

typedef unsigned long ngx_uint_t;
typedef unsigned char u_char;

#define ngx_hash(key, c)   ((ngx_uint_t) key * 31 + c)

unsigned int ngx_hash_key(const u_char *data, const unsigned int  len, const unsigned int  table_size)
{
    ngx_uint_t  i, key;

    key = 0;

    for (i = 0; i < len; i++) {
        key = ngx_hash(key, data[i]);
    }

    return key%table_size + 1;
}
