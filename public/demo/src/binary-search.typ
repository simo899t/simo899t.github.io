= Binary Search

To find a target $t$ in a sorted array of length $n$, halve the search range each step:
```java
int binarySearch(int[] arr, int t) {
    int lo = 0, hi = arr.length - 1;
    while (lo <= hi) {
        int mid = (lo + hi) / 2;
        if (arr[mid] == t) {
            return mid;
        } else if (arr[mid] < t) {
            lo = mid + 1;
        } else {
            hi = mid - 1;
        }
    }
    return -1;
}
```

= Time Complexity

Every step discards _half_ the remaining elements, giving the recurrence equation:
$ T(n) = T(n/2) + Theta(1) $
which solves, by the Master Theorem, to
$ T(n) = Theta(log n) $