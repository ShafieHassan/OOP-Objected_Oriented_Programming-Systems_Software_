%% testMSD_sim.m - Shafie Hassan 2047007 Systems Coursework


%% Test 1 - SetMass , Pos Input
%setup test 
MSD=MSD_sim;

%expected result
correct=10;
%runtest
MSD.SetMass(10)

%Analyse
Analysis1=isequal(correct,MSD.m);
%report error
assert(Analysis1,'SetMass fnc does not store correct value')

%% Test 2 - SetMass , Neg Input
%setup test 
MSD=MSD_sim;
%expected result
correct=5;
%runtest
MSD.SetMass(-5)

%Analyse
Analysis1=isequal(correct,MSD.m);
%report error
assert(Analysis1,'SetMass fnc does not store correct value')

%% Test 3 - SetMass , 0 Input
%setup test 
MSD=MSD_sim;
%expected result


%runtest
correct_message=0;
try
MSD.SetMass(0)
%Analyse
catch ME
    if(ME.message=='Mass has to be more than 0')
        correct_message=1;
    end
end

%report error
assert(correct_message,'WRONG/NO Error is displayed');
%% Test 4 - SetMass , String Input
%setup test 
MSD=MSD_sim;
%expected result


%runtest
correct_message=0;
try
MSD.SetMass('dog')
%Analyse
catch ME
    if(ME.message=='Mass has to be a number')
        correct_message=1;
    end
end

%report error
assert(correct_message,'WRONG/NO Error is displayed');
%% Test 4.1-SetMass, Non Real Input
%setup test 
MSD=MSD_sim;
%expected result


%runtest
correct_message=0;
try
MSD.SetMass(2+3i)
%Analyse
catch ME
    if(ME.message=='Mass has to be a real number')
        correct_message=1;
    end
end

%report error
assert(correct_message,'WRONG/NO Error is displayed');

%% Test 5 - SetDamper, Pos Input
%setup test 
MSD=MSD_sim;
%expected result
correct=10;
%runtest
MSD.SetDamper(10)

%Analyse
Analysis1=isequal(correct,MSD.c);
%report error
assert(Analysis1,'SetDamper fnc does not store correct value')
%% Test 6 - SetDamper, Neg Input
%setup test 
MSD=MSD_sim;
%expected result
correct=5;
%runtest
MSD.SetDamper(-5)

%Analyse
Analysis1=isequal(correct,MSD.c);
%report error
assert(Analysis1,'SetDamper fnc does not store correct value')
%% Test 7 - SetDamper, 0 Input
%setup test 
MSD=MSD_sim;
%expected result


%runtest
correct_message=0
try
MSD.SetDamper(0)
%Analyse
catch ME
    if(ME.message=='Damper Coeff has to be greater than 0')
        correct_message=1;
    end
end

%report error
assert(correct_message,'WRONG/NO Error is displayed');
%% Test 8 - SetDamper, String Input
%setup test 
MSD=MSD_sim;
%expected result


%runtest
correct_message=0
try
MSD.SetDamper('dog')
%Analyse
catch ME
    if(ME.message=='Damper Coeff has to be a number')
        correct_message=1;
    end
end

%report error
assert(correct_message,'WRONG/NO Error is displayed');
%% Test 8.1-SetDamper, NOn Real Input 
%setup test 
MSD=MSD_sim;
%expected result


%runtest
correct_message=0;
try
MSD.SetDamper(2+3i)
%Analyse
catch ME
    if(ME.message=='Damper Coeff has to be a real number')
        correct_message=1;
    end
end

%report error
assert(correct_message,'WRONG/NO Error is displayed');
%% Test 9 - SetSpring, Pos Input
%setup test 
MSD=MSD_sim;
%expected result
correct=10;
%runtest
MSD.SetSpring(10)

