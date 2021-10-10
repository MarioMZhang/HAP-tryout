#!/bin/bash
args=("$@")
if [ "${args[0]}" = "pretrain" ]; then 
    CUDA_VISIBLE_DEVICES=0,1,2,3 python main_pretrain.py --learning_rate 0.1 --weight_decay 0.0002 \
        --dataset cifar10 --network resnet --epoch 200 --depth 56
else 
    CUDA_VISIBLE_DEVICES=4,5,6,7 python mian_prune.py --network resnet --depth 56 --dataset cifar10 \
        --batch-size 64 --learning-rate 0.02 --weight-decay 4e-4
fi