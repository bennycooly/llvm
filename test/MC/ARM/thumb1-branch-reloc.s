@ RUN: llvm-mc -triple thumbv6-eabi -filetype obj -o - %s | llvm-readobj -r - \
@ RUN:     | FileCheck %s

        .syntax unified

        .extern h
        .section .text.uncond

        b h
        
@CHECK: Section {{.*}} .rel.text.uncond {
@CHECK:   0x0 R_ARM_THM_JUMP11
@CHECK: }
        .section .text.cond

        ble h

@CHECK: Section {{.*}} .rel.text.cond {
@CHECK:   0x0 R_ARM_THM_JUMP8
@CHECK: }
        