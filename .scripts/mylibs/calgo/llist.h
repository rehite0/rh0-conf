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
#ifndef HEAP_TYPE
typedef int dtype;
typedef struct sl_node{
	dtype val;
	struct sl_node* nxt;
} sl_node;

/*********************************************************************************************************
 * code for sl_list starts here
 *
 */

void insert_sl_list_ref(sl_node** head_ref, dtype val, int (*predicate)(dtype,dtype) );
void pprint_sl_list(sl_node* head);
void free_sl_list_ref(sl_node** head_ref);
void rem_sl_list_ref_val(sl_node** head_ref,dtype val);
void rem_sl_list_ref_idx(sl_node** head_ref,dtype idx);
void map_sl_list(sl_node* head,void (*fn)(sl_node*));
int len_sl_list(sl_node* head);
sl_node* index_sl_list(sl_list* head,int idx);
sl_node* pop_sl_list_ref(sl_node** head_ref);

void insert_sl_list_ref(sl_node** head_ref, dtype val, int (*predicate)(dtype,dtype) )
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
	while(	(*tracer)	&& ( predicate == NULL	||	(*predicate)( (*tracer)->val,val ) ==0 
						   )
		 )
	{	tracer=&((*tracer)->nxt);	}//while
	x->nxt=*tracer;
	*tracer=x;
}//fn

void pprint_sl_list(sl_node* head)
/*print all item in llist *************************/
{
	sl_node** tracer=&head;//can take format specifier as input using scanf or parametr
	printf("printing sl_list at:%x",*tracer); 
	while (*tracer){
		printf("%i-> ",(*tracer)->val);
		tracer=&((*tracer)->val);
	}//while
}//fn

void free_sl_list_ref(sl_node** head_ref)
// free the list
{
	sl_node* old=*head_ref;
	sl_node* nxt=NULL;
	while (old){
		nxt=old->nxt;
		free(old);
		old=nxt;
	}//while
	*head_ref=NULL;
}//fn

void rem_sl_list_ref_val(sl_node** head_ref,dtype val)
//remove element with value 'var' and ignore if not found
{
	sl_node** target=head_ref;
	sl_node* rem=NULL;
	while( *target && (*target)->val != val )
		target=&(*target)->nxt;
	rem=*target;
	*target=rem->nxt;
	free(rem);
}//fn

void rem_sl_list_ref_idx(sl_node** head_ref,dtype idx)
//remove the element at index 'idx' and assert if idx does not exit
{
	assert(idx>=0 && "index cant be negative");
	sl_node** target=head_ref;
	sl_node* rem=NULL;
	int c=-1;
	while( *target && c!=idx )
	{	target=&(*target)->nxt; c++; }
	rem=*target;
	assert(rem && "index out of bound");
	*target=rem->nxt;
	free(rem);
}//fn

void map_sl_list(sl_node* head,void (*fn)(sl_node*))
//run 'fn' on each node
{
	assert(fn && "null function pointer given")
	while(head){
		(*fn)(head);
		head=head->nxt;
	}//while
}//fn

int len_sl_list(sl_node* head)
//return len of link list
{
	int len=0;
	while(head){
		head=head->nxt;
		len++
	}//while
}//fn

sl_node* index_sl_list(sl_list* head,int idx)
//return node at index 'idx'
{
	assert(idx>=0 && "index cant be negative");
	int c=-1;
	while(head && c<idx){
		head=head->nxt;
		c++;
	}//while
	return (c!=-1)? head:NULL;
}//fn

sl_node* pop_sl_list_ref(sl_node** head_ref)
//pop last element and return it
{
	assert(*head_ref && "list empty cant do pop operation");
	sl_node** target=head_ref;
	while((*target)->nxt){
		target=&(*target)->nxt;
	}//while
	free(*target);
	*target=NULL;
}//fn

/*code for predicates start here ****************************************************************/
int lint_asc(long int i,long int val)	{ return( (val>i)?0:1 ); }
int lint_desc(long int i,long int val)	{ return( (val<i)?0:1 ); }
int float_asc(float i,float val)		{ return( (val>i)?0:1 ); }
int string_lex(char* i,char* val)		{
	while (*i && *var){
		if (*i == *var){i++;var++;continue; }
		return (*i>*var)?1:0;
	}//while
	return (*i)?1:0;
}//fn

