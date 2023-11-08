#0
# ::snt Hannah: Hey, do you have Betty's number?
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Hannah"))
      :ARG1 (h / have-03
            :ARG0 (y / you)
            :ARG1 (n2 / number
                  :poss (p2 / person
                        :name (n3 / name
                              :op1 "Betty")))
            :polarity (a / amr-unknown)
            :mod (h2 / hey
                  :mode expressive)))
# ::snt Amanda: Lemme check
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Amanda"))
      :ARG1 (c / check-01
            :mode imperative
            :ARG0 (y / you)))
# ::snt Hannah: <file_gif>
(p / person
      :name (n / name
            :op1 "Hannah"))
# ::snt Amanda: Sorry, can't find it.
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Amanda"))
      :ARG1 (s2 / sorry-01
            :ARG1 (ii / i)
            :ARG2 (p2 / possible-01
                  :polarity -
                  :ARG1 (f / find-01
                        :ARG0 ii
                        :ARG1 (ii2 / it)))))
# ::snt Amanda: Ask Larry
(a / ask-01
      :mode imperative
      :ARG0 (p / person
            :name (n / name
                  :op1 "Amanda"))
      :ARG2 (p2 / person
            :name (n2 / name
                  :op1 "Larry")))
# ::snt Amanda: He called her last time we were at the park together
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Amanda"))
      :ARG1 (c / call-02
            :ARG0 (h / he)
            :ARG1 (s2 / she)
            :time (b / be-located-at-91
                  :ARG1 (w / we)
                  :ARG2 (p2 / park)
                  :mod (t / together)
                  :mod (l / last))))
# ::snt Hannah: I don't know him well
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Hannah"))
      :ARG1 (k / know-02
            :polarity -
            :ARG0 p
            :ARG1 (h / he)
            :degree (w / well)))
# ::snt Hannah: <file_gif>
(p / person
      :name (n / name
            :op1 "Hannah"))
# ::snt Amanda: Don't be shy, he's very nice
(s / say-01
      :ARG1 (s2 / shy-04
            :polarity -
            :mode imperative
            :ARG0 (p / person
                  :name (n / name
                        :op1 "Amanda"))
            :ARG1 p
            :ARG1-of (c / cause-01
                  :ARG0 (n2 / nice-01
                        :ARG1 (h / he)
                        :degree (v / very))))
      :ARG2 p)
# ::snt Hannah: If you say so..
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Hannah"))
      :ARG1 (h / have-condition-91
            :ARG2 (s2 / say-01
                  :ARG0 (y / you)
                  :ARG1 (s3 / so))))
# ::snt Hannah: I'd rather you texted him
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Hannah"))
      :ARG1 (p2 / prefer-01
            :ARG0 (ii / i)
            :ARG1 (t / text-01
                  :ARG0 (y / you)
                  :ARG2 (h / he))))
# ::snt Amanda: Just text him 🙂
(t / text-01
      :mode imperative
      :ARG0 (p / person
            :name (n / name
                  :op1 "Amanda"))
      :ARG2 (h / he)
      :mod (j / just))
# ::snt Hannah: Urgh.. Alright
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Hannah"))
      :ARG1 (a / and
            :op1 (u / urgh
                  :mode expressive)
            :op2 (a2 / all-right)))
# ::snt Hannah: Bye
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Hannah"))
      :ARG1 (b / bye))
# ::snt Amanda: Bye bye
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Amanda"))
      :ARG1 (b / bye))
#******************************
# ::snt Hannah needs Betty's number but Amanda doesn't have it. She needs to contact Larry.
(m / multi-sentence
      :snt1 (c / contrast-01
            :ARG1 (n / need-01
                  :ARG0 (p / person
                        :name (n2 / name
                              :op1 "Hannah"))
                  :ARG1 (n3 / number
                        :poss (p2 / person
                              :name (n4 / name
                                    :op1 "Betty"))))
            :ARG2 (h / have-03
                  :polarity -
                  :ARG0 (p3 / person
                        :name (n5 / name
                              :op1 "Amanda"))
                  :ARG1 n3))
      :snt2 (n6 / need-01
            :ARG0 (s / she)
            :ARG1 (c2 / contact-01
                  :ARG0 s
                  :ARG1 (p4 / person
                        :name (n7 / name
                              :op1 "Larry")))))
#------------------------------------------------------------
#1
# ::snt Eric: MACHINE!
(m / machine
      :mode expressive
      :domain (p / person
            :name (n / name
                  :op1 "Eric")))
# ::snt Rob: That's so gr8!
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Rob"))
      :ARG1 (t / that
            :mod (g / gr8
                  :mode expressive
                  :degree (s2 / so))))
# ::snt Eric: I know! And shows how Americans see Russian ;)
(m / multi-sentence
      :snt1 (s / say-01
            :mode expressive
            :ARG0 (p / person
                  :name (n / name
                        :op1 "Eric"))
            :ARG1 (k / know-01
                  :ARG0 p))
      :snt2 (a / and
            :op2 (s2 / show-01
                  :ARG1 (t / thing
                        :manner-of (s3 / see-01
                              :ARG0 (p2 / person
                                    :mod (c / country
                                          :name (n2 / name
                                                :op1 "America")))
                              :ARG1 (l / language
                                    :name (n3 / name
                                          :op1 "Russian")))))))
# ::snt Rob: And it's really funny!
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Rob"))
      :ARG1 (a / and
            :op2 (f / funny-02
                  :ARG1 (ii / it)
                  :degree (r / really))))
# ::snt Eric: I know! I especially like the train part!
(s / say-01
      :mode expressive
      :ARG0 (p / person
            :name (n / name
                  :op1 "Eric"))
      :ARG1 (k / know-01
            :mode expressive
            :ARG0 p)
      :ARG2 (l / like-01
            :ARG0 p
            :ARG1 (p2 / part
                  :topic (t / train))
            :degree (e / especially)))
# ::snt Rob: Hahaha! No one talks to the machine like that!
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Rob"))
      :ARG1 (t / talk-01
            :ARG0 (n2 / no-one)
            :ARG2 (m / machine)
            :ARG1-of (r / resemble-01
                  :ARG2 (t2 / that)))
      :mod (h / haha
            :mode expressive))
# ::snt Eric: Is this his only stand-up?
(a / ask-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Eric"))
      :ARG1 (s / stand-up-07
            :ARG1 (h / he)
            :mod (o / only)
            :domain (t / this)
            :polarity (a2 / amr-unknown)))
# ::snt Rob: Idk. I'll check.
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Rob"))
      :ARG1 (a / and
            :op1 (k / know-01
                  :polarity -
                  :ARG0 (ii / i))
            :op2 (c / check-01
                  :ARG0 ii)))
# ::snt Eric: Sure.
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Eric"))
      :ARG1 (s2 / sure-02))
# ::snt Rob: Turns out no! There are some of his stand-ups on youtube.
(m / multi-sentence
      :snt1 (s / say-01
            :ARG0 (p / person
                  :name (n / name
                        :op1 "Rob"))
            :ARG1 (t / turn-out-11
                  :ARG2 (n2 / no)))
      :snt2 (b / be-located-at-91
            :ARG1 (s2 / stand-up-07
                  :quant (s3 / some)
                  :ARG1-of (ii / include-91
                        :ARG2 (s4 / stand-up-07
                              :ARG0 (h / he))))
            :ARG2 (p2 / publication
                  :name (n3 / name
                        :op1 "YouTube"))))
# ::snt Eric: Gr8! I'll watch them now!
(m / multi-sentence
      :snt1 (s / say-01
            :mode expressive
            :ARG0 (p / person
                  :name (n / name
                        :op1 "Eric"))
            :ARG1 (s2 / string-entity
                  :value "Gr8"))
      :snt2 (w / watch-01
            :ARG0 (ii / i)
            :ARG1 (t / they)
            :time (n2 / now)))
# ::snt Rob: Me too!
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Rob"))
      :ARG1 (ii / i
            :mod (t / too)))
# ::snt Eric: MACHINE!
(m / machine
      :mode expressive
      :domain (p / person
            :name (n / name
                  :op1 "Eric")))
# ::snt Rob: MACHINE!
(s / say-01
      :mode expressive
      :ARG0 (p / person
            :name (n / name
                  :op1 "Rob"))
      :ARG1 (m / machine))
# ::snt Eric: TTYL?
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Eric"))
      :ARG1 (t / take-01
            :ARG1 (p2 / phone-number-entity
                  :value "TTYL"))
      :polarity (a / amr-unknown))
