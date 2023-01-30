package Greedy;

import java.io.*;
import java.util.*;

/* 풀이
    Meeting 클래스에 회의 시작 시간과 종료 시간을 속성으로 가지도록 한다.
    또한 reservation 우선 순위 큐에서 시작 시간 순서대로 회의를 꺼내오기 위해 compareTo() 메서드를 오버라이드
    반면, continuing 우선 순위 큐에서는 종료 시간 순서대로 회의를 꺼내기 위해 Comparator를 설정

    가장 최근에 시작하는 회의를 reservation에서 전부 꺼내 continuing에 넣어두고,
    해당 회의 시작 전에 이미 끝난 회의는 continuing에서 전부 빼낸다.
    매번 continuing의 크기를 비교하며 가장 큰 값을 저장해두면 된다.
 */

public class bj19598 {
    static class Meeting implements Comparable<Meeting> {
        private int start;
        private int end;

        public Meeting(int start, int end) {
            this.start = start;
            this.end = end;
        }

        public int getStart() {
            return start;
        }

        public int getEnd() {
            return end;
        }

        @Override
        public int compareTo(Meeting target) {
            return Integer.compare(this.start, target.getStart());
        }
    }

    public static void main(String[] args) throws IOException {

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());

        Queue<Meeting> reservation = new PriorityQueue<>();
        for (int i = 0; i < n; i++) {
            StringTokenizer st = new StringTokenizer(br.readLine());
            Meeting meeting = new Meeting(Integer.parseInt(st.nextToken()), Integer.parseInt(st.nextToken()));
            reservation.offer(meeting);
        }

        Queue<Meeting> continuing = new PriorityQueue<>(Comparator.comparingInt(Meeting::getEnd));

        int max = 0;
        while (!reservation.isEmpty()) {
            Meeting nextStart = reservation.poll();
            continuing.offer(nextStart);
            while (!reservation.isEmpty() && reservation.peek().getStart() == nextStart.getStart()) {
                continuing.offer(reservation.poll());
            }
            while (!continuing.isEmpty() && continuing.peek().getEnd() <= nextStart.getStart()) {
                continuing.poll();
            }
            max = Math.max(max, continuing.size());
        }

        System.out.println(max);
    }
}
