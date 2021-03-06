

# EXPLICACION PLANIFICADOR DE HORARIOS

###### Markus Triska


## Autores
----------------------------
* David Prieto Araujo

* Salvador Romero Boukhoubza

* Juan Diego Díaz Domínguez

* Abel Pichardo Estévez

* José Carlos Palma Vallejo*

[comment]: <> Librerías que se van a usar.

**:- use\_module(library(clpz)).**

**:- use\_module(library(dcgs)).**

**:- use\_module(library(reif)).**

**:- use\_module(library(pairs)).**

**:- use\_module(library(lists)).**

**:- use\_module(library(format)).**

**:- use\_module(library(pio)).**

[comment]: <> “dynamic” avisa al intérprete de que los predicados son dinámicos.

**:- dynamic(class\_subject\_teacher\_times/4).**

**:- dynamic(coupling/4).**

**:- dynamic(teacher\_freeday/2).**

**:- dynamic(slots\_per\_day/1).**

**:- dynamic(slots\_per\_week/1).**

**:- dynamic(class\_freeslot/2).**

**:- dynamic(room\_alloc/4).**

[comment]: <> Directiva que indica que las cláusulas no pueden estar juntas en el archivo.

:- discontiguous(class\_subject\_teacher\_times/4).

:- discontiguous(class\_freeslot/2).


requirements(Rs) :-

[comment]: <>Nuestro Objetivo es que la clase Class tenga la asignatura

[comment]: <>Subject, enseñada por el profesor Teacher un número de veces

[comment]: <>a la semana.

```Goal = class\_subject\_teacher\_times(Class,Subject,Teacher,Number)```,



[comment]: <>req es un termino de la forma req(C,S,T,N). Sirve para indicar un requisito.

[comment]: <>Haciendo el siguiente setof conseguimos unificar en Rs0

[comment]: <>las distintas alternativas del req poniendo en los parámetros

[comment]: <>lo que queremos conseguir en la variable Goal. Además,

[comment]: <>si en Goal hay variables libres, setof realizará un backtracking

[comment]: <>para conseguir todas las alternativas de estas variables libres.

[comment]: <>Por último, ordena el resultado para conseguir una lista sin

[comment]: <>las alternativas duplicadas.

```setof(req(Class,Subject,Teacher,Number), Goal, Rs0)```



[comment]: <>Con esto generamos un mapa donde se guardan las distintas

[comment]: <>posibilidades de tener los requisitos(esto último está guardado en Rs0)

[comment]: <>y el resultado estará en Rs.

```maplist(req\_with\_slots, Rs0, Rs)```.

[comment]: <>Sirve para reservar huecos o casillas a unos requisitos.

[comment]: <>Para ello, igualamos R a un requisito y además obtenemos el número de horas
[comment]: <>que debe impartirse a la semana. Luego, usando de forma reversible length,
[comment]: <>sabemos cuantos huecos debemos reservar para R.

```req\_with\_slots(R, R-Slots) :- R = req(\_,\_,\_,N), length(Slots, N).```

[comment]: <>Las clases serán un conjunto sin elementos repetidos de C, donde conseguimos 
[comment]: <>que se cumpla la meta (esta es el segundo parámetro) y se guarda en la variable Classes).

```classes(Classes) :- 
setof(C, S^N^T^class\_subject\_teacher\_times(C,S,T,N), Classes).
```

[comment]: <>Los profesores serán un conjunto sin elementos repetidos de T, donde conseguimos que 

[comment]: <>se cumpla la meta (esta es el segundo parámetro) y se guarda en la variable Teachers).

```
teachers(Teachers) :-
setof(T, C^S^N^class\_subject\_teacher\_times(C,S,T,N), Teachers).
```

