set lines 32767
set pagesize 50000
set colsep ";"
set num 20

set trimout on
set tab off

set TRIMSPOOL on
set feedback off
set verify off

DEFINE ROUTE = 'C:\SQL\NSI.csv'
spool &route

select
o1.txt, f1.n_shiny, f1.n_fid, f1.txt, f1.kt_1, f1.kt_2, f1.kn_1, f1.kn_2, 
sh.n_sh, sh.dat_ust, sh.dat_pov, sh.txt, 
p1.adr, v1.host, v1.tcpport, 
k2.txt, k2.zav_nom,
k2.typ_k, p1.place_id, sh.TYP_SH, sh.N_OB, k1.N_KON, f1.cod_rre
from cnt.sh
left join cnt.param_oprsh2_view p1 on p1.n_sh=sh.n_sh
left join cnt.v_to_02 v1 on v1.rpl=p1.place_id
left join CNT.OBEKT o1 on o1.SYB_RNK=sh.syb_rnk and o1.N_OB=sh.N_OB
left join CNT.FID f1 on f1.SYB_RNK=sh.syb_rnk and f1.N_OB=sh.N_OB and f1.N_FID=sh.N_FID
left join cnt.PARAM_OPRKONTR2 k1 on k1.place_id=p1.place_id
left join cnt.KONTR k2 on k1.N_KON=k2.N_KON
;

spool off
