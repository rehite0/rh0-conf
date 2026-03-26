

#define bin_exp(r,a,b)				\
do{						\
	typeof(a) _x=(a);typeof(b) _y=(b);	\
	r=1;					\
	while(_y){				\
		if(_y&1) r*=_x;			\
		_x*=_x;				\
		_y>>=1;				\
	}					\
}while(0)