```
rooms(Rooms) :-

[comment]: <>Con findall se crea una lista con todas las instancias de Room

[comment]: <>y mediante backtracking se intenta conseguir el objetivo

[comment]: <>que indicamos en el segundo parametro, guardando el resultado

[comment]: <>en Rooms0. Finaliza con exito con una lista vacia si el

[comment]: <>segundo parametro no tiene soluciones.



findall(Room, room\_alloc(Room,\_C,\_S,\_Slot), Rooms0),

[comment]: <>Unifica si Rooms contiene Rooms0 ordenada y sin duplicados.

sort(Rooms0, Rooms).
```



```
pairs\_slots(Ps, Vs) :-

[comment]: <>Elimina las claves de Ps,  obteniendo los valores y guardandolos

[comment]: <>en Vs0 de forma que Vs0 unifica con una lista de listas.

pairs\_values(Ps, Vs0),

[comment]: <>Concatena las listas de Vs0 en Vs.

append(Vs0, Vs).
```


```
requirements\_variables(Rs, Vars) :-

[comment]: <>Rs guarda los requisitos.

requirements(Rs),

[comment]: <>Vars es una lista de los valores de Rs.

pairs\_slots(Rs, Vars),

[comment]: <>SWP son los huecos que hay para poder dar clases por semana.

slots\_per\_week(SPW),

Max #= SPW - 1,

Vars ins 0..Max,

[comment]: <>Rs unifica con una lista que contiene todas las combinaciones

[comment]: <>de las distintas restricciones de una asignatura.

maplist(constrain\_subject, Rs),

classes(Classes),

teachers(Teachers),

rooms(Rooms),

[comment]: <>Teachers unifica con una lista que contiene todas las combinaciones

[comment]: <>aplicando las restricciones de los profesores con las asignaturas.

maplist(constrain\_teacher(Rs), Teachers),

[comment]: <>Classes unifica con una lista que contiene todas las combinaciones

[comment]: <>aplicando las restricciones de las clases con las asignaturas.

maplist(constrain\_class(Rs), Classes),

[comment]: <>Rooms unifica con una lista que contiene todas las combinaciones

[comment]: <>aplicando las restricciones de las aulas con las asignaturas 

maplist(constrain\_room(Rs), Rooms).
```

```
slot\_quotient(S, Q) :-

[comment]: <>SPD son los huecos que hay para poder dar clases por día.

slots\_per\_day(SPD),

Q #= S // SPD.

list\_without\_nths(Es0, Ws, Es) :-

phrase(without\_(Ws, 0, Es0), Es).

without\_([ ], \_, Es) --> seq(Es).

without\_([W|Ws], Pos0, [E|Es]) -->

{ Pos #= Pos0 + 1,

zcompare(R, W, Pos0) },

without\_at\_pos0(R, E, [W|Ws], Ws1),

without\_(Ws1, Pos, Es).
```

```
slots\_couplings(Slots, F-S) :-

[comment]: <>Devuelve true si S1 es el índice de F en Slots.

Slots = [A, B, C, D]

nth0(A, Slots, 1)

nth0(F, Slots, S1),

[comment]: <>S2 es el índice de F en Slots.

nth0(S, Slots, S2),

S2 #= S1 + 1.
```

```
all\_diff\_from(Vs, F) :- maplist(#\=(F), Vs).

[comment]: <>Función que define las restricciones de una asignatura

constrain\_subject(req(Class,Subj,\_Teacher,\_Num)-Slots) :-

strictly\_ascending(Slots),

maplist(slot\_quotient, Slots, Qs0),

findall(F-S, coupling(Class,Subj,F,S), Cs),

maplist(slots\_couplings(Slots), Cs),

[comment]: <>Elimina las claves de Cs,  obteniendo los valores y guardandolos

[comment]: <>en Seconds0 de forma que Seconds0 unifica con una lista de listas.

pairs\_values(Cs, Seconds0),

[comment]: <>Seconds unifica con los elementos de Seconds0 ordenados.

sort(Seconds0, Seconds),

list\_without\_nths(Qs0, Seconds, Qs),

strictly\_ascending(Qs).
```