# ::snt Rob: Sure :)
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Rob"))
      :ARG1 (s2 / sure-02))
#******************************
# ::snt Eric and Rob are going to watch a stand-up on youtube.
(w / watch-01
      :ARG0 (a / and
            :op1 (p / person
                  :name (n / name
                        :op1 "Eric"))
            :op2 (p2 / person
                  :name (n2 / name
                        :op1 "Rob")))
      :ARG1 (s / stand-up-07
            :medium (p3 / publication
                  :name (n3 / name
                        :op1 "YouTube"))))
#------------------------------------------------------------
#2
# ::snt Lenny: Babe, can you help me with something?
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Lenny"))
      :ARG1 (p2 / possible-01
            :ARG1 (h / help-01
                  :ARG0 (y / you
                        :mod (b / Babe))
                  :ARG1 (s2 / something)
                  :ARG2 p))
      :ARG2 p)
# ::snt Bob: Sure, what's up?
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Bob"))
      :ARG1 (s2 / sure-02
            :ARG1 (e / event
                  :mod (a / amr-unknown))))
# ::snt Lenny: Which one should I pick?
(s / say-01
      :ARG1 (r / recommend-01
            :ARG1 (p / pick-01
                  :ARG0 (ii / i)
                  :ARG1 (a / amr-unknown)))
      :ARG2 (p2 / person
            :name (n / name
                  :op1 "Lenny")))
# ::snt Bob: Send me photos
(s / say-01
      :ARG1 (s2 / send-01
            :mode imperative
            :ARG0 (p / person
                  :name (n / name
                        :op1 "Bob"))
            :ARG1 (p2 / photo)
            :ARG2 (ii / i))
      :ARG2 p)
# ::snt Lenny:  <file_photo>
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Lenny"))
      :ARG1 (p2 / photo))
# ::snt Lenny:  <file_photo>
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Lenny"))
      :ARG1 (p2 / photo))
# ::snt Lenny:  <file_photo>
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Lenny"))
      :ARG1 (p2 / photo))
# ::snt Bob: I like the first ones best
(s / say-01
      :ARG0 (ii / i)
      :ARG1 (l / like-01
            :ARG0 ii
            :ARG1 (b / book
                  :ord (o / ordinal-entity
                        :value 1))
            :ARG2-of (h / have-degree-91
                  :ARG1 ii
                  :ARG3 (m / most)))
      :ARG2 (p / person
            :name (n / name
                  :op1 "Bob")))
# ::snt Lenny: But I already have purple trousers. Does it make sense to have two pairs?
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Lenny"))
      :ARG1 (c / contrast-01
            :ARG2 (h / have-03
                  :ARG0 (ii / i)
                  :ARG1 (t / trousers
                        :ARG1-of (p2 / purple-02))
                  :time (a / already)))
      :polarity (a2 / amr-unknown)
      :topic (s2 / sense-02
            :ARG1 (h2 / have-03
                  :ARG0 ii
                  :ARG1 (p3 / pair
                        :quant 2))))
# ::snt Bob: I have four black pairs :D :D
(s / say-01
      :mode expressive
      :ARG0 (ii / i)
      :ARG1 (h / have-03
            :ARG0 ii
            :ARG1 (p / pair
                  :quant 4
                  :ARG1-of (b / black-04)))
      :ARG2 (p2 / person
            :name (n / name
                  :op1 "Bob")))
# ::snt Lenny: yeah, but shouldn't I pick a different color?
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Lenny"))
      :ARG1 (c / contrast-01
            :ARG1 (y / yeah)
            :ARG2 (r / recommend-01
                  :polarity -
                  :ARG1 (p2 / pick-01
                        :ARG0 p
                        :ARG1 (c2 / color
                              :ARG1-of (d / differ-02)))
                  :ARG2 p)))
# ::snt Bob: what matters is what you'll give you the most outfit options
(s / say-01
      :ARG1 (m / matter-01
            :ARG1 (t / thing
                  :ARG1-of (g / give-01
                        :ARG0 (y / you)
                        :ARG2 (p / person
                              :name (n / name
                                    :op1 "Bob")))
                  :domain (o / option
                        :topic (o2 / outfit)
                        :ARG1-of (h / have-quant-91
                              :ARG3 (m2 / most)))))
      :ARG2 p)
# ::snt Lenny: So I guess I'll buy the first or the third pair then
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Lenny"))
      :ARG1 (g / guess-01
            :ARG0 p
            :ARG1 (b / buy-01
                  :ARG0 p
                  :ARG1 (o / or
                        :op1 (p2 / pair
                              :ord (o2 / ordinal-entity
                                    :value 1))
                        :op2 (p3 / pair
                              :ord (o3 / ordinal-entity
                                    :value 3)))
                  :time (t / then))))
# ::snt Bob: Pick the best quality then
(s / say-01
      :ARG1 (p / pick-01
            :mode imperative
            :ARG0 (y / you)
            :ARG1 (q / quality
                  :ARG1-of (h / have-degree-91
                        :ARG2 (g / good-02
                              :ARG1 q)
                        :ARG3 (m / most)))
            :mod (t / then))
      :ARG2 (p2 / person
            :name (n / name
                  :op1 "Bob")))
# ::snt Lenny: ur right, thx
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Lenny"))
      :ARG1 (r / right-06
            :ARG1 (y / you))
      :mod (a / again))
# ::snt Bob: no prob :)
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Bob"))
      :ARG1 (n2 / no-brainer
            :mode expressive))
#******************************
# ::snt Lenny can't decide which trousers to buy. Bob advised Lenny on that topic. Lenny goes with Bob's advice to pick the trousers that are of best quality.
(m / multi-sentence
      :snt1 (p / possible-01
            :polarity -
            :ARG1 (d / decide-01
                  :ARG0 (p2 / person
                        :name (n / name
                              :op1 "Lenny"))
                  :ARG1 (t / trousers
                        :ARG1-of (b / buy-01
                              :ARG0 p2))))
      :snt2 (a / advise-01
            :ARG0 (p3 / person
                  :name (n2 / name
                        :op1 "Bob"))
            :ARG1 p2
            :ARG2 (t2 / topic
                  :mod (t3 / that)))
      :snt3 (g / go-06
            :ARG0 (p4 / person
                  :name (n3 / name
                        :op1 "Lenny"))
            :ARG1 (a2 / advise-01
                  :ARG0 p3
                  :ARG1 p4
                  :ARG2 (p5 / pick-01
                        :ARG0 p4
                        :ARG1 (t4 / trousers
                              :ARG1-of (h / have-degree-91
                                    :ARG2 (q / quality)
                                    :ARG3 (m2 / most)))))))
#------------------------------------------------------------
#3
# ::snt Will: hey babe, what do you want for dinner tonight?
(a / ask-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Will"))
      :ARG1 (w / want-01
            :ARG0 (b / babe)
            :ARG1 (a2 / amr-unknown)
            :time (d / date-entity
                  :dayperiod (n2 / night)
                  :mod (t / today)))
      :ARG2 b
      :mod (h / hey
            :mode expressive))
# ::snt Emma:  gah, don't even worry about it tonight
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Emma"))
      :ARG1 (w / worry-02
            :polarity -
            :mode imperative
            :ARG0 (y / you)
            :ARG1 (ii / it)
            :time (d / date-entity
                  :dayperiod (n2 / night)
                  :mod (t / today))
            :mod (e / even)
            :mod (g / gah
                  :mode expressive)))
# ::snt Will: what do you mean? everything ok?
(m / multi-sentence
      :snt1 (a / amr-unknown
            :polarity (a2 / amr-unknown))
      :snt2 (m2 / mean-01
            :ARG0 (y / you)
            :ARG1 (a3 / amr-unknown)
            :ARG2 (o / okay-04
                  :ARG1 (e / everything))))
# ::snt Emma: not really, but it's ok, don't worry about cooking though, I'm not hungry
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Emma"))
      :ARG1 (a / and
            :op1 (r / real-04
                  :polarity -
                  :concession (o / okay-04
                        :ARG1 (ii / it)))
            :op2 (w / worry-02
                  :polarity -
                  :mode imperative
                  :ARG0 (y / you)
                  :ARG1 (c / cook-01
                        :ARG0 y)
                  :ARG1-of (h / have-concession-91)
                  :ARG1-of (c2 / cause-01
                        :ARG0 (h2 / hunger-01
                              :polarity -
                              :ARG0 p)))))
