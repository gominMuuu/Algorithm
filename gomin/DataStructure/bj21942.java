package DataStructure;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class bj21942 {
    public static void main(String[] args) throws NumberFormatException, IOException, ParseException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        st = new StringTokenizer(br.readLine(), " ");
        int N = Integer.parseInt(st.nextToken());   // 정보의 개수 N
        String L = st.nextToken();      // 대여기간 L
        int F = Integer.parseInt(st.nextToken());   // 분 당 벌금 F

        // 대여기간을 분으로 연산
        int ld = Integer.parseInt(L.substring(0,3));
        int lh = Integer.parseInt(L.substring(4,6));
        int lm = Integer.parseInt(L.substring(7, L.length()));
        int range = ld*24*60 + lh*60 + lm;

        // 해쉬맵 사용 <Item + User, DateTime>
        HashMap<String, String> map = new HashMap<>();
        HashMap<String, Long> fin = new HashMap<>();

        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");

        for(int i=0; i<N; i++) {
            st = new StringTokenizer(br.readLine(), " ");
            String date = st.nextToken();
            String time = st.nextToken();
            String item = st.nextToken();
            String user = st.nextToken();

            // 해시맵에 <item + user>의 대여기록이 남아있다면
            // 시간 차를 구한 뒤, 밀린 시간(분) 만큼 벌금 구하기
            // 답을 구하는 fin 해시맵에 <user, 벌금> 의 형태로 저장
            if(map.containsKey(item + " " + user)) {
                String pDate = map.get(item + " " + user);
                Date d1 = format.parse(pDate);
                Date d2 = format.parse(date + " " + time);
                long diff = ((d2.getTime() - d1.getTime()) / 60000);

                if(diff > range) {
                    // 만약 fin 해시맵에 이미 밀린 기록이 있다면,
                    // 기존의 벌금에 +추가하여 저장
                    if(fin.containsKey(user)) fin.put(user, fin.get(user) + (diff - range) * F);
                    else fin.put(user, (diff - range) * F);
                }
                map.remove(item + " " + user);
            } else {
                map.put(item + " " + user, date + " " + time);
                // 예: (arduino tony9402, 2021-01-01 09:12)
            }
        }

        // fin 해시맵을 사전 순 정렬 후 출력
        List<String> list = new ArrayList<>(fin.keySet());
        list.sort((s1,s2) -> s1.compareTo(s2));
        if(fin.size() <= 0){
            System.out.println(-1);
        } else {
            StringBuilder sb = new StringBuilder();
            for(String key : list) {
                sb.append(key + " " + fin.get(key)).append("\n");
            }
            System.out.print(sb);
        }
    }
}
