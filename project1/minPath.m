function minPathGraph = minPath(seedRow,seedCol,curRow,curCol,cGraph)
minPathGraph = cGraph;
nodeMat = LiveWireDP(-1, seedCol, seedRow, cGraph);
endNode = nodeMat(curRow-1,curCol-1);
cur = endNode;
while cur.prevNode ~= 0
    prev = cur.prevNode;
    %current node position in costGraph
    rowC = 3*(cur.row-1)+2;
    colC = 3*(cur.col-1)+2;
    minPathGraph(rowC, colC) = [1,1,0];
    rPrev = prev.row;
    cPrev = prev.col;
    r = cur.row;
    c = cur.col;
    %color the link
    if rPrev == r - 1
        if cPrev == c + 1
            %type = 1;
            minPathGraph(rowC-1, colC+1, 1:3) = [1,1,0];
            minPathGraph(rowC-2, colC+2, 1:3) = [1,1,0];
        elseif cPrev == c
            %type = 2;
            minPathGraph(rowC-1, colC, 1:3) = [1,1,0];
            minPathGraph(rowC-2, colC, 1:3) = [1,1,0];
        else
            %type = 3;
            minPathGraph(rowC-1, colC-1, 1:3) = [1,1,0];
            minPathGraph(rowC-2, colC-2, 1:3) = [1,1,0];
        end
    elseif rPrev == r
        if cPrev == c+1
            %type = 0;
            minPathGraph(rowC, colC+1, 1:3) = [1,1,0];
            minPathGraph(rowC, colC+2, 1:3) = [1,1,0];
            
        else
            %type = 4;
            minPathGraph(rowC, colC-1, 1:3) = [1,1,0];
            minPathGraph(rowC, colC-2, 1:3) = [1,1,0];
            
        end
    else
        if cPrev == c + 1
            %type = 7;
            minPathGraph(rowC+1, colC+1, 1:3) = [1,1,0];
            minPathGraph(rowC+2, colC+2, 1:3) = [1,1,0];
            
        elseif cPrev == c
            %type = 6;
            minPathGraph(rowC+1, colC, 1:3) = [1,1,0];
            minPathGraph(rowC+2, colC, 1:3) = [1,1,0];
            
        else
            %type = 5;
            minPathGraph(rowC+1, colC-1, 1:3) = [1,1,0];
            minPathGraph(rowC+2, colC-2, 1:3) = [1,1,0];
        end
    end
    cur = prev;
end
       