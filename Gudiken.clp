(defrule pertanyaan1
    =>
    (assert (returnans))

)
(defrule gejala1
    (returnans)
    => 
    (printout t crlf "Apakah anda sering gatal gatal?(y/n)" crlf)
    (bind ?ans (read))
    (if (eq ?ans y) then 
    (assert (gatal gatal))
    else (if(eq ?ans n)then (assert(sehat1)))
    else (if (and (neq ?ans y )(neq ?ans n))then (printout t crlf "jawaban tidak valid" crlf)(assert (gatal gatal)))
    )    



)
(defrule gejala2
    (gatal gatal)
    =>
    (printout t crlf "Apakah ada luka ringan ketika digaruk?(y/n)" crlf)
    (bind ?ans (read))
    (if (eq ?ans y) then
    (assert (luka ringan_saat_digaruk))
    else (if(eq ?ans n)then (assert(hanya gatal)))
    else (if (and (neq ?ans y )(neq ?ans n))then (printout t crlf "jawaban tidak valid" crlf)(assert (gatal gatal)))
    )
)

(defrule gudiken
    (gatal gatal)
    (luka ringan_saat_digaruk)
    =>
    (assert(terkena gudiken))
    (printout t crlf "Anda terkena gudiken" crlf)
)

(defrule obat 
    (terkena gudiken)
    =>
    (printout t crlf "Apakah sudah punya obatnya? (y/n)" crlf)
    (bind ?ans (read))
    (if (eq ?ans y) then
    (printout t crlf "Dioles satu kali sehari pada malam hari selama 1 sampai 2 minggu" crlf)
    else (if(eq ?ans n)then (printout t crlf "Bisa membeli obat Permethrin" crlf))
    else (if (and (neq ?ans y )(neq ?ans n))then (printout t crlf "jawaban tidak valid" crlf)(assert (terkena gudiken)))
    )
)

(defrule sehat
    (sehat1)
    =>
    (assert (tidak terkena_gejala))
    (printout t crlf "Anda tidak terkena gejala gudiken apapun" crlf) 

)

(defrule gatal
    (hanya gatal)
    (not (luka ringan_saat_digaruk))
    =>
    (assert(digigit serangga))
    (printout t crlf "Anda bisa saja gatel gatel karena digigit serangga" crlf)  
)


