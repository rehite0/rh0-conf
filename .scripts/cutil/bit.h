#define get_arr(a,n) ( a[ n/(8*sizeof(unsigned int)) ] & ( 1u<<( n%(8*sizeof(unsigned int)) ) ) )
#define set_arr(a,n) ( a[ n/(8*sizeof(unsigned int)) ] |= ( 1u<<( n%(8*sizeof(unsigned int)) ) ) )

#define is_pow2(v) ( (v) && !((v)-1) )

#define get(m,i)	( (m) & ( 1u<<(i) ) )
#define on(m,i)		( m |= 1u<<(i) )
#define off(m,i)	( m &= ~(1u<<(i)) )
#define toggle(m,i)	( m ^= 1u<<(i) )


// int __builtin_popcount (unsigned int)
// int __builtin_clz (unsigned int x)
// int __builtin_ctz (unsigned int x)
// int __builtin_ffs (int x)
// ll version also exist
//
// m & (m-1)	//turn of lsb  bit
// i=m;while(i) i=(i-1)&m;	iterate over all subset of m
//