```
all\_diff\_from(Vs, F) :- maplist(#\=(F), Vs).

[comment]: <>Define las restricciones que debe cumplir una 

[comment]: <>clase

constrain\_class(Rs, Class) :-

[comment]: <>Esta es una función creada por Ulrich Neumerkel que

[comment]: <>sirve para filtrar una lista

tfilter(class\_req(Class), Rs, Sub),

pairs\_slots(Sub, Vs),

all\_different(Vs),

findall(S, class\_freeslot(Class,S), Frees),

maplist(all\_diff\_from(Vs), Frees).
```

[comment]: <>Define las restricciones que debe cumplir un profesor

```
constrain\_teacher(Rs, Teacher) :-

tfilter(teacher\_req(Teacher), Rs, Sub),

pairs\_slots(Sub, Vs),

all\_different(Vs),

findall(F, teacher\_freeday(Teacher, F), Fs),

maplist(slot\_quotient, Vs, Qs),

maplist(all\_diff\_from(Qs), Fs).
```

[comment]: <>Comprueba que un profesor no imparte una asignatura a la misma hora

[comment]: <>en una misma aula que otro profesor.

```
sameroom\_var(Reqs, r(Class,Subject,Lesson), Var) :-

[comment]: <>Unifica cuando el requisito que le pasamos es miembro de la lista Reqs.

memberchk(req(Class,Subject,\_Teacher,\_Num)-Slots, Reqs),

nth0(Lesson, Slots, Var).
```

[comment]: <>Define las distintas restricciones para un aula.

```
constrain\_room(Reqs, Room) :-

findall(r(Class,Subj,Less), room\_alloc(Room,Class,Subj,Less), RReqs),

maplist(sameroom\_var(Reqs), RReqs, Roomvars),

all\_different(Roomvars).
```

[comment]: <>Unifica cuando los elementos de Ls están ordenados de forma

[comment]: <>ascendente

```
strictly\_ascending(Ls) :- chain(#<, Ls).
```

[comment]: <>Define la forma de definir un requisito para una clase.

```
class\_req(C0, req(C1,\_S,\_T,\_N)-\_, T) :- =(C0, C1, T).
```

[comment]: <>Define la forma de definir un requisito de un profesor.

```
teacher\_req(T0, req(\_C,\_S,T1,\_N)-\_, T) :- =(T0,T1,T).
```

[comment]: <>Es cierto si Vs unifica con una lista 

[comment]: <>que contiene los distintos días que hay que impartir una asignatura.

```
days\_variables(Days, Vs) :-

[comment]: <>SPW unifica con los huecos por semana que se imparte la asignatura.

slots\_per\_week(SPW),

[comment]: <>SPD unifica con los huecos por dia que se imparte la asignatura.

slots\_per\_day(SPD),

[comment]: <>NumDays unifica con la división entera de SPW entre SPD. Con esto,

[comment]: <>obtenemos el número de días que debe darse una asignatura.

NumDays #= SPW // SPD,

[comment]: <>Days unifica con una lista de tamaño NumDays

length(Days, NumDays), 

[comment]: <>Day unifica con una lista de tamaño SPD, es decir, obtenemos una lista
[comment]: <>cuyo tamaño representa las horas que se imparte una asignatura en un dia.

length(Day, SPD),

[comment]: <>Con esto obtenemos una lista de tamaño Day que unifica, con todas las
[comment]: <>posibilidades de la lista Days.

maplist(same\_length(Day), Days),

[comment]: <>En Vs guardamos como quedan los días.

append(Days, Vs).
```

[comment]: <>Obtenemos los días en los que se puede dar las clases.

```
class\_days(Rs, Class, Days) :-

days\_variables(Days, Vs),

tfilter(class\_req(Class), Rs, Sub), 

foldl(v(Sub), Vs, 0, \_).
```

