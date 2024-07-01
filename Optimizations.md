Optimzations: MS_3

Initial area before Optimzation : 3800
Intial power : 1686 



In order to reduce the area we calculated max reg size at each size of the network and modified it accordinly.
We wanted to make sure that speed was not compramised while we still trying to reduce the area.
We made a design that is 5 stage piplined, but we also made sure to reduce the number of intermideate registers so to reduce the area even more. Due to pipelining we also managed to bring our power down.
To further reduce power, we added an extra "Compile High" and observed that our power was reduced further.

When we first synthesized with a clk period of 2000 PS, we had a large amount of positive slack. 
Seeing this as a opportunity to increase speed of the operation, we reduced our clk period to 1500 PS. Since our slack is so large, the compiler will not make additional efforts to meet timing and will use the same resources as it did with the 2000 PS. Thus Area and Power were not significantly affected.

Area after Optimiztaion: 2356
Power after optimization: 1472



