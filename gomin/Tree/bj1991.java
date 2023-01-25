package Tree;

import java.io.*;
import java.util.*;

/*
이진 트리 순회
 - 전위
 - 중위
 - 후위
 */

class Node {
    char charData;
    int intData;
    String strData;

    Node lt, rt;

    public Node(char data, Node lt, Node rt) {
        this.charData = data;
        this.lt = lt;
        this.rt = rt;
    }
    public Node(int data, Node lt, Node rt) {
        this.intData = data;
        this.lt = lt;
        this.rt = rt;
    }
    public Node(String data, Node lt, Node rt) {
        this.strData = data;
        this.lt = lt;
        this.rt = rt;
    }
}

public class bj1991 {
    static Node head = new Node('A', null, null);

//    public void DFS(Node root) {
//        if(root == null) return;
//        else {
//            DFS(root.lt);
//            DFS(root.rt);
//        }
//    }

    // 전위 순회
    public static void preOrder(Node root) {
        if(root == null) return;
        else {
            System.out.printf(root.charData + "");
            preOrder(root.lt);
            preOrder(root.rt);
        }
    }
    // 중위 순회
    public static void inOrder(Node root) {
        if(root == null) return;
        else {
            inOrder(root.lt);
            System.out.printf(root.charData + "");
            inOrder(root.rt);
        }
    }
    // 후위 순회
    public static void postOrder(Node root) {
        if(root == null) return;
        else {
            postOrder(root.lt);
            postOrder(root.rt);
            System.out.printf(root.charData + "");
        }
    }

    public static void insertNode(Node temp, char root, char left, char right) {
        if (temp.charData == root) {
            temp.lt = (left == '.' ? null : new Node(left,null,null));
            temp.rt = (right == '.' ? null : new Node(right,null,null));
        }
        else {
            if(temp.lt != null) insertNode(temp.lt, root, left, right);
            if(temp.rt != null) insertNode(temp.rt, root, left, right);
        }
    }
    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        int N = Integer.parseInt(br.readLine());

        for(int i=0; i<N; i++) {
            st = new StringTokenizer(br.readLine(), " ");
            char p = st.nextToken().charAt(0);
            char lt = st.nextToken().charAt(0);
            char rt = st.nextToken().charAt(0);

            insertNode(head, p, lt, rt);
        }

        preOrder(head);
        System.out.println();
        inOrder(head);
        System.out.println();
        postOrder(head);
    }
}
