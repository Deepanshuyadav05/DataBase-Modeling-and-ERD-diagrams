## General Tips
- Always make FK reference connection at the end of the table (but before the constraints)
- Always add the constraints at the end of the table
- Add column specifics constraints there only

## Tips for making Relations between tables 
- In case of 1:Many FK comes in Many table
- In case of 1:1 the table which is superior/parent/come-first should not store the FK the child table should store it
- while making relations always maintain a same direction like
  1. child.fk > parent.id
  2. parent.id < child.fk 
  3. Pick the one form and use it everywhere or you will mis-wire one. The clean convention you used in the fitness platform was parent.id < child.fk_column