# ::snt Will: Well what time will you be home?
(s / say-01
      :ARG0 (a / amr-unknown)
      :ARG1 (b / be-located-at-91
            :ARG1 (y / you)
            :ARG2 (h / home)
            :time (a2 / amr-unknown)
            :mod (w / well)))
# ::snt Emma: soon, hopefully
(s / say-01
      :ARG0 (ii / i)
      :ARG1 (s2 / soon
            :ARG1-of (h / hope-01))
      :ARG2 (p / person
            :name (n / name
                  :op1 "Emma")))
# ::snt Will: you sure? Maybe you want me to pick you up?
(p / possible-01
      :ARG1 (w / want-01
            :ARG0 (y / you)
            :ARG1 (p2 / pick-up-04
                  :ARG0 (ii / i)
                  :ARG1 y))
      :polarity (a / amr-unknown)
      :ARG1-of (s / sure-02
            :ARG0 y))
# ::snt Emma: no no it's alright. I'll be home soon, i'll tell you when I get home.
(m / multi-sentence
      :snt1 (s / say-01
            :ARG0 (p / person
                  :name (n / name
                        :op1 "Emma"))
            :ARG1 (a / all-right
                  :domain (ii / it)))
      :snt2 (a2 / and
            :op1 (b / be-located-at-91
                  :ARG1 (ii2 / i)
                  :ARG2 (h / home)
                  :time (s2 / soon))
            :op2 (t / tell-01
                  :ARG0 ii2
                  :ARG2 (y / you)
                  :time (g / get-05
                        :ARG1 ii2
                        :ARG2 h))))
# ::snt Will: Alright, love you.
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Will"))
      :ARG1 (l / love-01
            :ARG0 p
            :ARG1 (y / you))
      :ARG1-of (o / okay-04))
# ::snt Emma: love you too.
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Emma"))
      :ARG1 (l / love-01
            :ARG0 p
            :ARG1 (y / you)
            :mod (t / too)))
#******************************
# ::snt Emma will be home soon and she will let Will know.
(a / and
      :op1 (b / be-located-at-91
            :ARG1 (p / person
                  :name (n / name
                        :op1 "Emma"))
            :ARG2 (h / home)
            :time (s / soon))
      :op2 (l / let-know-07
            :ARG0 p
            :ARG1 (p2 / person
                  :name (n2 / name
                        :op1 "Will"))))
#------------------------------------------------------------
#4
# ::snt Ollie: Hi , are you in Warsaw
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Ollie"))
      :ARG1 (a / and
            :op1 (h / hi)
            :op2 (b / be-located-at-91
                  :ARG1 (y / you)
                  :ARG2 (c / city
                        :name (n2 / name
                              :op1 "Warsaw"))
                  :polarity (a2 / amr-unknown))))
# ::snt Jane: yes, just back! Btw are you free for diner the 19th?
(s / say-01
      :mode expressive
      :ARG0 (p / person
            :name (n / name
                  :op1 "Jane"))
      :ARG1 (a / and
            :op1 (y / yes)
            :op2 (b / back
                  :mod (j / just)))
      :mod (b2 / by-the-way)
      :topic (f / free-03
            :ARG1 (y2 / you)
            :purpose (d / diner)
            :time (d2 / date-entity
                  :day 19)
            :polarity (a2 / amr-unknown)))
# ::snt Ollie: nope!
(s / say-01
      :mode expressive
      :ARG0 (p / person
            :name (n / name
                  :op1 "Ollie"))
      :ARG1 (n2 / nope))
# ::snt Jane: and the  18th?
(s / say-01
      :ARG0 (ii / i)
      :ARG1 (a / and
            :op2 (d / date-entity
                  :day 18
                  :month 1
                  :polarity (a2 / amr-unknown)))
      :ARG2 (p / person
            :name (n / name
                  :op1 "Jane")))
# ::snt Ollie: nope, we have this party and you must be there, remember?
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Ollie"))
      :ARG1 (a / and
            :op1 (h / have-06
                  :ARG0 (w / we)
                  :ARG1 (p2 / party
                        :mod (t / this)))
            :op2 (o / obligate-01
                  :ARG2 (b / be-located-at-91
                        :ARG1 (y / you)
                        :ARG2 p2))
            :ARG1-of (r / remember-01
                  :ARG0 y))
      :mod (n2 / nope))
# ::snt Jane: oh right! i lost my calendar..  thanks for reminding me
(s / say-01
      :mode expressive
      :ARG0 (p / person
            :name (n / name
                  :op1 "Jane"))
      :ARG1 (l / lose-02
            :ARG0 p
            :ARG1 (c / calendar
                  :poss p))
      :ARG2-of (t / thank-01
            :ARG0 p
            :ARG1 (y / you)
            :ARG2 (r / remind-01
                  :ARG0 y
                  :ARG1 l
                  :ARG2 p))
      :mod (o / oh
            :mode expressive)
      :ARG1-of (r2 / right-06))
# ::snt Ollie: we have lunch this week?
(s / say-01
      :ARG1 (h / have-06
            :ARG0 (w / we)
            :ARG1 (l / lunch)
            :time (w2 / week
                  :mod (t / this))
            :polarity (a / amr-unknown))
      :ARG2 (p / person
            :name (n / name
                  :op1 "Ollie")))
# ::snt Jane: with pleasure!
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Jane"))
      :ARG1 (p2 / pleasure))
# ::snt Ollie: friday?
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Ollie"))
      :ARG1 (d / date-entity
            :weekday (f / friday))
      :polarity (a / amr-unknown))
# ::snt Jane: ok
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Jane"))
      :ARG1 (o / okay-01))
# ::snt Jane: what do you mean " we don't have any more whisky!" lol..
(a / ask-01
      :ARG0 (ii / i)
      :ARG1 (m / mean-01
            :ARG0 (p / person
                  :name (n / name
                        :op1 "Jane"))
            :ARG1 (s / say-01
                  :ARG0 p
                  :ARG1 (h / have-03
                        :polarity -
                        :ARG0 (w / we)
                        :ARG1 (w2 / whisky
                              :quant (m2 / more
                                    :mod (a2 / any)))))
            :ARG2 (a3 / amr-unknown)
            :ARG2-of (l / laugh-01
                  :ARG0 ii
                  :manner (l2 / loud)))
      :ARG2 p)
# ::snt Ollie: what!!!
(s / say-01
      :mode expressive
      :ARG0 (p / person
            :name (n / name
                  :op1 "Ollie"))
      :ARG1 (a / amr-unknown))
# ::snt Jane: you just call me and the all thing i heard was that sentence about whisky... what's wrong with you?
(s / say-01
      :ARG0 (ii / i)
      :ARG1 (a / and
            :op1 (c / call-02
                  :ARG0 (y / you)
                  :ARG1 ii
                  :mod (j / just))
            :op2 (h / hear-01
                  :ARG0 ii
                  :ARG1 (s2 / sentence
                        :mod (t / that)
                        :topic (w / whisky))
                  :mod (a2 / all))
            :op3 (w2 / wrong-02
                  :ARG1 (a3 / amr-unknown)
                  :ARG2 y))
      :ARG2 (p / person
            :name (n / name
                  :op1 "Jane")))
# ::snt Ollie: oh oh... very strange! i have to be carefull may be there is some spy in my mobile! lol
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Ollie"))
      :ARG1 (a / and
            :op1 (o / oh-oh
                  :mode expressive)
            :op2 (s2 / strange
                  :degree (v / very))
            :op3 (o2 / obligate-01
                  :ARG2 (c / care-04
                        :ARG0 (ii / i))
                  :ARG1-of (c2 / cause-01
                        :ARG0 (p2 / possible-01
                              :ARG1 (s3 / spy-01
                                    :ARG0 (p3 / person
                                          :mod (s4 / some))
                                    :location (m / mobile
                                          :poss ii))))))
      :ARG2-of (l / laugh-01
            :ARG0 ii
            :manner (l2 / loud)))
# ::snt Jane: dont' worry, we'll check on friday.
(s / say-01
      :ARG0 (ii / i)
      :ARG1 (w / worry-01
            :polarity -
            :ARG0 (w2 / we)
            :ARG1-of (c / cause-01
                  :ARG0 (c2 / check-01
                        :ARG0 w2
                        :time (d / date-entity
                              :weekday (f / friday)))))
      :ARG2 (p / person
            :name (n / name
                  :op1 "Jane")))
