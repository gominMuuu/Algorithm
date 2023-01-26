package Tree;

import java.io.*;
import java.util.*;

public class bj5639 {
    static Node root;

    // 후위 순회 출력
    public static void DFS(Node node) {
        if(node == null) return;
        else {
            DFS(node.lt);
            DFS(node.rt);
            System.out.println(node.intData);
        }
    }

    // 전위 순회 값을 토대로 왼쪽 노드엔 작은 값, 오른쪽 노드엔 큰 값을 넣는다.
    public static void insertNode(int n, Node node) {
        if(n < node.intData) {
            if(node.lt == null)
                node.lt = new Node(n, null, null);
            else
                insertNode(n, node.lt);
        } else {
            if(node.rt == null)
                node.rt = new Node(n, null, null);
            else
                insertNode(n, node.rt);
        }
    }

    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        root = new Node(Integer.parseInt(br.readLine()), null, null);

        while (true) {
            String input = br.readLine();
            if(input.equals("") || input == null)
                break;

            insertNode(Integer.parseInt(input), root);
        }

        DFS(root);
    }
}
