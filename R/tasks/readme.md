Ce rôle installe une ou plusieurs versions de R sous /opt. Pour le moment une seule version , la 3.5.1.
Pour en ajouter d'autres, modifier le script main.yml en ajoutant une version à la tâche suivante :

	- include_tasks: install_R.yml
	  with_items:
	    - 3.5.1
	    - <une nouvelle version>
	  loop_control:
	    loop_var: rversion