# ::snt Ollie: don't forget to bring some sun with you
(s / say-01
      :ARG1 (f / forget-01
            :mode imperative
            :polarity -
            :ARG0 (p / person
                  :name (n / name
                        :op1 "Ollie"))
            :ARG1 (b / bring-01
                  :ARG0 p
                  :ARG1 (s2 / sun
                        :quant (s3 / some))
                  :ARG2 p))
      :ARG2 p)
# ::snt Jane: I can't wait to be in Morocco..
(s / say-01
      :ARG0 (ii / i)
      :ARG1 (w / wait-01
            :ARG1 ii
            :ARG2 (b / be-located-at-91
                  :ARG1 ii
                  :ARG2 (c / country
                        :name (n / name
                              :op1 "Morocco"))))
      :ARG2 (p / person
            :name (n2 / name
                  :op1 "Jane")))
# ::snt Ollie: enjoy and see you friday
(s / say-01
      :ARG1 (a / and
            :op1 (e / enjoy-01
                  :ARG0 (p / person
                        :name (n / name
                              :op1 "Ollie")))
            :op2 (s2 / see-01
                  :ARG0 p
                  :ARG1 p
                  :time (d / date-entity
                        :weekday (f / friday))))
      :ARG2 p)
# ::snt Jane: sorry Ollie, i'm very busy, i won't have time for lunch  tomorrow, but may be at 6pm after my courses?this trip to Morocco was so nice, but time consuming!
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Jane"))
      :ARG1 (a / and
            :op1 (s2 / sorry-01
                  :ARG1 p
                  :ARG2 (b / busy-01
                        :ARG1 p
                        :degree (v / very)))
            :op2 (c / contrast-01
                  :ARG1 (h / have-03
                        :polarity -
                        :ARG0 p
                        :ARG1 (t / time
                              :purpose (l / lunch))
                        :time (t2 / tomorrow))
                  :ARG2 (p2 / possible-01
                        :ARG1 (b2 / be-temporally-at-91
                              :ARG1 l
                              :ARG2 (d / date-entity
                                    :time "19:00"
                                    :timezone (a2 / after
                                          :op1 (c2 / course
                                                :poss p)))))))
      :ARG2 (p3 / person
            :name (n2 / name
                  :op1 "Ollie"))
      :ARG1-of (r / request-confirmation-91)
      :ARG2-of (c3 / contrast-01
            :ARG1 (n3 / nice-01
                  :ARG1 (t3 / trip-03
                        :ARG0 p
                        :ARG1 (c4 / country
                              :name (n4 / name
                                    :op1 "Morocco"))
                        :mod (t4 / this))
                  :degree (s3 / so))
            :ARG2 (c5 / consume-01
                  :ARG0 t3
                  :ARG1 (t5 / time))))
# ::snt Ollie: ok for tea!
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Ollie"))
      :ARG1 (o / okay-04
            :ARG2 (t / tea)))
# ::snt Jane: I'm on my way..
(s / say-01
      :ARG0 (ii / i)
      :ARG1 (b / be-destined-for-91
            :ARG1 ii
            :ARG2 (w / way
                  :poss ii))
      :ARG2 (p / person
            :name (n / name
                  :op1 "Jane")))
# ::snt Ollie: tea is ready, did you bring the pastries?
(s / say-01
      :ARG0 (ii / i)
      :ARG1 (a / and
            :op1 (r / ready-02
                  :ARG1 (t / tea))
            :op2 (b / bring-01
                  :ARG0 (p / person
                        :name (n / name
                              :op1 "Ollie"))
                  :ARG1 (p2 / pastry)
                  :polarity (a2 / amr-unknown)))
      :ARG2 p)
# ::snt Jane: I already ate them all... see you in a minute
(s / say-01
      :ARG0 (ii / i)
      :ARG1 (a / and
            :op1 (e / eat-01
                  :ARG0 ii
                  :ARG1 (t / they
                        :mod (a2 / all))
                  :time (a3 / already))
            :op2 (s2 / see-01
                  :ARG0 ii
                  :ARG1 (p / person
                        :name (n / name
                              :op1 "Jane"))
                  :time (a4 / after
                        :op1 (n2 / now)
                        :quant (t2 / temporal-quantity
                              :quant 1
                              :unit (m / minute)))))
      :ARG2 p)
# ::snt Ollie: ok
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Ollie"))
      :ARG1 (o / okay-01))
#******************************
# ::snt Jane is in Warsaw. Ollie and Jane has a party. Jane lost her calendar. They will get a lunch this week on Friday. Ollie accidentally called Jane and talked about whisky. Jane cancels lunch. They'll meet for a tea at 6 pm.
(m / multi-sentence
      :snt1 (b / be-located-at-91
            :ARG1 (p / person
                  :name (n / name
                        :op1 "Jane"))
            :ARG2 (c / city
                  :name (n2 / name
                        :op1 "Warsaw")))
      :snt2 (p2 / party-01
            :ARG0 (a / and
                  :op1 (p3 / person
                        :name (n3 / name
                              :op1 "Ollie"))
                  :op2 p))
      :snt3 (l / lose-02
            :ARG0 (p4 / person
                  :name (n4 / name
                        :op1 "Jane"))
            :ARG1 (c2 / calendar
                  :poss p4))
      :snt4 (a2 / and
            :op1 (g / get-01
                  :ARG0 (t / they)
                  :ARG1 (l2 / lunch)
                  :time (w / week
                        :mod (t2 / this))
                  :time (d / date-entity
                        :weekday (f / friday)))
            :op2 (t3 / talk-01
                  :ARG0 (p5 / person
                        :name (n5 / name
                              :op1 "Ollie"))
                  :ARG1 (w2 / whisky)
                  :ARG2 p4)
            :snt5 (c3 / cancel-01
                  :ARG0 p4
                  :ARG1 (l3 / lunch))
            :snt6 (m2 / meet-03
                  :ARG0 t)
            :ARG1 (p6 / person
                  :name (n6 / name
                        :op1 "Jane"))
            :purpose (t4 / tea)
            :time (d2 / date-entity
                  :time "18:00")))
#------------------------------------------------------------
#5
# ::snt Benjamin: Hey guys, what are we doing with the keys today?
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Benjamin"))
      :ARG1 (d / do-02
            :ARG0 (w / we)
            :ARG1 (a / amr-unknown)
            :ARG2 (k / key)
            :time (t / today))
      :ARG2 (g / guy)
      :mod (h / hey
            :mode expressive))
# ::snt Hilary: I've got them. Whoever wants them can meet me at lunchtime or after
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Hilary"))
      :ARG1 (g / get-01
            :ARG0 p
            :ARG1 (t / they))
      :ARG2 (p2 / possible-01
            :ARG1 (m / meet-03
                  :ARG0 (p3 / person
                        :ARG0-of (w / want-01
                              :ARG1 t)
                        :mod (a / any))
                  :ARG1 p
                  :time (o / or
                        :op1 (l / lunch-01)
                        :op2 (a2 / after
                              :op1 l)))))
# ::snt Elliot: I'm ok. We're meeting for the drinks in the evening anyway and I guess we'll be going back to the apartment together?
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Elliot"))
      :ARG1 (a / and
            :op1 (o / okay-04
                  :ARG1 (ii / i))
            :op2 (m / meet-03
                  :ARG0 (w / we)
                  :purpose (d / drink-01
                        :ARG0 w)
                  :time (d2 / date-entity
                        :dayperiod (e / evening))
                  :mod (a2 / anyway))
            :op3 (g / guess-01
                  :ARG0 ii
                  :ARG1 (g2 / go-02
                        :ARG0 w
                        :ARG4 (a3 / apartment)
                        :direction (b / back)
                        :manner (t / together)))))
# ::snt Hilary: Yeah, I guess so
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Hilary"))
      :ARG1 (g / guess-01
            :ARG0 (ii / i)
            :ARG1 (s2 / so)
            :mod (y / yeah
                  :mode expressive)))
# ::snt Daniel: I'm with Hilary atm and won't let go of her for the rest of the day, so any option you guys choose is good for me
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Daniel"))
      :ARG1 (c / cause-01
            :ARG0 (a / and
                  :op1 (b / be-with-10
                        :ARG0 (ii / i)
                        :ARG1 (p2 / person
                              :name (n2 / name
                                    :op1 "Hilary"))
                        :time (a2 / at-magnitude))
                  :op2 (l / let-01
                        :polarity -
                        :ARG0 ii
                        :ARG1 (g / go-01
                              :ARG1 p2)
                        :duration (r / rest
                              :part-of (d / day))))
            :ARG1 (g2 / good-04
                  :ARG1 (o / option
                        :mod (a3 / any)
                        :ARG1-of (c2 / choose-01
                              :ARG0 (y / you
                                    :mod (g3 / guy))))
                  :ARG2 ii)))
