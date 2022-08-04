set pessoas;
set tarefas;
param Capacidade{pessoas};
param Demanda{tarefas};
param interesse{pessoas, tarefas};

var x{pessoas, tarefas} integer >=0;

maximize
FO : sum{i in pessoas, j in tarefas} interesse[i,j] * x[i,j];

# Capacidade
subject to cap1: sum{j in tarefas} x[1,j] = Capacidade[1];
subject to cap2: sum{j in tarefas} x[2,j] = Capacidade[2];
subject to cap3: sum{j in tarefas} x[3,j] = Capacidade[3];
subject to cap4: sum{j in tarefas} x[4,j] = Capacidade[4];
subject to cap5: sum{j in tarefas} x[5,j] = Capacidade[5];
subject to cap6: sum{j in tarefas} x[6,j] = Capacidade[6];
subject to cap7: sum{j in tarefas} x[7,j] = Capacidade[7];
subject to cap8: sum{j in tarefas} x[8,j] = Capacidade[8];
subject to cap9: sum{j in tarefas} x[9,j] = Capacidade[9];
subject to cap10: sum{j in tarefas} x[10,j] = Capacidade[10];

# Demanda
subject to dem1: sum{i in pessoas} x[i,1] = Demanda[1];
subject to dem2: sum{i in pessoas} x[i,2] = Demanda[2];
subject to dem3: sum{i in pessoas} x[i,3] = Demanda[3];
subject to dem4: sum{i in pessoas} x[i,4] = Demanda[4];

\end{lstlisting}

\subsection{Codigo .dat}
\begin{lstlisting}
set pessoas := 1 2 3 4 5 6 7 8 9 10;
set tarefas := 1 2 3 4;

param Capacidade :=
1 1
2 1
3 1 
4 1
5 1
6 1
7 1
8 1
9 1
10 1;

param Demanda:= 
1 2
2 2
3 3
4 3;

param interesse: 1 2 3 4:= 
1 4.25 3.8 4.8 4.2
2 4.25 4 4.4 4
3 3.25 3.6 4.2 4.4
4 2.5 3.2 3.6 3.6
5 3.5 4.2 4.6 4.8
6 2	3 3.8 3.8
7 4	4 4.6 4.6
8 3.5 3.6 4.6 4.6
9 4	4.4	4 4.4
10 3 3.2 3.8 4
