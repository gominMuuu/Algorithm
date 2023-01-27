package Tree;

import java.io.*;
import java.util.*;

public class bj2250 {
    public static int size;
    public static int root;
    public static int maxLevel, nodeIdx;

    public static NodeWithParent[] tree;

    public static int[] levelLeft;
    public static int[] levelRight;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = null;

        size = Integer.parseInt(br.readLine());

        tree = new NodeWithParent[size+1];
        levelLeft = new int[size+1];
        levelRight = new int[size+1];

        // 초기화
        for(int i=0; i <= size; i++) {
            tree[i] = new NodeWithParent(i, -1, -1, -1);
            levelLeft[i] = size+1;
        }


        //입력받기
        for(int i=1; i <= size; i++) {
            st = new StringTokenizer(br.readLine());

            int num = Integer.parseInt(st.nextToken());
            int leftNum = Integer.parseInt(st.nextToken());
            int rightNum = Integer.parseInt(st.nextToken());

            tree[num].left = leftNum;
            tree[num].right = rightNum;

            if(leftNum != -1)
                tree[leftNum].parent = num;

            if(rightNum != -1)
                tree[rightNum].parent = num;
        }

        // 루트 찾기
        for(int i=1; i <= size; i++)
            if(tree[i].parent == -1) root = i;

        nodeIdx = 1;
        dfs(root, 1);

        int res = 1;
        int subs = levelRight[1] - levelLeft[1] + 1;

        for(int i=2; i <= maxLevel; i++) {
            int tmpSubs = levelRight[i] - levelLeft[i] +1;

            if(subs < tmpSubs) {
                res = i;
                subs = tmpSubs;
            }
        }

        System.out.println(res + " " + subs);
    }

    public static void dfs(int num, int level) {
        NodeWithParent node = tree[num];

        if(maxLevel < level) maxLevel = level;

        if(node.left != -1) {
            dfs(node.left, level+1);
        }

        levelLeft[level] = Math.min(levelLeft[level], nodeIdx);
        levelRight[level] = nodeIdx++;

        if(node.right != -1) {
            dfs(node.right, level+1);
        }
    }
}

class NodeWithParent{
    int num;
    int left;
    int right;
    int parent;
    int point;

    public NodeWithParent(int num, int left, int right, int parent) {
        this.num = num;
        this.left = left;
        this.right = right;
        this.parent = parent;
        this.point = 1;
    }
}