# ::snt Benjamin: Hmm I might actually pass by at lunchtime, take the keys and go take a nap. I'm sooo tired after yesterday
(m / multi-sentence
      :snt1 (s / say-01
            :ARG0 (p / person
                  :name (n / name
                        :op1 "Benjamin"))
            :ARG1 (p2 / possible-01
                  :ARG1 (a / and
                        :op1 (p3 / pass-by-17
                              :ARG0 p
                              :time (l / lunch-01)
                              :ARG1-of (a2 / actual-02))
                        :op2 (t / take-01
                              :ARG0 p
                              :ARG1 (k / key))
                        :op3 (g / go-05
                              :ARG0 p
                              :ARG1 (n2 / nap-01
                                    :ARG0 p)))
                  :mod (h / hmm
                        :mode expressive)))
      :snt2 (t2 / tire-01
            :ARG1 (ii / i)
            :degree (s2 / so)
            :time (a3 / after
                  :op1 (y / yesterday))))
# ::snt Hilary: Sounds good. We'll be having lunch with some French people (the ones who work on the history of food in colonial Mexico - I already see you yawning your head off)
(m / multi-sentence
      :snt1 (s / say-01
            :ARG0 (p / person
                  :name (n / name
                        :op1 "Hilary"))
            :ARG1 (s2 / sound-01
                  :ARG2 (g / good-02)))
      :snt2 (h / have-06
            :ARG0 (w / we)
            :ARG1 (l / lunch-01
                  :ARG0 w
                  :accompanier (p2 / person
                        :mod (c / country
                              :name (n2 / name
                                    :op1 "France"))
                        :quant (s3 / some)
                        :ARG0-of (w2 / work-01
                              :ARG1 (h2 / history
                                    :topic (f / food)
                                    :location (c2 / country
                                          :name (n3 / name
                                                :op1 "Mexico")
                                          :mod (c3 / colonial))))))
            :snt3 (s4 / see-01
                  :ARG0 (ii / i)
                  :ARG1 (y / yawn-01
                        :ARG0 (y2 / you
                              :part (h3 / head))
                        :degree (o / off))
                  :time (a / already))))
# ::snt Benjamin: YAAAAWN 🙊 Where and where are you meeting?
(s / say-01
      :mode expressive
      :ARG0 (p / person
            :name (n / name
                  :op1 "Benjamin"))
      :ARG1 (a / and
            :op1 (y / yay
                  :mode expressive)
            :op2 (b / be-located-at-91
                  :ARG1 (m / meet-03
                        :ARG0 (y2 / you))
                  :ARG2 (a2 / amr-unknown))))
# ::snt Hilary: So I'm meeting them at the entrance to the conference hall at 2 pm and then we'll head to this place called La Cantina. Italian cuisine, which is quite funny, but that's what they've chosen
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Hilary"))
      :ARG1 (a / and
            :op1 (m / meet-03
                  :ARG0 (ii / i)
                  :ARG1 (t / they)
                  :location (e / entrance
                        :destination (h / hall
                              :mod (c / conference)))
                  :time (d / date-entity
                        :time "14:00"))
            :op2 (h2 / head-02
                  :ARG0 (w / we)
                  :ARG1 (p2 / place
                        :name (n2 / name
                              :op1 "La"
                              :op2 "Cantina")
                        :mod (t2 / this)
                        :mod (c2 / cuisine
                              :mod (c3 / country
                                    :name (n3 / name
                                          :op1 "Italy")))
                        :mod (f / funny
                              :degree (q / quite)
                              :ARG1-of (c4 / contrast-01
                                    :ARG2 (c5 / choose-01
                                          :ARG0 t
                                          :ARG1 (t3 / that)))))
                  :time (t4 / then))))
# ::snt Benjamin: Interesting 😱 To be honest, Hilary, I almost feel like changing my mind. Wanting to take this nap might end up costing me to dear
(m / multi-sentence
      :snt1 (s / say-01
            :ARG0 (p / person
                  :name (n / name
                        :op1 "Benjamin"))
            :ARG1 (ii / interest-01
                  :mode expressive))
      :snt2 (s2 / say-01
            :ARG0 (ii2 / i)
            :ARG1 (f / feel-06
                  :ARG0 ii2
                  :ARG1 (c / change-01
                        :ARG0 ii2
                        :ARG1 (m2 / mind-05
                              :ARG0 ii2))
                  :mod (a / almost)
                  :ARG1-of (h / honest-01))
            :ARG2 (p2 / person
                  :name (n2 / name
                        :op1 "Hilary")))
      :snt3 (p3 / possible-01
            :ARG1 (e / end-up-03
                  :ARG1 (w / want-01
                        :ARG0 ii2
                        :ARG1 (n3 / nap-01
                              :ARG0 ii2
                              :mod (t / this)))
                  :ARG2 (c2 / cost-01
                        :ARG2 (d / dear)
                        :ARG3 ii2))))
# ::snt Hilary: Oh come on 😂
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Hilary"))
      :ARG1 (c / come-on-25
            :mode imperative
            :ARG1 (y / you)
            :mod (o / oh
                  :mode expressive)))
# ::snt Benjamin: All these terrible obstacles on mu way to bed might just prove to much to take
(s / say-01
      :ARG1 (p / possible-01
            :ARG1 (p2 / prove-01
                  :ARG0 (o / obstacle
                        :ARG1-of (t / terrible-01)
                        :mod (t2 / this)
                        :mod (a / all)
                        :location (w / way
                              :direction (b / bed)))
                  :ARG1 (h / have-quant-91
                        :ARG1 o
                        :ARG2 (m / much)
                        :ARG3 (t3 / too)
                        :ARG6 (t4 / take-01))
                  :mod (j / just)))
      :ARG2 (p3 / person
            :name (n / name
                  :op1 "Benjamin")))
# ::snt Hilary: We'll try to avoid talking about their subject of research. Oh wait, no, I'm actually meeting them because I wanted to chat about their research lol
(m / multi-sentence
      :snt1 (s / say-01
            :ARG0 (p / person
                  :name (n / name
                        :op1 "Hilary"))
            :ARG1 (t / try-01
                  :ARG0 (w / we)
                  :ARG1 (a / avoid-01
                        :ARG0 w
                        :ARG1 (t2 / talk-01
                              :ARG0 w
                              :ARG1 (s2 / subject
                                    :topic-of (r / research-01
                                          :ARG0 (t3 / they)))))))
      :snt2 (a2 / and
            :op1 (w2 / wait-01
                  :mode imperative
                  :ARG1 (y / you))
            :op2 (m2 / meet-02
                  :ARG0 (ii / i)
                  :ARG1 t3
                  :ARG1-of (a3 / actual-02)
                  :ARG1-of (c / cause-01
                        :ARG0 (w3 / want-01
                              :ARG0 ii
                              :ARG1 (c2 / chat-01
                                    :ARG0 ii
                                    :ARG1 s2)
                              :ARG2-of (l / laugh-01
                                    :ARG0 ii
                                    :manner (l2 / loud)))))))
# ::snt Elliot: 🙉
(p / person
      :name (n / name
            :op1 "Elliot"))
# ::snt Hilary: Do join us, we're going to have fun. And then you'll take the keys and take this most deserved of naps
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Hilary"))
      :ARG1 (a / and
            :op1 (j / join-04
                  :mode imperative
                  :ARG0 (y / you)
                  :ARG1 (w / we)
                  :ARG2 (f / fun-01
                        :ARG0 w))
            :op2 (a2 / and
                  :op1 (t / take-01
                        :ARG0 y
                        :ARG1 (k / key))
                  :op2 (t2 / take-01
                        :ARG0 y
                        :ARG1 (n2 / nap-01
                              :ARG0 y
                              :mod (t3 / this)
                              :ARG1-of (h / have-degree-91
                                    :ARG2 (d / deserve-01
                                          :ARG1 n2)
                                    :ARG3 (m / most)
                                    :ARG5 (n3 / nap-01))))
                  :time (t4 / then))))
