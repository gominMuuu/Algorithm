package Implementation;

import java.io.*;
import java.util.*;
import java.util.Map.Entry;


public class bj22860 {
    static int N, M, Q, K;
    static HashMap<String, ArrayList<String>> hm = new HashMap<>();
    static HashMap<String, HashSet<String>> info = new HashMap<>();
    static StringBuilder sb = new StringBuilder();
    static HashMap<String, Integer> result = new HashMap<>();

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        info.put("main", new HashSet<>());
        N = stoi(st.nextToken());
        M = stoi(st.nextToken());
        for (int i = 0; i < N + M; i++) {
            st = new StringTokenizer(br.readLine());
            input(st.nextToken(), st.nextToken(), stoi(st.nextToken()) == 0);
        }

//		print("main", 0);
//		System.out.println("------------");

        st = new StringTokenizer(br.readLine());
        K = stoi(st.nextToken());
        for (int i = 0; i < K; i++) {
            st = new StringTokenizer(br.readLine());
            String[] f1 = st.nextToken().split("/");
            String[] f2 = st.nextToken().split("/");

            String target = f1[f1.length - 1];
            String dest = f2[f2.length - 1];

//			System.out.println(target + " 폴더를 " + dest + " 로 옮김");
            if (hm.containsKey(target)) {
                if (!hm.containsKey(dest)) {
                    hm.put(dest, new ArrayList<>());
                }
                for (String folder : hm.get(target)) {
                    hm.get(dest).add(folder);
                }
//				hm.get(dest).add(target);
            }
            hm.get(f1[f1.length - 2]).remove(target);

            if (info.containsKey(target)) {
                for (String file : info.get(target)) {
                    info.get(dest).add(file);
                }
                info.remove(target);
            }
//			print("main", 0);
//			System.out.println();
        }

        st = new StringTokenizer(br.readLine());
        Q = stoi(st.nextToken());
        for (int i = 0; i < Q; i++) {
            st = new StringTokenizer(br.readLine());
            String[] temp = st.nextToken().split("/");
            String target = temp[temp.length - 1];
            find(target);
        }

//		System.out.println("----------");
//		print("main", 0);
        System.out.print(sb.toString());
    }

    private static void find(String target) {
        result.clear();
        dfs(target);
        int allSum = 0;
        for (Entry<String, Integer> e : result.entrySet()) {
            allSum += e.getValue();
        }
        sb.append(result.size() + " " + allSum + "\n");
    }

    private static void dfs(String now) {
        if (info.containsKey(now)) {
            for (String name : info.get(now)) {
                if (!result.containsKey(name)) {
                    result.put(name, 0);
                }
                result.put(name, result.get(name) + 1);
            }
        }
        if (hm.containsKey(now)) {
            for (String next : hm.get(now)) {
                dfs(next);
            }
        }
    }

    private static void input(String parent, String name, boolean isFile) {
        if (isFile) {
            if (!info.containsKey(parent)) {
                info.put(parent, new HashSet<>());
            }
            info.get(parent).add(name);
        } else {
            if (!hm.containsKey(parent)) {
                hm.put(parent, new ArrayList<>());
            }
            hm.get(parent).add(name);
        }
    }

    private static void print(String now, int depth) {
        for (int i = 0; i < depth; i++) {
            System.out.print("-");
        }
        System.out.println("폴더:" + now);
        if (hm.containsKey(now)) {
            for (String folder : hm.get(now)) {

                print(folder, depth + 1);
            }
        }

        if (info.containsKey(now)) {
            for (String file : info.get(now)) {
                for (int i = 0; i < depth + 1; i++) {
                    System.out.print("-");
                }
                System.out.println(file);
            }
        }

    }

    private static int stoi(String input) {
        return Integer.parseInt(input);
    }

}
