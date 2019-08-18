//
//  ViewController.m
//  ListQueue
//
//  Created by lizizhen on 2019/8/17.
//  Copyright © 2019 lizi' zhen. All rights reserved.
//

#import "ViewController.h"

typedef struct Queue {
    int *pBase;
    int front;
    int rear;
}QUEUE, *PQUEUE;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    QUEUE Q;
    initQueue(&Q);
    en_queue(&Q, 1);
    en_queue(&Q, 2);
    en_queue(&Q, 3);
    en_queue(&Q, 4);
    en_queue(&Q, 5);
    en_queue(&Q, 6);
    
    reaverse_queue(&Q);
    
    int val;
    out_queue(&Q, &val);
    printf("出队的元素是 %d\n", val);
    reaverse_queue(&Q);
}

// 初始化一个队列，默认元素个数为6
void initQueue(PQUEUE pQ) {
    pQ->pBase = (int *)malloc(sizeof(int) * 6);
    pQ->front = pQ->rear = 0;
    return;
}

// 入队
bool en_queue(PQUEUE pQ, int val) {
    
    if (full_queue(pQ)) return false; // 队列满了就放不进去了，入队失败，返回false
    
    pQ->pBase[pQ->rear] = val;
    pQ->rear = (pQ->rear+1) % 6; // 6代表这个队列的长度
    
    return true;
}

// 出队
bool out_queue(PQUEUE pQ, int *pVal) {
    
    if (empty_queue(pQ)) return false;
    
    *pVal = pQ->pBase[pQ->front];
    pQ->front = (pQ->front + 1) % 6;
    
    return true;
}

// 是否为空
bool empty_queue(PQUEUE pQ) {
    
    if (pQ->front == pQ->rear) return true;
    
    return false;
}

// 遍历队列
void reaverse_queue(PQUEUE pQ) {
    int i = pQ->front;
    
    while (i != pQ->rear) {
        printf("%d ", pQ->pBase[i]);
        i = (i + 1) % 6;
    }
    printf("\n");
    return;
}

// 判断队列是否满了
bool full_queue(PQUEUE pQ) {
    if ((pQ->rear + 1) % 6 == pQ->front) {
        printf("队列已满!\n");
        return true;
    }
    return false;
}

@end