# ::snt Elliot: Sounds like a plan 😂
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Elliot"))
      :ARG1 (s2 / sound-01
            :ARG2 (p2 / plan))
      :ARG3 (l / laugh-01
            :mode expressive
            :ARG0 p))
# ::snt Hilary: 😎
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Hilary"))
      :ARG1 (a / amr-unintelligible
            :value " 😎"))
# ::snt Elliot: See you at 2 then xx
(s / say-01
      :ARG0 (ii / i)
      :ARG1 (s2 / see-01
            :ARG0 ii
            :ARG1 (y / you)
            :time (d / date-entity
                  :time "14:00")
            :mod (t / then))
      :ARG2 (p / person
            :name (n / name
                  :op1 "Elliot")))
#******************************
# ::snt Hilary has the keys to the apartment. Benjamin wants to get them and go take a nap. Hilary is having lunch with some French people at La Cantina. Hilary is meeting them at the entrance to the conference hall at 2 pm. Benjamin and Elliot might join them. They're meeting for the drinks in the evening.
(m / multi-sentence
      :snt1 (h / have-03
            :ARG0 (p / person
                  :name (n / name
                        :op1 "Hilary"))
            :ARG1 (k / key
                  :mod (a / apartment)))
      :snt2 (a2 / and
            :op1 (w / want-01
                  :ARG0 (p2 / person
                        :name (n2 / name
                              :op1 "Benjamin"))
                  :ARG1 (a3 / and
                        :op1 (g / get-01
                              :ARG0 p2
                              :ARG1 (t / they))
                        :op2 (n3 / nap-01
                              :ARG0 p2)))
            :snt3 (l / lunch-01
                  :ARG0 (p3 / person
                        :name (n4 / name
                              :op1 "Hilary"))
                  :accompanier (p4 / person
                        :mod (c / country
                              :name (n5 / name
                                    :op1 "France"))
                        :quant (s / some))
                  :location (f / facility
                        :name (n6 / name
                              :op1 "La"
                              :op2 "Cantina")))
            :snt4 (m2 / meet-03
                  :ARG0 p
                  :ARG1 (t2 / they)
                  :location (e / entrance
                        :destination (h2 / hall
                              :mod (c2 / conference)))
                  :time (d / date-entity
                        :time "14:00"))
            :snt5 (p5 / possible-01
                  :ARG1 (j / join-01
                        :ARG0 (a4 / and
                              :op1 (p6 / person
                                    :name (n7 / name
                                          :op1 "Benjamin"))
                              :op2 (p7 / person
                                    :name (n8 / name
                                          :op1 "Elliot")))
                        :ARG1 (t3 / they)))
            :snt6 (m3 / meet-03
                  :ARG0 (t4 / they)
                  :purpose (d2 / drink-01)
                  :time d
                  :dayperiod (e2 / evening))))
#------------------------------------------------------------
#6
# ::snt Max: Know any good sites to buy clothes from?
(a / ask-01
      :ARG0 (ii / i)
      :ARG1 (k / know-01
            :ARG0 (p / person
                  :name (n / name
                        :op1 "Max"))
            :ARG1 (s / site
                  :ARG1-of (g / good-02)
                  :ARG2-of (b / buy-01
                        :ARG0 p
                        :ARG1 (c / clothes)))
            :polarity (a2 / amr-unknown))
      :ARG2 p)
# ::snt Payton: Sure :) <file_other> <file_other> <file_other> <file_other> <file_other> <file_other> <file_other>
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Payton"))
      :ARG1 (s2 / sure-02
            :mode expressive
            :ARG1 (a / and
                  :op1 (f / file)
                  :op2 (f2 / file)
                  :op3 (o / other))))
# ::snt Max: That's a lot of them!
(s / say-01
      :mode expressive
      :ARG0 (p / person
            :name (n / name
                  :op1 "Max"))
      :ARG1 (t / they
            :quant (l / lot)
            :domain (t2 / that)))
# ::snt Payton: Yeah, but they have different things so I usually buy things from 2 or 3 of them.
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Payton"))
      :ARG1 (c / contrast-01
            :ARG1 (y / yeah)
            :ARG2 (h / have-03
                  :ARG0 (t / they)
                  :ARG1 (t2 / thing
                        :ARG1-of (d / differ-02))
                  :ARG0-of (c2 / cause-01
                        :ARG1 (b / buy-01
                              :ARG0 p
                              :ARG1 (t3 / thing)
                              :ARG2 (o / or
                                    :op1 2
                                    :op2 3)
                              :mod (u / usual))))))
# ::snt Max: I'll check them out. Thanks.
(m / multi-sentence
      :snt1 (s / say-01
            :ARG0 (p / person
                  :name (n / name
                        :op1 "Max"))
            :ARG1 (c / check-out-05
                  :ARG0 (ii / i)
                  :ARG1 (t / they)))
      :snt2 (t2 / thank-01
            :ARG0 ii)
      :ARG1 (y / you))
# ::snt Payton: No problem :)
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Payton"))
      :ARG1 (p2 / problem
            :polarity -))
# ::snt Max: How about u?
(a / ask-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Max"))
      :ARG1 (a2 / amr-unknown
            :domain (y / you)))
# ::snt Payton: What about me?
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Payton"))
      :ARG1 (a / amr-unknown
            :topic p))
# ::snt Max: Do u like shopping?
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Max"))
      :ARG1 (l / like-01
            :ARG0 (y / you)
            :ARG1 (s2 / shop-01
                  :ARG0 y)
            :polarity (a / amr-unknown)))
# ::snt Payton: Yes and no.
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Payton"))
      :ARG1 (a / and
            :op1 (y / yes)
            :op2 (n2 / no)))
# ::snt Max: How come?
(a / ask-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Max"))
      :ARG1 (a2 / amr-unknown
            :ARG0-of (c / cause-01)))
# ::snt Payton: I like browsing, trying on, looking in the mirror and seeing how I look, but not always buying.
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Payton"))
      :ARG1 (c / contrast-01
            :ARG1 (l / like-01
                  :ARG0 (ii / i)
                  :ARG1 (a / and
                        :op1 (b / browse-01
                              :ARG0 ii)
                        :op2 (t / try-on-04
                              :ARG0 ii)
                        :op3 (l2 / look-01
                              :ARG0 ii
                              :ARG1 (m / mirror))
                        :op4 (s2 / see-01
                              :ARG0 ii
                              :ARG1 (t2 / thing
                                    :ARG1-of (l3 / look-02
                                          :ARG0 ii)))))
            :ARG2 (b2 / buy-01
                  :ARG0 ii
                  :time (a2 / always
                        :polarity -))))
# ::snt Max: Y not?
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Max"))
      :ARG1 (y / y
            :polarity -)
      :polarity (a / amr-unknown))
# ::snt Payton: Isn't it obvious? ;)
(s / say-01
      :ARG1 (o / obvious-01
            :polarity -
            :ARG1 (ii / it)
            :polarity (a / amr-unknown))
      :ARG2 (p / person
            :name (n / name
                  :op1 "Payton")))
# ::snt Max: Sry ;)
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Max"))
      :ARG1 (s2 / serious-01))
# ::snt Payton: If I bought everything I liked, I'd have nothing left to live on ;)
(s / say-01
      :ARG1 (h / have-03
            :ARG0 (ii / i)
            :ARG1 (n / nothing
                  :ARG1-of (l / leave-17
                        :purpose (l2 / live-on-03
                              :ARG1 ii)))
            :condition (b / buy-01
                  :ARG0 ii
                  :ARG1 (e / everything
                        :ARG1-of (l3 / like-01
                              :ARG0 ii))))
      :ARG2 (p / person
            :name (n2 / name
                  :op1 "Payton")))
# ::snt Max: Same here, but probably different category ;)
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Max"))
      :ARG1 (c / contrast-01
            :ARG1 (s2 / same-01
                  :location (h / here))
            :ARG2 (p2 / probable
                  :domain (c2 / category
                        :ARG1-of (d / differ-02)))))
# ::snt Payton: Lol
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Payton"))
      :ARG1 (l / laugh-01
            :mode expressive
            :ARG0 p
            :manner (l2 / loud)))
# ::snt Max: So what do u usually buy?
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Max"))
      :ARG1 (b / buy-01
            :ARG0 (y / you)
            :ARG1 (a / amr-unknown)
            :mod (u / usual)))
