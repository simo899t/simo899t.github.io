
= Relative clauses
The logic of $cal(A)(R C)$ of $"all _" + underline("relative") "clauses")$

Previously, a *signature* was simply a set of nouns, now our signature consists of a set of nouns, *plus* a set of tranitive verbs (a verb must take an object).

- *What are sentences? What are models? What are proofs?*

== Models
A Model (_relative to a particular signature_) consists of a set (_the domain_), and interpretations of both all nouns and all verbs

- $ip(space)_"nouns"$ is a subset of the domain
- $ip(space)_"verbs"$ is a binary relation on the domain
so..
$ ip(space)_"nouns":P -> pow(M), quad ip(space)_"verbs":R -> pow(M times M) $
Where $P$ is the set of nouns, and $R$ is the set of verbs

so..
$ model=(P,ip(space)_"nouns":P -> pow(M), quad ip(space)_"verbs":R -> pow(M times M)) $

== Terms
We want to give meaning to relative clauses so we ignore irrelevant words. $ #strike[those who] "love all "#strike[who]" fear all woodchucks" $
$ "love all (fear all woodchucks)" $

A term is either
- A single noun, or
- an expression ($r$ all $t$), where $r$ is a verb and $t$ is a term

#pseudo[
*Terms*
- i
   + if $t$ is a single noun, then
   + $ip(t) #[is simply] ip(t)_#[noun]$, which comes from the data in $model$
- ii
   + if $t$ is $term(r,t')$, then 
   + $ ip(t) = {m in M: forall n in ip(t') quad (m,n) in ip(r) } $
]