#pretreatment of ligand
antechamber -i ligand_h.pdb -fi pdb -o ligand.gjf -fo gcrt
##
echo '%chk=lig.chk
%nproc=32
%mem=10GB

#b3lyp/6-31G*  opt  scrf=(smd,solvent=c6h5cl) em=gd3bj

remark line goes here

0  1' > head.gjf
cat head.gjf ligand.gjf > lig.gjf
rm head.gjf -f
sed -i '10,16d' lig.gjf
g09 < lig.gjf >lig.log
end1=`tail lig.log -n 1 |awk '{print $1}'`
if [ $end1 = "Normal" ]; then
echo $end1 ' in 1' >> nohup.out
###
echo '%chk=lig.chk
%nproc=32
%mem=2GB

# b3lyp/def2svp geom=check guess=read scrf=(smd,solvent=c6h5cl) em=gd3bj  Pop=MK iop(6/33=2) iop(6/42=6)
    
remark line goes here
    
0   1   
    
' > lig_pcm.gjf
g09 < lig_pcm.gjf > lig_pcm.log
end2=`tail lig_pcm.log -n 1 |awk '{print $1}'`
if [ $end2 = "Normal" ]; then
echo $end2 ' in 2' >> nohup.out
antechamber -fi gout -fo mol2 -i lig_pcm.log -o ligand.mol2 -c resp -rf XX -rn XX -pf Y -nc charge
parmchk2 -f mol2 -i ligand.mol2 -o ligand.frcmod

else
echo " Error in 2 " >> nohup.out
fi
else
echo " Error in 1 " >> nohup.out
fi
#####
