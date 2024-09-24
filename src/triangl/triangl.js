var board=[1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
var sequence =[0, 0, 0, 0, 0, 0, 0, 0 ,0 ,0 ,0 ,0 ,0 ,0];
var a =[1, 2, 4 ,3 ,5 ,6 ,1 ,3 ,6 ,2 ,5 ,4 ,11 ,12 ,13 ,7 ,8 ,4 ,4 ,7 ,11 ,8 ,12 ,13 ,6 ,10 ,15 ,9 ,14 ,13 ,13, 14 ,15 ,9 ,10 ,6 ,6];
var b=[2 ,4 ,7 ,5 ,8 ,9 ,3 ,6 ,10 ,5 ,9 ,8, 12 ,13 ,14 ,8 ,9 ,5 ,2 ,4 ,7 ,5 ,8, 9 ,3 ,6 ,10 ,5 ,9 ,8 ,12 ,13 ,14 ,8 ,9 ,5 ,5];
var c=[4 ,7 ,11 ,8 ,12 ,13 ,6 ,10 ,15 ,9 ,14 ,13 ,13 ,14 ,15 ,9 ,10 ,6 ,1 ,2 ,4 ,3 ,5 ,6 ,1 ,3 ,6 ,2 ,5 ,4 ,11 ,12 ,13 ,7 ,8 ,4 ,4];

var answer=[];

var attempt=function(i , depth){
    if(depth=14){
        answer=sequence.slice(1).concat(answer);
        return true;
    }else if( board[a[i]]==1 && board[b[i]]==1 && board[c[i]]==0){
        board[a[i]]=0;
        board[b[i]]=0;
        board[c[i]]=1;
        var j=0;
        do{
            depth++;
            j++;
        } while(j==36||attempt(j, depth));
        board[a[i]]=1;
        board[b[i]]=1;
        board[c[i]]=0;
        return false;
    }else return false;
};

var test = function(i, depth){
    answer=[];
    attempt(i,depth);
    return answer[0];
};

test (22, 2);
