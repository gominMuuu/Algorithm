package String;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

public class bj20291 {
    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;
        StringBuilder sb = new StringBuilder();

        int N = Integer.parseInt(br.readLine());

        // <확장자, 개수> 형태의 해시맵 사용
        HashMap<String, Integer> map = new HashMap<>();

        for(int i=0; i<N; i++) {
            st = new StringTokenizer(br.readLine(), ".");
            String fn = st.nextToken();
            String ext = st.nextToken();

            if(map.containsKey(ext)) {
                int num = map.get(ext);
                map.put(ext, num+1);
            } else {
                map.put(ext, 1);
            }
        }

        // 해시맵을 사전 순 정렬 후 출력
        List<String> list = new ArrayList<>(map.keySet());
        list.sort((s1,s2) -> s1.compareTo(s2));
        for(String key : list) {
            sb.append(key + " " + map.get(key)).append("\n");
        }
        System.out.print(sb);
    }
}
