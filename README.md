# SKY130B Caravel Project

---------------------
Starting Caravel Design Project
---------------------

> Step 1: To start the project, first create a new repository based on the `caravel_user_project <https://github.com/efabless/caravel_user_project/>`_ template and make sure your repo is public and includes a README.

   *   Follow https://github.com/efabless/caravel_user_project/generate to create a new repository.
   *   Clone the reposity using the following command:
   
   .. code:: bash
    
	git clone <your github repo URL>
	
> Step 2: To setup your local environment run:

    .. code:: bash
    
    	$ cd <project_name> # project_name is the name of your repo
	
    	$ mkdir dependencies
	
	$ export OPENLANE_ROOT=$(pwd)/dependencies/openlane_src # you need to export this whenever you start a new shell
	
	$ export PDK_ROOT=$(pwd)/dependencies/pdks # you need to export this whenever you start a new shell

	# export the PDK variant depending on your shuttle, if you don't know leave it to the default
	$ export PDK=sky130B

        $ make setup

> Step 3: 

```
vasanthi@vasanthi-VirtualBox:~/Desktop/caravel_tutorial/caravel_test$ make user_proj_example

vasanthi@vasanthi-VirtualBox:~/Desktop/caravel_tutorial/caravel_test$ find openlane/user_proj_example/runs/user_proj_example/ | wc -l

```

```

vasanthi@vasanthi-VirtualBox:~/Desktop/caravel_tutorial/caravel_test$ tree openlane/user_proj_example/runs/user_proj_example/

```    
![tree1](https://user-images.githubusercontent.com/67214592/189863177-ad0e3787-1605-448c-9cb8-5dab0a974f45.PNG)

![tree2](https://user-images.githubusercontent.com/67214592/189863213-f06ff429-98c2-4231-8fae-a674935fd207.PNG)

![tree3](https://user-images.githubusercontent.com/67214592/189863266-5ac6bbf1-b4a2-46df-84a3-1fe1fcc296e9.PNG)

![tree4](https://user-images.githubusercontent.com/67214592/189863325-5d409685-a568-47f3-84bd-cd0b7684ace7.PNG)

![tree5](https://user-images.githubusercontent.com/67214592/189863356-3551e573-9332-4158-a6ce-5be576dd0b2c.PNG)

![tree6](https://user-images.githubusercontent.com/67214592/189863381-9c45667d-3319-4d1b-9608-e46a037d3a97.PNG)

![tree 7](https://user-images.githubusercontent.com/67214592/189863135-639dc4f3-2e3d-41a6-ae9d-39da8f21b09c.PNG)



