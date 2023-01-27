package Tree;

import java.io.*;
import java.util.*;

public class bj9934 {
    static Node root;

    public static void insertNode(int[] iA, Node node) {
        if(iA.length == 0) return;

        int[] ltA = Arrays.copyOfRange(iA, 0, iA.length / 2);
        int[] rtA = Arrays.copyOfRange(iA, iA.length / 2 + 1, iA.length);
        if(ltA.length == 0 || rtA.length == 0) return;

        if(node == root) {
            node.lt = new Node(ltA[ltA.length/2], null, null);
            node.rt = new Node(rtA[rtA.length/2], null, null);
            insertNode(ltA, node.lt);
            insertNode(rtA, node.rt);
        } else {
            if(node.lt != null) insertNode(ltA, node.lt);
            else node.lt = new Node(ltA[ltA.length/2], null, null);
            if(node.rt != null) insertNode(rtA, node.rt);
            else node.rt = new Node(rtA[rtA.length/2], null, null);
        }
    }

    //레벨 순회한 결과 출력
    public static void levelOrder(int k, Node root) {
        Queue<Node> queue = new LinkedList<>();
        queue.offer(root);

        int tmp = 0, floor = 1;
        while(!queue.isEmpty()) {
            Node node = queue.poll();
            System.out.print(node.intData + " ");
            tmp++;

            if(node.lt != null) queue.offer(node.lt); // 왼쪽 자식 노드가 있다면 추가
            if(node.rt != null) queue.offer(node.rt); // 오른쪽 자식 노드가 있다면 추가

            if(tmp == 1 && floor == 1) {
                System.out.println();
                tmp = 0;
                floor++;
            } else if(tmp == Math.pow(2, floor - 1)) {
                System.out.println();
                tmp = 0;
                floor++;
            }

        }
    }

    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int k = Integer.parseInt(br.readLine());

        String[] nodeStrArray = br.readLine().split(" ");
        int[] nodeArray = new int[nodeStrArray.length];
        for(int i=0; i< nodeStrArray.length; i++)
            nodeArray[i] = Integer.parseInt(nodeStrArray[i]);

        root = new Node(nodeArray[nodeArray.length / 2], null, null);

        insertNode(nodeArray, root);
        levelOrder(k, root);

    }
}