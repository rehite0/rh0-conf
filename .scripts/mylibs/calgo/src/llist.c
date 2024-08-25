//#include "llist.h"
#include<stdlib.h>
/*todo:
 * generic list
 * meta list
 * double link list
 * link array of pointer of object
 */

/*********************************************************************************************************
 * list data types:
 * dtype	-datatype each node holds
 * sl_node	-single link node
 *
 */
typedef int dtype;
typedef struct sl_node{
	dtype val;
	struct sl_node* nxt;
} sl_node;

/*********************************************************************************************************
 * code for sl_list starts here
 *
 */

void append_sl_list(sl_node** head_ref, dtype val, int (*predicate)(dtype,dtype) )
/**************************************************************************
 * usr expected to FREE all mem after use
 * MODIFY 'head' of list after adding new node with value 'var'
 * 'head' of list is passed by reference ie &head
 * if predicate(i,val)!=0 node 'i-1'->node 'var'-> node 'i'
 * if head == NULL create new head and return its address
 * syntax:append_sl_list(&mylist,)
 */
{ 
	sl_node** tracer=head_ref;
	sl_node* x=malloc(sizeof(sl_node));
	if (x==NULL) {
		write(2,"malloc failed in append_sl_list\n");
		exit(1);
	}//if
	x->nxt=NULL;
	x->val=val;
	while(	(*tracer)	&& 
			(*predicate)( (*tracer)->val,val ) ==0 )
	{	tracer=&((*tracer)->nxt);	}//while
	x->nxt=*tracer;
	*tracer=x;
}//fn

void pprint_sl_list(sl_node** head_ref)
/*print all item in llist *************************/
{
	sl_node** tracer=head_ref;//can take format specifier as input using scanf or parametr
	printf("printing sl_list at:%x",*tracer); 
/	while (*tracer){
		printf("%i-> ",(*tracer)->val);
		tracer=&((*tracer)->val);
	}//while
}//fn

void free_sl_list(sl_node** head_ref)
/*******************************************************
 * free the list
 */
{
	sl_node* old=*head_ref;
	sl_node* nxt=NULL;
	while (old){
		nxt=old->nxt;
		free(old);
		old=nxt;
	}//while
	*head_ref=NULL;
}

//remove_sl_list
//len_sl_list


/*code for predicates start here ****************************************************************/
int lint_asc(long int i,long int val)	{ return( (val>i)?0:1 ); }
int lint_desc(long int i,long int val)	{ return( (val<i)?0:1 ); }
int float_asc(float i,float val)		{ return( (val>i)?0:1 ); }
int string_lex(char* i,char* val);		//{ return( ())}