# ::snt Payton: Well, I have 2 things I must struggle to resist!
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Payton"))
      :ARG1 (o / obligate-01
            :ARG2 (s2 / struggle-02
                  :ARG0 p
                  :ARG1 (r / resist-01
                        :ARG0 p
                        :ARG1 (t / thing
                              :quant 2)))
            :mod (w / well)))
# ::snt Max: Which are?
(a / ask-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Max"))
      :ARG1 (a2 / amr-unknown))
# ::snt Payton: Clothes, ofc ;)
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Payton"))
      :ARG1 (c / clothes
            :mod (o / of-course)))
# ::snt Max: Right. And the second one?
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Max"))
      :ARG1 (a / and
            :op1 (r / right-06)
            :op2 (a2 / amr-unknown
                  :domain (o / one
                        :ord (o2 / ordinal-entity
                              :value 2)))))
# ::snt Payton: Books. I absolutely love reading!
(m / multi-sentence
      :snt1 (b / book)
      :snt2 (p / person
            :name (n / name
                  :op1 "Payton"))
      :snt3 (l / love-01
            :ARG0 (ii / i)
            :ARG1 (r / read-01
                  :ARG0 ii)
            :degree (a / absolute)))
# ::snt Max: Gr8! What books do u read?
(s / say-01
      :mode expressive
      :ARG0 (p / person
            :name (n / name
                  :op1 "Max"))
      :ARG1 (r / read-01
            :ARG0 (y / you)
            :ARG1 (a / amr-unknown
                  :mod (b / book)))
      :mod (g / grade
            :mod 8))
# ::snt Payton: Everything I can get my hands on :)
(s / say-01
      :ARG1 (e / everything
            :ARG1-of (ii / in-ones-hands-04
                  :ARG0 (ii2 / i)
                  :ARG1-of (p / possible-01)))
      :ARG2 (p2 / person
            :name (n / name
                  :op1 "Payton")))
# ::snt Max: Srsly?
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Max"))
      :ARG1 (s2 / serious-01)
      :polarity (a / amr-unknown))
# ::snt Payton: Yup :)
(s / say-01
      :mode expressive
      :ARG0 (p / person
            :name (n / name
                  :op1 "Payton"))
      :ARG1 (y / yup))
#******************************
# ::snt Payton provides Max with websites selling clothes. Payton likes browsing and trying on the clothes but not necessarily buying them. Payton usually buys clothes and books as he loves reading.
(m / multi-sentence
      :snt1 (p / provide-01
            :ARG0 (p2 / person
                  :name (n / name
                        :op1 "Payton"))
            :ARG1 (w / website
                  :ARG0-of (s / sell-01
                        :ARG1 (c / clothes)))
            :ARG2 (p3 / person
                  :name (n2 / name
                        :op1 "Max")))
      :snt2 (c2 / contrast-01
            :ARG1 (l / like-01
                  :ARG0 (p4 / person
                        :name (n3 / name
                              :op1 "Payton"))
                  :ARG1 (a / and
                        :op1 (b / browse-01
                              :ARG0 p4
                              :ARG1 (c3 / clothes))
                        :op2 (t / try-04
                              :ARG0 p4
                              :ARG1 c3)))
            :ARG2 (n4 / need-01
                  :polarity -
                  :ARG1 (b2 / buy-01
                        :ARG0 p4
                        :ARG1 c3)))
      :snt3 (b3 / buy-01
            :ARG0 (p5 / person
                  :name (n5 / name
                        :op1 "Payton"))
            :ARG1 (a2 / and
                  :op1 (c4 / clothes)
                  :op2 (b4 / book))
            :mod (u / usual)
            :ARG1-of (c5 / cause-01
                  :ARG0 (l2 / love-01
                        :ARG0 p5
                        :ARG1 (r / read-01
                              :ARG0 p5)))))
#------------------------------------------------------------
#7
# ::snt Rita: I'm so bloody tired. Falling asleep at work. :-(
(m / multi-sentence
      :snt1 (s / say-01
            :ARG0 (p / person
                  :name (n / name
                        :op1 "Rita"))
            :ARG1 (t / tire-01
                  :ARG1 (ii / i)
                  :mod (b / bloody)
                  :degree (s2 / so)))
      :snt2 (f / fall-07
            :ARG1 ii
            :ARG2 (s3 / sleep-01
                  :ARG0 ii)
            :location (w / work-01)
            :mod (e / emoticon
                  :value ":-( emoticon :value ")))
# ::snt Tina: I know what you mean.
(s / say-01
      :ARG0 (ii / i)
      :ARG1 (k / know-01
            :ARG0 ii
            :ARG1 (t / thing
                  :ARG2-of (m / mean-01
                        :ARG0 (y / you))))
      :ARG2 (p / person
            :name (n / name
                  :op1 "Tina")))
# ::snt Tina: I keep on nodding off at my keyboard hoping that the boss doesn't notice..
(s / say-01
      :ARG0 (ii / i)
      :ARG1 (k / keep-02
            :ARG0 ii
            :ARG1 (n / nod-off-02
                  :ARG0 ii
                  :location (k2 / keyboard
                        :poss ii)
                  :manner (h / hope-01
                        :ARG0 ii
                        :ARG1 (n2 / notice-01
                              :polarity -
                              :ARG0 (b / boss)))))
      :ARG2 (p / person
            :name (n3 / name
                  :op1 "Tina")))
# ::snt Rita: The time just keeps on dragging on and on and on....
(s / say-01
      :ARG1 (k / keep-02
            :ARG1 (d / drag-01
                  :ARG0 (t / time)
                  :mod (j / just)))
      :ARG2 (p / person
            :name (n / name
                  :op1 "Rita")))
# ::snt Rita: I keep on looking at the clock and there's still 4 hours of this drudgery to go.
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Rita"))
      :ARG1 (a / and
            :op1 (k / keep-02
                  :ARG0 (ii / i)
                  :ARG1 (l / look-01
                        :ARG0 ii
                        :ARG1 (c / clock)))
            :op2 (g / go-06
                  :ARG0 (d / drudgery
                        :mod (t / this)
                        :duration (t2 / temporal-quantity
                              :quant 4
                              :unit (h / hour)))
                  :mod (s2 / still))))
# ::snt Tina: Times like these I really hate my work.
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Tina"))
      :ARG1 (h / hate-01
            :ARG0 (ii / i)
            :ARG1 (w / work-01
                  :ARG0 ii)
            :degree (r / really)
            :time (t / time
                  :ARG1-of (r2 / resemble-01
                        :ARG2 (t2 / this)))))
# ::snt Rita: I'm really not cut out for this level of boredom.
(s / say-01
      :ARG1 (c / cut-out-09
            :polarity -
            :ARG1 (ii / i)
            :ARG2 (l / level
                  :degree-of (b / bore-02
                        :ARG1 ii)
                  :mod (t / this))
            :ARG1-of (r / real-04))
      :ARG2 (p / person
            :name (n / name
                  :op1 "Rita")))
# ::snt Tina: Neither am I.
(s / say-01
      :ARG0 (ii / i)
      :ARG1 (n / neither
            :domain ii)
      :ARG2 (p / person
            :name (n2 / name
                  :op1 "Tina")))
#******************************
# ::snt Rita and Tina are bored at work and have still 4 hours left.
(a / and
      :op1 (b / bore-02
            :ARG0 (w / work-01
                  :ARG0 (a2 / and
                        :op1 (p / person
                              :name (n / name
                                    :op1 "Rita"))
                        :op2 (p2 / person
                              :name (n2 / name
                                    :op1 "Tina"))))
            :ARG1 a2)
      :op2 (l / leave-17
            :ARG0 a2
            :ARG1 (t / temporal-quantity
                  :quant 4
                  :unit (h / hour))
            :mod (s / still)))
#------------------------------------------------------------
#8
# ::snt Beatrice: I am in town, shopping. They have nice scarfs in the shop next to the church. Do you want one?
(m / multi-sentence
      :snt1 (s / say-01
            :ARG0 (p / person
                  :name (n / name
                        :op1 "Beatrice"))
            :ARG1 (a / and
                  :op1 (b / be-located-at-91
                        :ARG1 (ii / i)
                        :ARG2 (t / town))
                  :op2 (s2 / shop-01
                        :ARG0 ii)))
      :snt2 (h / have-03
            :ARG0 (t2 / they)
            :ARG1 (s3 / scarf
                  :ARG1-of (n2 / nice-01))
            :location (s4 / shop
                  :location (n3 / next-to
                        :op1 (c / church)))
            :polarity (a2 / amr-unknown)))
