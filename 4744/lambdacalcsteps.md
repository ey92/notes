##### lambda calculator symbols
| input | symbol |
| - | - |
| ctrl+l | lambda |
| ctrl+a | for all |
| ctrl+e | exists |
| ctrl+i | for i |
| & or ^ | intersect |
| ctrl+v | union |
| ~ | not |
| -> | condition |
| <-> | bicondition |

plop.jar = truth checker (has a manual)

create ```e0.txt``` with semantically interpreted grammar and tree for target sentence at end

```java -jar ../java/lambda.jar > e0.tex```

make ```e0.tex``` on lambda calculator

compile TeX file ```pdflatex e0```

use Makefile (on server) to compile e0 ```make e0.fml```

e0.fml
```
true Pos(N3) & Vow(C(N3)).      // signed formula - either true or false
```

```make emu.e0.in``` generates ```emu.e0.in``` based on ```e0.fml```

emu.e0.in = sentence to evaluate.semantic lexicon.input
```
true Pos(N3) & Vow(C(N3))                       // sentence to evaluate

universe = {0,1,2,3,a,e,i,o,u,A,E,I,O,U,y,w,Y,W,b,c,d,f,g,h,j,k,l,m,n,p,q,r,s,t,v,x,z,B,C,D,F,G,H,J,K,L,M,N,P,Q,R,S,T,V,X,Z}.   // 0 req, positions in string 1-3
predicate Vow = {a,e,i,o,u,A,E,I,O,U}.          // every primitive symbol of type et
predicate Cns = {b,c,d,f,g,h,j,k,l,m,n,p,q,r,s,t,v,x,z,B,C,D,F,G,H,J,K,L,M,N,P,Q,R,S,T,V,X,Z}.
predicate Cap = {A,E,I,O,U,B,C,D,F,G,H,J,K,L,M,N,P,Q,R,S,T,V,X,Z}.
predicate Gli {y,w,Y,W}                         // glides
predicate Pos = {1,2,3}.                        // string positions
predicate D = {<1,2>,<2,1>,<2,3>,<3,2>}.        // lists string positions which are adjacent
constant N1 = 1.
constant N2 = 2.
constant N3 = 3.
function C = = {<1>=e,<2>=m,<3>,<u>=0,<a>=0,<e>=0,<i>=0,<o>=0,<u>=0,<A>=0,<E>=0,<I>=0,<O>=0,<U>=0,<y>=0,<w>=0,<Y>=0,<W>=0,<b>=0,<c>=0,<d>=0,<f>=0,<g>=0,<h>=0,<j>=0,<k>=0,<l>=0,<m>=0,<n>=0,<p>=0,<q>=0,<r>=0,<s>=0,<t>=0,<v>=0,<x>=0,<z>=0,<B>=0,<C>=0,<D>=0,<F>=0,<G>=0,<H>=0,<J>=0,<L>=0,<M>=0,<N>=0,<P>=0,<Q>=0,<R>=0,<S>=0,<T>=0,<V>=0,<X>=0,<Z>=0,<0>=0}.
```
- predicate-order logic vs first-order structure (emu.e0.in)
- for each predicate symbol, given subset of the universe
- required to define all inputs

```
make dog.e0.out
```