#!/bin/bash
# Copyright 2013 Yann Surget-Groba
#
# structure_batch.sh is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# structure_batch.sh is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this file. If not, see <http://www.gnu.org/licenses/>.

#run a batch of STRUCTURE analyses.
#usage: structure_batch.sh infile Kmin Kmax nReplicates nThreads

infile=$1
ncpu=$5
nrep=$4

base=`basename $infile .${infile##*.}`
i=1

echo "#!/bin/sh" > killAll.sh
echo "kill -9 $$" >> killAll.sh
chmod a+x killAll.sh

for K in `seq $2 $3`; do #loop over K values
    for rep in `seq $nrep`; do #loop over replicates
        outfile="$base-K$K-$rep"
        structure -K $K -i $infile -o $outfile > $outfile.log &
        echo "K=$K, rep=$rep, PID=$!"
        echo "kill -9 $!" >> killAll.sh
        if [ $i -lt $ncpu ]; then
            i=$(($i+1))
            sleep 1 #makes sure a different seed is used
        else
            wait
            i=1
        fi
    done
done
