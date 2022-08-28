#!/bin/bash


# Primeiro for cria diretorios e grupos baseado na lista de setores
for setor in adm ven sec
do
	GRUPO_SETOR="GRP_${setor^^}"
	groupadd $GRUPO_SETOR
	mkdir /$setor
	chown :$GRUPO_SETOR /$setor
	chmod 770 /$setor
done

#exit

# Cria usuarios do grupo GRP_ADM e os adiciona ao grupo
for user_ in carlos maria joao
do
	useradd -m -s /bin/bash -p $(openssl passwd -crypt Senha123) $user_
	usermod -G GRP_ADM $user_
done


# Cria usuarios do grupo GRP_VEN e os adiciona ao grupo
for user_ in debora sebastiana roberto
do
	useradd -m -s /bin/bash -p $(openssl passwd -crypt Senha123) $user_ 
	usermod -G GRP_VEN $user_
done


# Cria usuarios do grupo GRP_SEC e os adiciona ao grupo
for user_ in josefina amanda rogerio
do
	useradd -m -s /bin/bash -p $(openssl passwd -crypt Senha123) $user_
	usermod -G GRP_SEC $user_
done

