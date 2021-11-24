# Modeling and Control of Manipulators - LAB 1

**1.** You will need to define all the **model matrices**, and fill the so called `biTri` matrix. Be careful to define the z-axis coinciding with the joint rotation axis, and such that the positive rotation is the same as showed in the CAD model you received.
 
**2.**	Then, develop a function called `DirectGeometry()` which can calculate how the matrix attached to a joint will rotate if the joint rotates, using the interface:

`function biTei = DirectGeometry(qi, biTri, linkType)`.

**3.**	The last step will be useful in developing the `GetDirectGeometry()` function which will return all the model matrices given a certain **_q_** configuration. These variable will now be **vectors**, of length equal to the number of joints.

`function biTei = GetDirectGeometry(q, biTri, linkType)`

**4.**	Now that you have the `biTei` you can calculate all the transformation matrices between any two links, between a link and the base and the corresponding distance vectors. To do so incorporate these functionalities in the repository functions named accordingly.

**5.**	Now that you’ve reached this point define a starting and ending configuration, **_qi_** and **_qf_**, and try to plot all the intermediate link positions in between the two (you can use the `plot3()` or `line()`  functions).