# ::snt Leo: No, thanks
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Leo"))
      :ARG1 (a / and
            :op1 (n2 / no)
            :op2 (t / thank-01
                  :ARG0 p
                  :ARG1 (y / you))))
# ::snt Beatrice: But you don't have a scarf.
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Beatrice"))
      :ARG1 (c / contrast-01
            :ARG2 (h / have-03
                  :polarity -
                  :ARG0 (y / you)
                  :ARG1 (s2 / scarf))))
# ::snt Leo: Because I don't need it.
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Leo"))
      :ARG1 (c / cause-01
            :ARG0 (n2 / need-01
                  :polarity -
                  :ARG0 p
                  :ARG1 (ii / it))))
# ::snt Beatrice: Last winter you had a cold all the time. A scarf could help.
(s / say-01
      :ARG1 (p / possible-01
            :ARG1 (h / help-01
                  :ARG0 (s2 / scarf)))
      :ARG2 (p2 / person
            :name (n / name
                  :op1 "Beatrice")
            :ARG0-of (h2 / have-03
                  :ARG1 (c / cold-01)
                  :time (d / date-entity
                        :season (w / winter)
                        :mod (y / year
                              :mod (l / last)))
                  :frequency (t / time
                        :mod (a / all)))))
# ::snt Leo: I don't like them.
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Leo"))
      :ARG1 (d / dislike-01
            :ARG0 (ii / i)
            :ARG1 (t / they)))
# ::snt Beatrice: Actually, I don't care. You will get a scarf.
(m / multi-sentence
      :snt1 (s / say-01
            :ARG0 (p / person
                  :name (n / name
                        :op1 "Beatrice"))
            :ARG1 (c / care-01
                  :polarity -
                  :ARG0 (ii / i)
                  :ARG1-of (a / actual-02)))
      :snt2 (g / get-01
            :ARG0 (y / you)
            :ARG1 (s2 / scarf)))
# ::snt Leo: How understanding of you!
(s / say-01
      :ARG1 (u / understand-01
            :ARG1 (y / you)
            :degree (s2 / so))
      :ARG2 (p / person
            :name (n / name
                  :op1 "Leo")))
# ::snt Beatrice: You were complaining the whole winter that you're going to die. I've had enough.
(s / say-01
      :ARG0 (ii / i)
      :ARG1 (b / be-it-06
            :ARG1 ii)
      :ARG2 (c / complain-01
            :ARG0 (p / person
                  :name (n / name
                        :op1 "Beatrice"))
            :ARG1 (d / die-01
                  :ARG1 p)
            :duration (w / winter
                  :mod (w2 / whole))))
# ::snt Leo: Eh.
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Leo"))
      :ARG1 (e / eh))
#******************************
# ::snt Beatrice wants to buy Leo a scarf, but he doesn't like scarves. She cares about his health and will buy him a scarf no matter his opinion.
(m / multi-sentence
      :snt1 (c / contrast-01
            :ARG1 (w / want-01
                  :ARG0 (p / person
                        :name (n / name
                              :op1 "Beatrice"))
                  :ARG1 (b / buy-01
                        :ARG0 p
                        :ARG1 (s / scarf)
                        :ARG4 (p2 / person
                              :name (n2 / name
                                    :op1 "Leo"))))
            :ARG2 (d / dislike-01
                  :ARG0 p2
                  :ARG1 (s2 / scarf)))
      :snt2 (a / and
            :op1 (c2 / care-01
                  :ARG0 (s3 / she)
                  :ARG1 (h / health
                        :poss (h2 / he)))
            :op2 (b2 / buy-01
                  :ARG0 s3
                  :ARG1 (s4 / scarf)
                  :ARG4 h2
                  :ARG1-of (r / regardless-91
                        :ARG2 (o / opine-01
                              :ARG0 h2)))))
#------------------------------------------------------------
#9
# ::snt Ivan: hey eric
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Ivan"))
      :ARG1 (h / hey
            :mode expressive)
      :ARG2 (p2 / person
            :name (n2 / name
                  :op1 "Eric")))
# ::snt Eric: yeah man
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Eric"))
      :ARG1 (y / yeah)
      :ARG2 (m / man))
# ::snt Ivan: so youre coming to the wedding
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Ivan"))
      :ARG1 (c / come-01
            :ARG1 (y / you)
            :ARG4 (w / wed-01))
      :polarity (a / amr-unknown))
# ::snt Eric: your brother's
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Eric"))
      :ARG1 (p2 / person
            :ARG0-of (h / have-rel-role-91
                  :ARG1 (y / you)
                  :ARG2 (b / brother))))
# ::snt Ivan: yea
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Ivan"))
      :ARG1 (y / yea))
# ::snt Eric: i dont know mannn
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Eric"))
      :ARG1 (k / know-01
            :polarity -
            :ARG0 p)
      :ARG2 (p2 / person
            :name (n2 / name
                  :op1 "Mannn")))
# ::snt Ivan: YOU DONT KNOW??
(s / say-01
      :ARG0 (ii / i)
      :ARG1 (k / know-01
            :polarity -
            :ARG0 (p / person
                  :name (n / name
                        :op1 "Ivan"))
            :polarity (a / amr-unknown))
      :ARG2 p)
# ::snt Eric: i just have a lot to do at home, plus i dont know if my parents would let me
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Eric"))
      :ARG1 (a / and
            :op1 (o / obligate-01
                  :ARG2 (d / do-02
                        :ARG0 p
                        :ARG1 (l / lot)
                        :location (h / home))
                  :mod (j / just))
            :op2 (k / know-01
                  :polarity -
                  :ARG0 p
                  :ARG1 (t / truth-value
                        :polarity-of (l2 / let-01
                              :ARG0 (p2 / person
                                    :ARG0-of (h2 / have-rel-role-91
                                          :ARG1 p
                                          :ARG2 (p3 / parent)))
                              :ARG1 p)))))
# ::snt Ivan: ill take care of your parents
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Ivan"))
      :ARG1 (c / care-03
            :ARG0 (ii / i)
            :ARG1 (p2 / person
                  :ARG0-of (h / have-rel-role-91
                        :ARG1 (y / you)
                        :ARG2 (p3 / parent)))
            :mod (ii2 / ill)))
# ::snt Eric: youre telling me you have the guts to talk to them XD
(s / say-01
      :mode expressive
      :ARG0 (p / person
            :name (n / name
                  :op1 "Eric"))
      :ARG1 (t / tell-01
            :ARG0 (y / you)
            :ARG1 (h / have-03
                  :ARG0 y
                  :ARG1 (g / gut
                        :purpose (t2 / talk-01
                              :ARG0 y
                              :ARG2 (t3 / they))))
            :ARG2 p))
# ::snt Ivan: thats my problem
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Ivan"))
      :ARG1 (p2 / problem
            :poss p
            :domain (t / that)))
# ::snt Eric: okay man, if you say so
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Eric"))
      :ARG1 (o / okay-01
            :condition (s2 / say-01
                  :ARG0 (m / man)
                  :ARG1 (s3 / so)))
      :ARG2 m)
# ::snt Ivan: yea just be there
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Ivan"))
      :ARG1 (g / go-02
            :mode imperative
            :ARG0 (y / you)
            :ARG4 (t / there)
            :mod (j / just)))
# ::snt Eric: alright
(s / say-01
      :ARG0 (p / person
            :name (n / name
                  :op1 "Eric"))
      :ARG1 (a / all-right))
#******************************
# ::snt Eric doesn't know if his parents let him go to Ivan's brother's wedding. Ivan will talk to them.
(m / multi-sentence
      :snt1 (k / know-01
            :polarity -
            :ARG0 (p / person
                  :name (n / name
                        :op1 "Eric"))
            :ARG1 (t / truth-value
                  :polarity-of (l / let-01
                        :ARG0 (p2 / person
                              :ARG0-of (h / have-rel-role-91
                                    :ARG1 p
                                    :ARG2 (p3 / parent)))
                        :ARG1 (g / go-02
                              :ARG0 p
                              :ARG4 (w / wed-01
                                    :ARG1 (p4 / person
                                          :ARG0-of (h2 / have-rel-role-91
                                                :ARG1 (p5 / person
                                                      :name (n2 / name
                                                            :op1 "Ivan"))
                                                :ARG2 (b / brother))))))))
      :snt2 (t2 / talk-01
            :ARG0 p5
            :ARG2 (t3 / they)))
#------------------------------------------------------------
