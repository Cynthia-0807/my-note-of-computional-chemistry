import parmed as pmd
parm = pmd.load_file('gtpmgc3.prmtop','gtpmgc3.inpcrd')
parm.save('gtpmgc3.top')
parm.save('gtpmgc3.gro')
