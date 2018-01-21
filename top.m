%% Expirment 6: line codes 
% Designed By: Mohammed Hussen
% Date: 23/11/2017
%%
clear all;
close all;
clc;
%% Parameters Section
% Generate 10 bits randomly
%h = randi([0 1],1,10);
h = [1 1 1 0 0 0 1 1 0 0 1 0 1 0 1 0 1 1];
% add one more bit to the end of the sequence 
h(length(h)+1)= 0;
%% Main Code Loop
figure %this figure is for plotting the six line codes
%plot the different line codes 
y1=NRZ(h,1);
y2=RZ(h,2);
y3=NRZI(h,3);
y4=AMI_NRZ(h,4);
y5=manchester(h,5);
y6=MLT3(h,6);
figure %this figure is for plotting the psd of the line codes
%plot the power spectrum density of the line codes
PSD(y1,1, 'NRZ line code');
PSD(y2,2,'RZ line code');
PSD(y3,3,'NRZI line code');
PSD(y4,4, 'AMI NRZ line code');
PSD(y5,5, 'manchester line code');
PSD(y6,6, 'Multi-level transmission line code');