```
v(Rs, V, N0, N) :-

(member(req(\_,Subject,\_,\_)-Times, Rs),

member(N0, Times) -> V = subject(Subject);
           V = free),
N #= N0 + 1.
```

[comment]: <>Unifica cuando Days contiene una lista con los días que un profesor imparte clases

```
teacher\_days(Rs, Teacher, Days) :-

days\_variables(Days, Vs),

tfilter(teacher\_req(Teacher), Rs, Sub),

foldl(v\_teacher(Sub), Vs, 0, \_).
```

```
v\_teacher(Rs, V, N0, N) :-

(member(req(C,Subj,\_,\_)-Times, Rs),

member(N0, Times) -> V = class\_subject(C, Subj);
   V = free),

N #= N0 + 1.
```

[comment]: <>Función para mostrar las clases
```
print\_classes(Rs) :-

[comment]: <>Obtenemos las clases a mostrar

classes(Cs), 

[comment]: <>Función creada por Markus Triska que devuelve una lista

[comment]: <>de caracteres que sigue el formato que pasamos como

[comment]: <>primer parametro.

phrase\_to\_stream(format\_classes(Cs, Rs), user\_output).

[comment]: <>Definición del formato a representar

format\_classes([], \_) --> [].
```

```
format\_classes([Class|Classes], Rs) →

[comment]: <>Se obtienen los días que se va a dar la clase

{ class\_days(Rs, Class, Days0),

[comment]: <>Se realiza la traspuesta de la lista Days0

transpose(Days0, Days) },

[comment]: <>Indica que el formato debe ser de la forma Class: "Nombre de la Clase"

format\_("Class: ~w~2n", [Class]),

[comment]: <>Se obtiene una lista con los días de la semana

weekdays\_header,

[comment]: <>Alinea las filas de los Days con la lista de los días de la semana

align\_rows(Days),

[comment]: <>Realiza la función para las demás clases de la Lista

format\_classes(Classes, Rs).
```

[comment]: <>Funcion que unifica cuando las filas están alineadas

```
align\_rows([]) --> "\n\n\n".

align\_rows([R|Rs]) -->

align\_row(R),

"\n",

align\_rows(Rs).

align\_row([]) --> [].
```
```
align\_row([R|Rs]) -->

align\_(R),

align\_row(Rs).
```
```
align\_(free) --> align\_(verbatim('')).
```
```
align\_(class\_subject(C,S)) --> align\_(verbatim(C/S)).
```
```
align\_(subject(S)) --> align\_(verbatim(S)).
```
```
align\_(verbatim(Element)) --> format\_("~t~w~t~8+", [Element]).
```

[comment]: <>Muestra los nombres de todos los profesores.
```
print\_teachers(Rs) :-

teachers(Ts),

phrase\_to\_stream(format\_teachers(Ts, Rs), user\_output).
```


[comment]: <>Define el formato de la tabla de profesores mostrando

[comment]: <>el nombre del profesor, los días que imparte y los huecos

[comment]: <>en los días que imparte
```
format\_teachers([], \_) --> [].
```
```
format\_teachers([T|Ts], Rs) -->

{teacher\_days(Rs, T, Days0), transpose(Days0, Days) },

format\_("Teacher: ~w~2n", [T]),

weekdays\_header,

align\_rows(Days),

format\_teachers(Ts, Rs).
```
[comment]: <>Define la cabecera de los días de la semana con sus nombres 

[comment]: <>y la alinea.
```
weekdays\_header -->

{ maplist(with\_verbatim, ['Mon','Tue','Wed','Thu','Fri'], Vs) },

align\_row(Vs),

format\_("~n~`=t~40|~n", []).

```
[comment]: <>Unifica cuando T unifica con el literal T, para así, poder mostrarlo.
```
with\_verbatim(T, verbatim(T)).
```

