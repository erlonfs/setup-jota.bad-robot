//+------------------------------------------------------------------+
//|                                   Copyright 2017, Erlon F. Souza |
//|                                       https://github.com/erlonfs |
//+------------------------------------------------------------------+

#define   robot_name       "SETUP JOTA"
#define   robot_version    "1.0.0-alpha"

#property copyright        "Copyright 2018, Bad Robot"
#property link             "https://github.com/erlonfs"
#property version       	robot_version
#property description   	"Descrição aqui...\n\n\nBons trades!\n\nEquipe BAD ROBOT.\nerlon.efs@gmail.com"
#property icon             "setup-jota.ico" 

#include <..\Experts\setup-jota.bad-robot\src\SetupJota.mqh>
#include <BadRobot.Framework\Enum.mqh>

input string          Secao1 = "###############";//### Definições Básicas ###
input string          HoraInicio="00:00";//Hora de início de execução da estratégia
input string          HoraFim="00:00";//Hora de término de execução da estratégia
input string          HoraInicioIntervalo="00:00";//Hora de início intervalo de execução da estratégia
input string          HoraFimIntervalo="00:00";//Hora de término intervalo de execução da estratégia
input ENUM_LOGIC      FecharPosition=0;//Fechar posições ao término de horario de execução?
input int             Volume=0; //Volume
input double          Spread = 0;//Spread para entrada na operação

input string          Secao2 = "###############";//### Alvos ###
input double          StopGainEmPontos=0; //Stop Gain
input double          StopLossEmPontos=0; //Stop Loss

input string          Secao3 = "###############";//### Gerenciamento de Stop ###
input ENUM_LOGIC      IsStopNoCandleAnterior=0;//Stop na máxima/ mínima do candle anterior?
input double          SpreadStopNoCandleAnterior=0;//Spread

input string          Secao4 = "###############";//### Trailing Stop ###
input ENUM_LOGIC      IsTrailingStop=0;//Ativar Trailing Stop?
input double          TrailingStopInicio=0; //Valor de inicio
input double          TrailingStop=0; //Valor de Ajuste do Trailing Stop

input string          Secao5 = "###############";//### Break-Even ###
input ENUM_LOGIC      IsBreakEven=0;//Ativar Break-Even?
input double          BreakEven=0;//Valor do break-even, zero é o ponto inicial
input double          BreakEvenInicio=0;//Valor de inicio

input string          Secao6 = "###############";//### Financeiro ###
input ENUM_LOGIC      IsGerenciamentoFinanceiro=0;//Ativar Gerenciamento Financeiro?
input double          CorretagemValor=0.0; //Valor de Corretagem por contrato
input ENUM_LOGIC      IsCalcularCorretagemLucroMaximo=0;//Calcular valor do lucro descontando a corretagem?
input double          MaximoLucroDiario=0; //Lucro máximo no dia
input double          MaximoPrejuizoDiario=0; //Prejuízo máximo no dia

input string          Secao7 = "###############";//### Realização de Parcial ###
input ENUM_LOGIC      IsParcial=0;//Ativar saída parcial?
input double          PrimeiraParcialVolume=0;//Volume da 1ª saída parcial
input double          PrimeiraParcialInicio=0;//Valor de inicio da 1ª saída parcial
input double          SegundaParcialVolume=0;//Volume da 2ª saída parcial
input double          SegundaParcialInicio=0;//Valor de inicio da 2ª saída parcial
input double          TerceiraParcialVolume=0;//Volume da 3ª saída parcial
input double          TerceiraParcialInicio=0;//Valor de inicio da 3ª saída parcial

input string          Secao8 = "###############";//### Expert Control ###
input int             NumeroMagico=0; //O número mágico é utilizado para diferenciar ordens de outros robôs

input string          Secao9 = "###############";//### Notificações ###
input ENUM_LOGIC      IsNotificacoesApp=0;//Ativar notificações no app do metatrader 5?

input string          Secao10 = "###############";//### Config de Estratégia ###
input ENUM_TIMEFRAMES Periodo = PERIOD_CURRENT;//Período da estratégia
input int             MediaLonga=0;//Média longa
input int             MediaCurta=0;//Média curta

//variaveis
SetupJota _ea;

int OnInit()
  {  
           
   printf("Bem Vindo ao "+robot_name+"!");
     
   //Definições Básicas  
   _ea.SetSymbol(_Symbol);
   _ea.SetHoraInicio(HoraInicio);
   _ea.SetHoraFim(HoraFim);
   _ea.SetHoraInicioIntervalo(HoraInicioIntervalo);
   _ea.SetHoraFimIntervalo(HoraFimIntervalo);  
   _ea.SetIsClosePosition(FecharPosition);
   _ea.SetVolume(Volume);
   _ea.SetSpread(Spread);
   
   //Alvos
   _ea.SetStopGain(StopGainEmPontos);
   _ea.SetStopLoss(StopLossEmPontos);
   
   //Gerenciamento de Stop
   _ea.SetIsStopOnLastCandle(IsStopNoCandleAnterior); 
   _ea.SetSpreadStopOnLastCandle(SpreadStopNoCandleAnterior);
   
   //Trailing Stop
   _ea.SetIsTrailingStop(IsTrailingStop);
   _ea.SetTrailingStopInicio(TrailingStopInicio);
   _ea.SetTrailingStop(TrailingStop);   
   
   //Break-Even
   _ea.SetIsBreakEven(IsBreakEven);  
   _ea.SetBreakEvenInicio(BreakEvenInicio);
   _ea.SetBreakEven(BreakEven);
   
   //Financeiro
   _ea.SetIsGerenciamentoFinanceiro(IsGerenciamentoFinanceiro);
   _ea.SetCorretagemValor(CorretagemValor);
   _ea.SetIsCalcularCorretagemValoresMaximosDiarios(IsCalcularCorretagemLucroMaximo);   
   _ea.SetMaximoLucroDiario(MaximoLucroDiario);
   _ea.SetMaximoPrejuizoDiario(MaximoPrejuizoDiario);     
   
   //Realização de Parcial
   _ea.SetIsParcial(IsParcial);
   _ea.SetPrimeiraParcialVolume(PrimeiraParcialVolume);
   _ea.SetPrimeiraParcialInicio(PrimeiraParcialInicio);   
   _ea.SetSegundaParcialVolume(SegundaParcialVolume);
   _ea.SetSegundaParcialInicio(SegundaParcialInicio);   
   _ea.SetTerceiraParcialVolume(TerceiraParcialVolume);
   _ea.SetTerceiraParcialInicio(TerceiraParcialInicio);  
   
   //Expert Control
   _ea.SetNumberMagic(NumeroMagico);
   _ea.SetRobotName(robot_name);
   _ea.SetRobotVersion(robot_version);
   
   //Notificacoes
   _ea.SetIsNotificacoesApp(IsNotificacoesApp);       
       
   //Estrategia
   _ea.SetPeriod(Periodo);   
   _ea.SetEMALongPeriod(MediaLonga);
   _ea.SetEMAShortPeriod(MediaCurta);
   
   //Load Expert
 	_ea.Load(); 	
 	 	  
   return(INIT_SUCCEEDED);

}

void OnDeinit(const int reason){
   printf("Obrigado por utilizar o "+robot_name+"!");
}

void OnTick(){                                                             
   _ea.Execute();      
}

void OnTrade(){
   _ea.ExecuteOnTrade();
}
