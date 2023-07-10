﻿<a name="br1"></a> 

ΑΡΙΣΤΟΤΕΛΕΙΟ ΠΑΝΕΠΙΣΤΗΜΙΟ

ΘΕΣΣΑΛΟΝΙΚΗΣ

ΤΜΗΜΑ ΠΛΗΡΟΦΟΡΙΚΗΣ

Εργαστήριο Ευφυών Συστημάτων

ΜΑΘΗΜΑ:

ΕΡΓΑΣΙΑ:

Συστήματα Γνώσης

2<sup>η</sup>

ΒΑΘΜΟΛΟΓΙΑ:

0 - 2

ΗΜΕΡΟΜΗΝΙΑ ΑΝΑΚΟΙΝΩΣΗΣ:

ΗΜΕΡΟΜΗΝΙΑ ΠΑΡΑΔΟΣΗΣ:

ΤΡΟΠΟΣ ΠΑΡΑΔΟΣΗΣ:

18/12/2022

22/01/2023

Upload στο [http://elearning.auth.gr](http://elearning.auth.gr/)

ΠΡΟΣΟΧΗ: Η εκπόνηση της 2<sup>ης</sup> εργασίας απαιτεί μόνο αυτά που είναι

σημειωμένα με άσπρο χρώμα. Η υπόλοιπη εκφώνηση (σημειωμένη με κίτρινο χρώμα)

αφορά στην 1<sup>η</sup> εργασία, η οποία έχει ήδη υλοποιηθεί και παρατίθεται μόνο για κατανόηση

του συνολικού προβλήματος.

Εκφώνηση Εργασίας

Να αναπτύξετε ένα σύστημα γνώσης για διάγνωση βλαβών στο ηλεκτρονικό κύκλωμα του

παρακάτω σχήματος, με τη χρήση της συλλογιστικής των μοντέλων.

Είσοδος 2

Π1

Π2

Μ2

Μ3

Είσοδος 1

Α1

Μ1

Έξοδος

Α2

Είσοδος 3

Είσοδος 4

Το σύστημα (ηλεκτρονικό κύκλωμα) αποτελείται από ολοκληρωμένα κυκλώματα δύο αθροιστών

(adder) Α1 και Α2 και δύο πολλαπλασιαστών (multiplier) Π1 και Π2. Στο σύστημα υπάρχουν

αισθητήρες, καθώς και σημεία εισόδου και εξόδου του σήματος. Μετρήσεις μπορούν να γίνονται

τόσο στα σημεία εισόδου (1-4) και εξόδου (OUT) ολόκληρου του συστήματος, όσο και στις θέσεις

Μ1, Μ2 και Μ3 (ενδιάμεσοι αισθητήρες).

Τα ολοκληρωμένα λειτουργούν με πέντε δυαδικά ψηφία (bits), οπότε οι αριθμοί με περισσότερα

ψηφία αποκόπτονται. Η κανονική λειτουργία ενός αθροιστή περιγράφεται από τη συνάρτηση

<b>(in1+in2) mod 2<sup>5</sup></b>, ενώ του πολλαπλασιαστή, αντίστοιχα: <b>(in1*in2) mod 2<sup>5</sup></b>. Τα ονόματα <b>in1</b> και

**in2** αναφέρονται στις δυο εισόδους κάθε ολοκληρωμένου. Και τα δύο ολοκληρωμένα εκτός από

την κανονική κατάσταση λειτουργίας μπορούν να βρεθούν και σε 2 άλλες καταστάσεις

προβληματικής λειτουργίας:

•

•

Βραχυκύκλωση: όπου η έξοδος είναι πάντα 0, ανεξάρτητα από την είσοδο.

Αποκοπή του πιο σημαντικού ψηφίου: όπου η έξοδος έχει πάντα μηδέν στο πιο σημαντικό

ψηφίο, δηλαδή η λειτουργία του αθροιστή περιγράφεται από τη συνάρτηση **(in1+in2) mod**

<b>2<sup>4</sup></b>, ενώ του πολλαπλασιαστή, αντίστοιχα: <b>(in1*in2) mod 2<sup>4</sup></b>.



<a name="br2"></a> 

Επίσης, οι αισθητήρες Μ1, Μ2, Μ3, καθώς και ο αισθητήρας εξόδου OUT, μπορεί να λειτουργούν

κανονικά, οπότε δείχνουν ακριβώς αυτό που έχει η είσοδός τους, ή μπορεί να βραχυκυκλωθούν,

οπότε μπορεί να δείχνουν οποιαδήποτε ένδειξη.

Απαιτήσεις της Εργασίας:

Έχετε ήδη μοντελοποιήσει με τη χρήση του εργαλείου Protégé όλη τη «στατική» γνώση του

παραπάνω προβλήματος, δηλαδή την οντολογία των κυκλωμάτων, των αισθητήρων και των

μετρήσεων.

Στη συνέχεια, να αναπτύξετε ένα σύστημα διάγνωσης σε CLIPS το οποίο να εκτελεί τα ακόλουθα:

Α) να χρησιμοποιεί τη στατική γνώση που αναπτύχθηκε στo Protégé, ενσωματώνοντάς την σε ένα

