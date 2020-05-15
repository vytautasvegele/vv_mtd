for i in {1..10}
do
   LD_LIBRARY_PATH="$(pwd):$LD_LIBRARY_PATH" python3 run.py $i &
done
wait

echo "done"
	

