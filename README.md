# level

```bash
$ source compile.sh
$ tree -a
.
├── a
│   ├── a.txt
│   └── b
│       ├── b.py
│       └── c
│           ├── .d
│           │   └── .DS_Lite
│           └── c.cpp
├── level
└── test.txt

4 directories, 6 files
$ ./level
$ tree -a
.
├── a_a.txt
├── a_b_b.py
├── a_b_c_.d_.DS_Lite
├── a_b_c_c.cpp
├── level
└── test.txt

0 directories, 6 files
```