αρχείο CLIPS, χρησιμοποιώντας τις οδηγίες για την μετατροπή των αρχείων pont και pins που

υπάρχουν στο elearning.auth [(](https://elearning.auth.gr/mod/resource/view.php?id=260136)<https://elearning.auth.gr/mod/resource/view.php?id=260136>[)](https://elearning.auth.gr/mod/resource/view.php?id=260136)[ ](https://elearning.auth.gr/mod/resource/view.php?id=260136)και

Β) να κωδικοποιεί όλη την παραπάνω δυναμική γνώση και να:

o

παρακολουθεί τις τιμές εξόδου και των αισθητήρων καθώς και τις τιμές εισόδου και να

αποφαίνεται αν το σύστημα λειτουργεί κανονικά σε κάθε χρονική στιγμή,

ανακοινώνει την ύπαρξη προβλήματος, αν στο παραπάνω βήμα διαπιστωθεί ασυμφωνία,

και να προσπαθήσει να εντοπίσει και να ανακοινώσει το χαλασμένο εξάρτημα καθώς και

το είδος της βλάβης.

o

Υποθέτουμε ότι στο σύστημα υπάρχει το πολύ ένα είδος βλάβης κάθε φορά. Στα εξαρτήματα που

μπορεί να δυσλειτουργήσουν συμπεριλαμβάνονται και οι αισθητήρες.

Υπόδειξη: Για την αναπαράσταση του κυκλώματος να χρησιμοποιηθούν αντικείμενα για κάθε

είδος εξαρτήματος. Η αναπαράσταση της συνάρτησης εξόδου (είτε ορθής, είτε προβληματικής)

κάθε εξαρτήματος μπορεί να γίνει με τη χρήση μεθόδων (message-handlers).

Το σύστημα θα λειτουργεί σε κύκλους (χρονικές στιγμές). Σε κάθε χρονική στιγμή θα

καταγράφονται στην είσοδο και στους αισθητήρες τιμές, οι οποίες θα δίνονται ως αντικείμενα στο

πρόγραμμα. Ο ακόλουθος πίνακας δείχνει τις υποδειγματικές περιπτώσεις με τις οποίες θα

δοκιμαστεί το σύστημα.

Είσοδος

Αισθητήρας

**M2 M3**

Κύκλος

**1**

**2**

**3**

**4**

**M1**

**OUT**

1

21

7

28

25

17

11

24

19

10

13

24

28

30

11

25

15

31

21

10

19

10

0

24

0

26

3

18

3

2

3

11

18

25

12

22

4

6

8

14

0

4

12

16

24

12

12

17

5

18

8

12

9

6

7

1

0

31

31

1

7

3

22

23

8

2

0

0

0

26

0

26

0

8

9

31

6

6

30

12

30

31

0

30

28

10

4

25

12

12

Παράδειγμα Εκτέλεσης:

**CLIPS> (load "model-based-diagnosis.clp")**

**######~~~~@$\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\***

**TRUE**

**CLIPS> (reset)**

**CLIPS> (run)**



<a name="br3"></a> 

**Time: 1 ----> Normal Operation!**

**Time: 2 --> adder a1 error: Short-circuit!**

**Time: 3 --> multiplier p1 error: Most Significant Bit is off!**

**Time: 4 --> adder a2 error: Short-circuit!**

**Time: 5 --> adder a2 error: Most Significant Bit is off!**

**Time: 6 --> adder a1 error: Most Significant Bit is off!**

**Time: 7 --> multiplier p1 error: Short-circuit!**

**Time: 8 --> multiplier p2 error: Short-circuit!**

**Time: 9 --> multiplier p2 error: Most Significant Bit is off!**

**Time: 9 --> multiplier p2 error: Short-circuit!**

**Time: 10 --> sensor m2 error: Short-circuit!**

**CLIPS>**

Παρατηρήσεις

Ø Η εργασία αυτή μπορεί να γίνει (προαιρετικά) σε ομάδες 3 φοιτητών/φοιτητριών.

o Ο βαθμός της εργασίας θα είναι κοινός και για τους 3 φοιτητές της ομάδας.

Ø Στην αρχή του αρχείου .clp υποχρεωτικά να περιλαμβάνονται σε σχόλια ο αριθμός μητρώου

και το ονοματεπώνυμο των φοιτητών της ομάδας.

Ø Ο κώδικας θα πρέπει να είναι υποχρεωτικά σχολιασμένος, εξηγώντας τους αλγορίθμους και

τον τρόπο σκέψης.

o Εναλλακτικά θα μπορούσατε να συντάξετε ένα μικρό κείμενο (π.χ. σε Word) στο οποίο θα

περιγράφεται σύντομα ο τρόπος σκέψης και οι αλγόριθμοι που υλοποιήσατε. Στην

περίπτωση αυτή, επίσης στην αρχή του κειμένου να περιλαμβάνονται οι αριθμοί μητρώου

και τα ονοματεπώνυμα των φοιτητών της ομάδας.

Ø Ο πηγαίος κώδικας του προγράμματος να γίνει upload 1 μόνο φορά από έναν από τους

φοιτητές της ομάδας στο [http://elearning.auth.gr](http://elearning.auth.gr/)[.](http://elearning.auth.gr/)

o Το όνομα του αρχείου να είναι 'ΑΕΜ1**-**ΑΕΜ2**-AEM3.clp**', π.χ. **1234-5678-9999.clp**.

o Σε περίπτωση που υπάρχει και αρχείο DOC, τότε θα πρέπει να συμπιεστούν όλα τα αρχεία

μέσα σε 1 ZIP ή RAR αρχείο με όνομα 'ΑΕΜ1**-**ΑΕΜ2**-AEM3.zip'**, π.χ. **1234-5678-**

**9999.zip**.

Ø Το πρόγραμμα θα πρέπει να κατατοπίζει τον χρήστη κατά τη διάρκεια της λειτουργίας του,

δηλαδή πρέπει να τυπώνει κατάλληλα μηνύματα.

Ø Για να ενσωματώσετε τη στατική γνώση (οντολογίες/πλαίσια) που αναπτύξατε στην πρώτη

εργασία στο Protégé μέσα ένα αρχείο CLIPS, χρησιμοποιήστε τις οδηγίες για τη μετατροπή των

αρχείων pont και pins που υπάρχουν στο elearning.auth

[(](https://elearning.auth.gr/mod/resource/view.php?id=260136)<https://elearning.auth.gr/mod/resource/view.php?id=260136>[).](https://elearning.auth.gr/mod/resource/view.php?id=260136)

o Διευκρινίζεται ότι μπορείτε να κάνετε όσες αλλαγές θέλετε στη στατική αυτή γνώση, είτε

μέσω του Protégé είτε απευθείας στο αρχείο CLIPS.

