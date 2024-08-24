ntabs=$1
nrows=$2
nsecs_r=$3
nsecs_w=$4
basedir=$5
sysbdir=$6
datadir=$7
devname=$8
usepk=$9
prepstmt=${10}

# Remaining args are numbers of threads for which to run benchmarks, "1 2 4"
shift 10

function dbms_up() {
  bdir=$1
  cnf=$2
  # /media/ephemeral1 or /home/mdcallag/d or ???
  cdir=$PWD
  cd $bdir; bash ini.sh $cnf >& o.ini; sleep 10; cd $cdir
}

function dbms_down() {
  bdir=$1
  cnf=$2
  cdir=$PWD
  cd $bdir; bash down.sh $cnf >& o.down; cd $cdir
}

old=0
if [[ old -eq 1 ]]; then
dbcreds=mysql,root,pw,127.0.0.1,test,innodb
for dcnf in \
ma100244_rel_withdbg.z11a_c8r32 \
ma100339_rel_withdbg.z11a_c8r32 \
ma100433_rel_withdbg.z11a_c8r32 \
; do
  dbms=$( echo $dcnf | tr '.' ' ' | awk '{ print $1 }' )
  cnf=$( echo $dcnf | tr '.' ' ' | awk '{ print $2 }' )

  dbdir=$basedir/$dbms
  client=$dbdir/bin/mysql
  echo Run for $dbms with $cnf config from $dbdir

  dbms_up $dbdir $cnf
  grep -i huge /proc/meminfo > sb.hp.pre
  bash all_small.sh $ntabs $nrows $nsecs_r $nsecs_w $nsecs_w $dbcreds 1 0 $client none $sysbdir $datadir $devname $usepk $prepstmt $@
  grep -i huge /proc/meminfo > sb.hp.post
  mkdir x.$dcnf.pk${usepk}; mv sb.* x.$dcnf.pk${usepk}; cp $dbdir/etc/my.cnf $dbdir/o.ini* x.$dcnf.pk${usepk}
  cp /data/m/my/data/*.err x.$dcnf.pk${usepk}
  dbms_down $dbdir $cnf 
  cp $dbdir/o.down x.$dcnf.pk${usepk}
  sleep 600
done
fi

new=1
if [[ new -eq 1 ]]; then
#ma100619_rel_withdbg_mdev34178_5b26a076.z11a_c8r32 \
#ma101107_rel_withdbg_mdev33894_jun19.z11a_c8r32 \
#ma101107_rel_withdbg_mdev33894_jun19.z11a_lwas4k_c8r32 \
dbcreds=mariadb,root,pw,127.0.0.1,test,innodb
for dcnf in \
    ma1104_mdev34705.nosync_eng_c4b8 \
    ma1104_mdev34705.sync_eng_c4b8 \
    ma1104_base.nosync_nobl_c4b8 \
    ma1104_base.sync_nobl_c4b8 \
    ma1104_base.nosync_c4b8 \
    ma1104_base.sync_c4b8 \
; do
  dbms=$( echo $dcnf | tr '.' ' ' | awk '{ print $1 }' )
  cnf=$( echo $dcnf | tr '.' ' ' | awk '{ print $2 }' )

  dbdir=$basedir/$dbms
  client=$dbdir/bin/mariadb
  echo Run for $dbms with $cnf config from $dbdir

  dbms_up $dbdir $cnf
  grep -i huge /proc/meminfo > sb.hp.pre
  bash all_small.sh $ntabs $nrows $nsecs_r $nsecs_w $nsecs_w $dbcreds 1 0 $client none $sysbdir $datadir $devname $usepk $prepstmt $@
  grep -i huge /proc/meminfo > sb.hp.post
  mkdir x.$dcnf.pk${usepk}; mv sb.* x.$dcnf.pk${usepk}; cp $dbdir/etc/my.cnf $dbdir/o.ini* x.$dcnf.pk${usepk}
  cp /data/m/my/data/*.err x.$dcnf.pk${usepk}
  dbms_down $dbdir $cnf 
  cp $dbdir/o.down x.$dcnf.pk${usepk}
  sleep 600
done
fi
