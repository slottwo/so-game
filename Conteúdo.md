@moonlight
Interface serial
	Apenas uma linha para transferência de dados (bit à bit)
Interface paralela
	Mais de uma linha para transferência de dados
- Espaço de memória: acessado via instruções de acesso de memória (mov)
- Espaço de E/S: acessado via instruções de acesso específica (in, out)

@nertonm
Subsistema de E/S xxEscalonamento de E/S
- xxBufferização
- xxCache
- xxSpooling  
RAID xxxxxx redundancia de Dispositivo
Driver de dispositivo xxxx Perificos

@frisuh
E/S Programada: O processador envia um comando à controladora e fica em busy waiting, verificando constantemente o estado da operação de E/S até sua conclusão.

Desvantagem da E/S Programada: O processador desperdiça tempo verificando continuamente o estado da operação de E/S devido à diferença de velocidade entre ele e os dispositivos.

Polling: Técnica que insere operações entre as verificações de estado para reduzir o desperdício de tempo na E/S programada.

E/S Orientada à Interrupção: O processador é interrompido pelo módulo de E/S quando ele está pronto, permitindo que o processador execute outras tarefas enquanto aguarda.

Desvantagem da E/S por Interrupção: A troca de contexto causada por muitas interrupções pode sobrecarregar o processador e diminuir sua eficiência.

@y_bakura
Entrelaçamento: Técnica consiste em numerar os setores não mais de forma contígua mas sim com um espaço entre eles.

SCAN: Algoritmo que executa as requisições na ordem de uma varredura. Ao chega no outro extremo, inverte o sentido e repete o procedimento

FCFS: Algoritmo que acessa na ordem em que as requisições são solicitadas

SSTF: Algoritmo que seleciona a requisição com o menor tempo de seek em relação a posição atual do cabeçote de leitura/escrita.

C-SCAN: Procedimento é idêntico ao do algoritmo SCAN porém as requisições são atendidas apenas em um sentido da varredura. Ao final da varredura o cabeçote é reposiconado no início do disco Algoritmos de escalonamento do disco: Algoritmos para reduzir o tempo de seek

C-LOOK: Versão do C-SCAN. O cabeçote de leitura/escrita não necessita atingir o extremo do disco para voltar ao início do disco Escalonamento do disco: Tem como objetivo tratar E/S em disco de forma eficiente