%Analyse
Analysis1=isequal(correct,MSD.k);
%report error
assert(Analysis1,'SetSpring fnc does not store correct value')
%% Test 10- SetSpring, Neg Input
%setup test 
MSD=MSD_sim;
%expected result
correct=5;
%runtest
MSD.SetSpring(-5)

%Analyse
Analysis1=isequal(correct,MSD.k);
%report error
assert(Analysis1,'SetSpring fnc does not store correct value')
%% Test 11 -SetSpring, 0 Input
%setup test 
MSD=MSD_sim;
%expected result


%runtest
correct_message=0;
try
MSD.SetSpring(0)
%Analyse
catch ME
    if(ME.message=='spring const has to be greater than 0')
        correct_message=1;
    end
end

%report error
assert(correct_message,'WRONG/NO Error is displayed');
%% Test 12 -SetSpring, String Input
%setup test 
MSD=MSD_sim;
%expected result


%runtest
correct_message=0;
try
MSD.SetSpring('dog')
%Analyse
catch ME
    if(ME.message=='spring const has to be a number')
        correct_message=1;
    end
end

%report error
assert(correct_message,'WRONG/NO Error is displayed');
%% Test 4.1-SetSpring ,Non Real Input  
%setup test 
MSD=MSD_sim;
%expected result


%runtest
correct_message=0;
try
MSD.SetSpring(2+3i)
%Analyse
catch ME
    if(ME.message=='spring const has to be a real number')
        correct_message=1;
    end
end

%report error
assert(correct_message,'WRONG/NO Error is displayed');
%% Test 13 - CalcNaturalFreq, Normal Operation
%setup test 
MSD=MSD_sim;

%expected result
correct=4.9673
%runtest
MSD.SetMass(1);
MSD.SetDamper(1);
MSD.SetSpring(10);

Computed=MSD.CalcNaturalFreq()
tol = 1e-3
%Analyse
Analysis1=(abs(correct-Computed)<tol)
%report error
assert(Analysis1,'Computation of Natural Frequency is incorrect')

%% Test 14 - CalcZeta, Normal Operation
%setup test 
MSD=MSD_sim;

%expected result
correct=0.1581;
%runtest
MSD.SetMass(1);
MSD.SetDamper(1);
MSD.SetSpring(10);

Computed=MSD.CalcDampingFactor();
tol = 1e-3;
%Analyse
Analysis1=(abs(correct-Computed)<tol);
%report error
assert(Analysis1,'Computation of DampingFactor is incorrect')
%% Test 15 - isUnderDamped,  UnderDamped
%setup test 
MSD=MSD_sim;
%expected result
correct=1;
%runtest
MSD.SetMass(1);
MSD.SetDamper(1);
MSD.SetSpring(10);
MSD.CalcNaturalFreq();
MSD.CalcDampingFactor()
computed=MSD.isUnderDamped();

%Analyse
Analysis1=isequal(correct,computed);
%report error
assert(Analysis1,'IsUnderDamped fnc does not compute correct value')
%% Test 16 - isUnderDamped,  NoDamping
%setup test 
MSD=MSD_sim;
correct=0;
%expected result
MSD.zeta=0;
computed=MSD.isUnderDamped();

%Analyse
Analysis1=isequal(correct,computed);
%report error
assert(Analysis1,'IsUnderDamped fnc does not compute correct value')
%% Test 17 - isUnderDamped,  CriticalDamped
%setup test 
MSD=MSD_sim;
correct=0;
%expected result
MSD.zeta=1;
computed=MSD.isUnderDamped();

%Analyse
Analysis1=isequal(correct,computed);
%report error
assert(Analysis1,'IsUnderDamped fnc does not compute correct value')

%% Test 18 - isUnderDamped,  OverDamped
%setup test 
MSD=MSD_sim;
correct=0;
%expected result
MSD.zeta=1.1;
computed=MSD.isUnderDamped();

%Analyse
Analysis1=isequal(correct,computed);
%report error
assert(Analysis1,'IsUnderDamped fnc does not compute correct value')
