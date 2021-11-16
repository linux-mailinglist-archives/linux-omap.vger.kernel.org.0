Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 351CE453A28
	for <lists+linux-omap@lfdr.de>; Tue, 16 Nov 2021 20:28:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239423AbhKPTbN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Nov 2021 14:31:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:55852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229663AbhKPTbM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 16 Nov 2021 14:31:12 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5972F63245
        for <linux-omap@vger.kernel.org>; Tue, 16 Nov 2021 19:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637090895;
        bh=P6pLm/WfA2NZbhUNmOyeTo7nkYUKM7Oxmo82X2Zm3T0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=N2ZmFtK1Uu6XYZFMe777wYsj/k39GvCAFiXCwF9Ik5ko4SOpHb11FwghS28zJxghr
         8rHCHxnF+wc7+3re3Gt+4/dkY2orpYsrcbdULho9hrEPDeZo3SKwF4Ohiq4fNO3jyd
         zxImL94p0dX61gmq8ZiwS0kNDPrzoI1Q+/AB4YlFX41pDiO28BxRCTIuyS10fRUFYW
         xLvxjyxEjQyjey1pxUW7vO96k3NhSbr5oIFQ26ftZ5ZF1uyDBx1+UtnWK2chud91DT
         Kva0YVc/px2jaVvUQiLaL5s/ARSHaAtrQBHOtQnMdzmF9YCz+ndiuCAnpoQU4y17Du
         1UnXoLRvYGFwA==
Received: by mail-oi1-f178.google.com with SMTP id m6so856417oim.2
        for <linux-omap@vger.kernel.org>; Tue, 16 Nov 2021 11:28:15 -0800 (PST)
X-Gm-Message-State: AOAM532PQgHKvsXdofQhNlI+VrMIEtl5XSbM5O8Gi9kbADHA28JW8NHi
        XDiKRosr+X/0wam3z9MV/C6LpM4ZuEFjOFrw8SE=
X-Google-Smtp-Source: ABdhPJxU3kMtyW6qHpXD2nOY1loFxNikLZJE5zUKoF/ELklrazwPPUowxQz8izFm0ICCe3RweIcx7uSe41We7nsYyOY=
X-Received: by 2002:a05:6808:1919:: with SMTP id bf25mr8830992oib.33.1637090894219;
 Tue, 16 Nov 2021 11:28:14 -0800 (PST)
MIME-Version: 1.0
References: <20211115111816.3911213-1-ardb@kernel.org> <20211115111816.3911213-8-ardb@kernel.org>
 <d73b25ec-7ade-2090-9ab4-df4ff8d7db94@collabora.com>
In-Reply-To: <d73b25ec-7ade-2090-9ab4-df4ff8d7db94@collabora.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Tue, 16 Nov 2021 20:28:02 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHLushGdSfH3HEUeRuGuZMFS1PUZ+_7vp5dmRHGtjyYfQ@mail.gmail.com>
Message-ID: <CAMj1kXHLushGdSfH3HEUeRuGuZMFS1PUZ+_7vp5dmRHGtjyYfQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] ARM: implement support for vmap'ed stacks
To:     Guillaume Tucker <guillaume.tucker@collabora.com>,
        Tony Lindgren <tony@atomide.com>,
        linux-omap <linux-omap@vger.kernel.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Kees Cook <keescook@chromium.org>,
        Keith Packard <keithpac@amazon.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "kernelci@groups.io" <kernelci@groups.io>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

(+ Tony and linux-omap@)

On Tue, 16 Nov 2021 at 10:23, Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> Hi Ard,
>
> Please see the bisection report below about a boot failure on
> omap4-panda which is pointing to this patch.
>
> Reports aren't automatically sent to the public while we're
> trialing new bisection features on kernelci.org but this one
> looks valid.
>
> Some more details can be found here:
>
>   https://linux.kernelci.org/test/case/id/6191b1b97c175a5ade335948/
>
> It seems like the kernel just froze after about 3 seconds without
> any obvious errors in the log.
>
> Please let us know if you need any help debugging this issue or
> if you have a fix to try.
>

Thanks for the report.

I wonder if this might be related to low level platform code running
off a different stack (maybe in SRAM?) when an interrupt is taken? Or
using a different set of page tables that are out of sync in terms of
VMALLOC space mappings?

Could anyone who speaks OMAP please take a look at the linked boot
log, and hopefully make sense of it?

For background, this series enables vmap'ed stacks support for ARMv7,
which means that the entry code checks whether the stack pointer may
be pointing into the guard region before the vmalloc'ed stack, and
kills the task if it looks like the kernel stack overflowed.

Here's another instance:
https://linux.kernelci.org/build/id/6193fa5c6c4e1d02bd3358ff/

Everything builds and boots happily, but odd things happen on OMAP
based devices: Panda just gives up right after discovering the USB
controller, and Beagle-XM just starts showing all kinds of weird
crashes at roughly the same point in the boot.

>
> GitHub: https://github.com/kernelci/kernelci-project/issues/75
>
> -------------------------------------------------------------------------------
>
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> * This automated bisection report was sent to you on the basis  *
> * that you may be involved with the breaking commit it has      *
> * found.  No manual investigation has been done to verify it,   *
> * and the root cause of the problem may be somewhere else.      *
> *                                                               *
> * If you do send a fix, please include this trailer:            *
> *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
> *                                                               *
> * Hope this helps!                                              *
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>
> ardb/for-kernelci bisection: baseline.login on panda
>
> Summary:
>   Start:      d1eccc4f44f11 ARM: implement support for vmap'ed stacks
>   Plain log:  https://storage.kernelci.org/ardb/for-kernelci/v5.16-rc1-16-gd1eccc4f44f1/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baseline-panda.txt
>   HTML log:   https://storage.kernelci.org/ardb/for-kernelci/v5.16-rc1-16-gd1eccc4f44f1/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baseline-panda.html
>   Result:     d1eccc4f44f11 ARM: implement support for vmap'ed stacks
>
> Checks:
>   revert:     PASS
>   verify:     PASS
>
> Parameters:
>   Tree:       ardb
>   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
>   Branch:     for-kernelci
>   Target:     panda
>   CPU arch:   arm
>   Lab:        lab-collabora
>   Compiler:   gcc-10
>   Config:     multi_v7_defconfig+crypto
>   Test case:  baseline.login
>
> Breaking commit found:
>
> -------------------------------------------------------------------------------
> commit d1eccc4f44f11a8f3f5d376f08e3779d2196f93a
> Author: Ard Biesheuvel <ardb@kernel.org>
> Date:   Thu Sep 23 09:15:53 2021 +0200
>
>     ARM: implement support for vmap'ed stacks
>
> On 15/11/2021 11:18, Ard Biesheuvel wrote:
> > Wire up the generic support for managing task stack allocations via vmalloc,
> > and implement the entry code that detects whether we faulted because of a
> > stack overrun (or future stack overrun caused by pushing the pt_regs array)
> >
> > While this adds a fair amount of tricky entry asm code, it should be
> > noted that it only adds a TST + branch to the svc_entry path. The code
> > implementing the non-trivial handling of the overflow stack is emitted
> > out-of-line into the .text section.
> >
> > Since on ARM, we rely on do_translation_fault() to keep PMD level page
> > table entries that cover the vmalloc region up to date, we need to
> > ensure that we don't hit such a stale PMD entry when accessing the
> > stack. So we do a dummy read from the new stack while still running from
> > the old one on the context switch path, and bump the vmalloc_seq counter
> > when PMD level entries in the vmalloc range are modified, so that the MM
> > switch fetches the latest version of the entries.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > Tested-by: Keith Packard <keithpac@amazon.com>
> > ---
> >  arch/arm/Kconfig                   |  1 +
> >  arch/arm/include/asm/page.h        |  4 +
> >  arch/arm/include/asm/thread_info.h |  8 ++
> >  arch/arm/kernel/entry-armv.S       | 79 ++++++++++++++++++--
> >  arch/arm/kernel/entry-header.S     | 57 ++++++++++++++
> >  arch/arm/kernel/irq.c              |  9 ++-
> >  arch/arm/kernel/traps.c            | 65 +++++++++++++++-
> >  arch/arm/kernel/unwind.c           |  3 +-
> >  arch/arm/kernel/vmlinux.lds.S      |  4 +-
> >  9 files changed, 219 insertions(+), 11 deletions(-)
> >
> > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> > index b1eba1b4168c..a072600527ca 100644
> > --- a/arch/arm/Kconfig
> > +++ b/arch/arm/Kconfig
> > @@ -127,6 +127,7 @@ config ARM
> >       select RTC_LIB
> >       select SYS_SUPPORTS_APM_EMULATION
> >       select THREAD_INFO_IN_TASK if CURRENT_POINTER_IN_TPIDRURO
> > +     select HAVE_ARCH_VMAP_STACK if THREAD_INFO_IN_TASK
> >       select TRACE_IRQFLAGS_SUPPORT if !CPU_V7M
> >       # Above selects are sorted alphabetically; please add new ones
> >       # according to that.  Thanks.
> > diff --git a/arch/arm/include/asm/page.h b/arch/arm/include/asm/page.h
> > index 11b058a72a5b..7b871ed99ccf 100644
> > --- a/arch/arm/include/asm/page.h
> > +++ b/arch/arm/include/asm/page.h
> > @@ -149,6 +149,10 @@ extern void copy_page(void *to, const void *from);
> >  #include <asm/pgtable-2level-types.h>
> >  #endif
> >
> > +#ifdef CONFIG_VMAP_STACK
> > +#define ARCH_PAGE_TABLE_SYNC_MASK    PGTBL_PMD_MODIFIED
> > +#endif
> > +
> >  #endif /* CONFIG_MMU */
> >
> >  typedef struct page *pgtable_t;
> > diff --git a/arch/arm/include/asm/thread_info.h b/arch/arm/include/asm/thread_info.h
> > index 164e15f26485..004b89d86224 100644
> > --- a/arch/arm/include/asm/thread_info.h
> > +++ b/arch/arm/include/asm/thread_info.h
> > @@ -25,6 +25,14 @@
> >  #define THREAD_SIZE          (PAGE_SIZE << THREAD_SIZE_ORDER)
> >  #define THREAD_START_SP              (THREAD_SIZE - 8)
> >
> > +#ifdef CONFIG_VMAP_STACK
> > +#define THREAD_ALIGN         (2 * THREAD_SIZE)
> > +#else
> > +#define THREAD_ALIGN         THREAD_SIZE
> > +#endif
> > +
> > +#define OVERFLOW_STACK_SIZE  SZ_4K
> > +
> >  #ifndef __ASSEMBLY__
> >
> >  struct task_struct;
> > diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
> > index b18f3aa98f42..ad8d8304539e 100644
> > --- a/arch/arm/kernel/entry-armv.S
> > +++ b/arch/arm/kernel/entry-armv.S
> > @@ -57,6 +57,14 @@ UNWIND(    .setfp  fpreg, sp               )
> >       @
> >       subs    r2, sp, r0              @ SP above bottom of IRQ stack?
> >       rsbscs  r2, r2, #THREAD_SIZE    @ ... and below the top?
> > +#ifdef CONFIG_VMAP_STACK
> > +     bcs     .L\@
> > +     mov_l   r2, overflow_stack      @ Take base address
> > +     add     r2, r2, r3              @ Top of this CPU's overflow stack
> > +     subs    r2, r0, r2              @ Compare with incoming SP
> > +     rsbscs  r2, r2, #OVERFLOW_STACK_SIZE
> > +.L\@:
> > +#endif
> >       movcs   sp, r0                  @ If so, revert to incoming SP
> >
> >  #ifndef CONFIG_UNWINDER_ARM
> > @@ -188,13 +196,18 @@ ENDPROC(__und_invalid)
> >  #define SPFIX(code...)
> >  #endif
> >
> > -     .macro  svc_entry, stack_hole=0, trace=1, uaccess=1
> > +     .macro  svc_entry, stack_hole=0, trace=1, uaccess=1, overflow_check=1
> >   UNWIND(.fnstart             )
> > - UNWIND(.save {r0 - pc}              )
> >       sub     sp, sp, #(SVC_REGS_SIZE + \stack_hole)
> > + THUMB(      add     sp, r0          )       @ get SP in a GPR without
> > + THUMB(      sub     r0, sp, r0      )       @ using a temp register
> > +
> > +     .if     \overflow_check
> > + UNWIND(.save        {r0 - pc}       )
> > +     do_overflow_check (SVC_REGS_SIZE + \stack_hole)
> > +     .endif
> > +
> >  #ifdef CONFIG_THUMB2_KERNEL
> > -     add     sp, r0                  @ get SP in a GPR without
> > -     sub     r0, sp, r0              @ using a temp register
> >       tst     r0, #4                  @ test stack pointer alignment
> >       sub     r0, sp, r0              @ restore original R0
> >       sub     sp, r0                  @ restore original SP
> > @@ -827,12 +840,20 @@ ENTRY(__switch_to)
> >       str     r7, [r8]
> >  #endif
> >       mov     r0, r5
> > -#if !defined(CONFIG_THUMB2_KERNEL)
> > +#if !defined(CONFIG_THUMB2_KERNEL) && !defined(CONFIG_VMAP_STACK)
> >       set_current r7
> >       ldmia   r4, {r4 - sl, fp, sp, pc}       @ Load all regs saved previously
> >  #else
> >       mov     r1, r7
> >       ldmia   r4, {r4 - sl, fp, ip, lr}       @ Load all regs saved previously
> > +#ifdef CONFIG_VMAP_STACK
> > +     @
> > +     @ Do a dummy read from the new stack while running from the old one so
> > +     @ that we can rely on do_translation_fault() to fix up any stale PMD
> > +     @ entries covering the vmalloc region.
> > +     @
> > +     ldr     r2, [ip]
> > +#endif
> >
> >       @ When CONFIG_THREAD_INFO_IN_TASK=n, the update of SP itself is what
> >       @ effectuates the task switch, as that is what causes the observable
> > @@ -849,6 +870,54 @@ ENTRY(__switch_to)
> >   UNWIND(.fnend               )
> >  ENDPROC(__switch_to)
> >
> > +#ifdef CONFIG_VMAP_STACK
> > +     .text
> > +__bad_stack:
> > +     @
> > +     @ We detected an overflow in svc_entry, which switched to the
> > +     @ overflow stack. Stash the exception regs, and head to our overflow
> > +     @ handler. Entered with the orginal value of SP in IP, and the original
> > +     @ value of IP in TPIDRURW
> > +     @
> > +
> > +#if defined(CONFIG_UNWINDER_FRAME_POINTER) && defined(CONFIG_CC_IS_GCC)
> > +     mov     ip, ip                          @ mov expected by unwinder
> > +     push    {fp, ip, lr, pc}                @ GCC flavor frame record
> > +#else
> > +     str     ip, [sp, #-8]!                  @ store original SP
> > +     push    {fpreg, lr}                     @ Clang flavor frame record
> > +#endif
> > +UNWIND( ldr  ip, [r0, #4]    )               @ load exception LR
> > +UNWIND( str  ip, [sp, #12]   )               @ store in the frame record
> > +     mrc     p15, 0, ip, c13, c0, 2          @ reload IP
> > +
> > +     @ Store the original GPRs to the new stack.
> > +     svc_entry uaccess=0, overflow_check=0
> > +
> > +UNWIND( .save   {sp, pc}     )
> > +UNWIND( .save   {fpreg, lr}  )
> > +UNWIND( .setfp  fpreg, sp    )
> > +
> > +     ldr     fpreg, [sp, #S_SP]              @ Add our frame record
> > +                                             @ to the linked list
> > +#if defined(CONFIG_UNWINDER_FRAME_POINTER) && defined(CONFIG_CC_IS_GCC)
> > +     ldr     r1, [fp, #4]                    @ reload SP at entry
> > +     add     fp, fp, #12
> > +#else
> > +     ldr     r1, [fpreg, #8]
> > +#endif
> > +     str     r1, [sp, #S_SP]                 @ store in pt_regs
> > +
> > +     @ Stash the regs for handle_bad_stack
> > +     mov     r0, sp
> > +
> > +     @ Time to die
> > +     bl      handle_bad_stack
> > +     nop
> > +UNWIND( .fnend                       )
> > +ENDPROC(__bad_stack)
> > +#endif
> > +
> >       __INIT
> >
> >  /*
> > diff --git a/arch/arm/kernel/entry-header.S b/arch/arm/kernel/entry-header.S
> > index ae24dd54e9ef..823dd1aa6e3e 100644
> > --- a/arch/arm/kernel/entry-header.S
> > +++ b/arch/arm/kernel/entry-header.S
> > @@ -423,3 +423,60 @@ scno     .req    r7              @ syscall number
> >  tbl  .req    r8              @ syscall table pointer
> >  why  .req    r8              @ Linux syscall (!= 0)
> >  tsk  .req    r9              @ current thread_info
> > +
> > +     .macro  do_overflow_check, frame_size:req
> > +#ifdef CONFIG_VMAP_STACK
> > +     @
> > +     @ Test whether the SP has overflowed. Task and IRQ stacks are aligned
> > +     @ so that SP & BIT(THREAD_SIZE_ORDER + PAGE_SHIFT) should always be
> > +     @ zero.
> > +     @
> > +ARM( tst     sp, #1 << (THREAD_SIZE_ORDER + PAGE_SHIFT)      )
> > +THUMB(       tst     r0, #1 << (THREAD_SIZE_ORDER + PAGE_SHIFT)      )
> > +THUMB(       it      ne                                              )
> > +     bne     .Lstack_overflow_check\@
> > +
> > +     .pushsection    .text
> > +.Lstack_overflow_check\@:
> > +     @
> > +     @ Either we've just detected an overflow, or we've taken an exception
> > +     @ while on the overflow stack. We cannot use the stack until we have
> > +     @ decided which is the case. However, as we won't return to userspace,
> > +     @ we can clobber some USR/SYS mode registers to free up GPRs.
> > +     @
> > +
> > +     mcr     p15, 0, ip, c13, c0, 2          @ Stash IP in TPIDRURW
> > +     mrs     ip, cpsr
> > +     eor     ip, ip, #(SVC_MODE ^ SYSTEM_MODE)
> > +     msr     cpsr_c, ip                      @ Switch to SYS mode
> > +     eor     ip, ip, #(SVC_MODE ^ SYSTEM_MODE)
> > +     mov     sp, ip                          @ Stash mode in SP_usr
> > +
> > +     @ Load the overflow stack into IP using LR_usr as a scratch register
> > +     mov_l   lr, overflow_stack + OVERFLOW_STACK_SIZE
> > +     mrc     p15, 0, ip, c13, c0, 4          @ Get CPU offset
> > +     add     ip, ip, lr                      @ IP := this CPU's overflow stack
> > +     mov     lr, sp                          @ Unstash mode into LR_usr
> > +     msr     cpsr_c, lr                      @ Switch back to SVC mode
> > +
> > +     @
> > +     @ Check whether we are already on the overflow stack. This may happen,
> > +     @ e.g., when performing accesses that may fault when dumping the stack.
> > +     @ The overflow stack is not in the vmalloc space so we only need to
> > +     @ check whether the incoming SP is below the top of the overflow stack.
> > +     @
> > +ARM( subs    ip, sp, ip              )       @ Delta with top of overflow stack
> > +THUMB(       subs    ip, r0, ip              )
> > +     mrclo   p15, 0, ip, c13, c0, 2          @ Restore IP
> > +     blo     .Lout\@                         @ Carry on
> > +
> > +THUMB(       sub     r0, sp, r0              )       @ Restore original R0
> > +THUMB(       sub     sp, r0                  )       @ Restore original SP
> > +     sub     sp, sp, ip                      @ Switch to overflow stack
> > +     add     ip, sp, ip                      @ Keep incoming SP value in IP
> > +     add     ip, ip, #\frame_size            @ Undo svc_entry's SP change
> > +     b       __bad_stack
> > +     .popsection
> > +.Lout\@:
> > +#endif
> > +     .endm
> > diff --git a/arch/arm/kernel/irq.c b/arch/arm/kernel/irq.c
> > index e05219bca218..5deb40f39999 100644
> > --- a/arch/arm/kernel/irq.c
> > +++ b/arch/arm/kernel/irq.c
> > @@ -56,7 +56,14 @@ static void __init init_irq_stacks(void)
> >       int cpu;
> >
> >       for_each_possible_cpu(cpu) {
> > -             stack = (u8 *)__get_free_pages(GFP_KERNEL, THREAD_SIZE_ORDER);
> > +             if (!IS_ENABLED(CONFIG_VMAP_STACK))
> > +                     stack = (u8 *)__get_free_pages(GFP_KERNEL,
> > +                                                    THREAD_SIZE_ORDER);
> > +             else
> > +                     stack = __vmalloc_node(THREAD_SIZE, THREAD_ALIGN,
> > +                                            THREADINFO_GFP, NUMA_NO_NODE,
> > +                                            __builtin_return_address(0));
> > +
> >               if (WARN_ON(!stack))
> >                       break;
> >               per_cpu(irq_stack_ptr, cpu) = &stack[THREAD_SIZE];
> > diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
> > index b42c446cec9a..eb8c73be7c81 100644
> > --- a/arch/arm/kernel/traps.c
> > +++ b/arch/arm/kernel/traps.c
> > @@ -121,7 +121,8 @@ void dump_backtrace_stm(u32 *stack, u32 instruction, const char *loglvl)
> >  static int verify_stack(unsigned long sp)
> >  {
> >       if (sp < PAGE_OFFSET ||
> > -         (sp > (unsigned long)high_memory && high_memory != NULL))
> > +         (!IS_ENABLED(CONFIG_VMAP_STACK) &&
> > +          sp > (unsigned long)high_memory && high_memory != NULL))
> >               return -EFAULT;
> >
> >       return 0;
> > @@ -291,7 +292,8 @@ static int __die(const char *str, int err, struct pt_regs *regs)
> >
> >       if (!user_mode(regs) || in_interrupt()) {
> >               dump_mem(KERN_EMERG, "Stack: ", regs->ARM_sp,
> > -                      ALIGN(regs->ARM_sp, THREAD_SIZE));
> > +                      ALIGN(regs->ARM_sp - THREAD_SIZE, THREAD_ALIGN)
> > +                      + THREAD_SIZE);
> >               dump_backtrace(regs, tsk, KERN_EMERG);
> >               dump_instr(KERN_EMERG, regs);
> >       }
> > @@ -838,3 +840,62 @@ void __init early_trap_init(void *vectors_base)
> >        */
> >  #endif
> >  }
> > +
> > +#ifdef CONFIG_VMAP_STACK
> > +
> > +DECLARE_PER_CPU(u8 *, irq_stack_ptr);
> > +
> > +asmlinkage DEFINE_PER_CPU_ALIGNED(u8[OVERFLOW_STACK_SIZE], overflow_stack);
> > +
> > +asmlinkage void handle_bad_stack(struct pt_regs *regs)
> > +{
> > +     unsigned long tsk_stk = (unsigned long)current->stack;
> > +     unsigned long irq_stk = (unsigned long)this_cpu_read(irq_stack_ptr);
> > +     unsigned long ovf_stk = (unsigned long)this_cpu_ptr(overflow_stack);
> > +
> > +     console_verbose();
> > +     pr_emerg("Insufficient stack space to handle exception!");
> > +
> > +     pr_emerg("Task stack:     [0x%08lx..0x%08lx]\n",
> > +              tsk_stk, tsk_stk + THREAD_SIZE);
> > +     pr_emerg("IRQ stack:      [0x%08lx..0x%08lx]\n",
> > +              irq_stk, irq_stk + THREAD_SIZE);
> > +     pr_emerg("Overflow stack: [0x%08lx..0x%08lx]\n",
> > +              ovf_stk, ovf_stk + OVERFLOW_STACK_SIZE);
> > +
> > +     die("kernel stack overflow", regs, 0);
> > +}
> > +
> > +/*
> > + * Normally, we rely on the logic in do_translation_fault() to update stale PMD
> > + * entries covering the vmalloc space in a task's page tables when it first
> > + * accesses the region in question. Unfortunately, this is not sufficient when
> > + * the task stack resides in the vmalloc region, as do_translation_fault() is a
> > + * C function that needs a stack to run.
> > + *
> > + * So we need to ensure that these PMD entries are up to date *before* the MM
> > + * switch. As we already have some logic in the MM switch path that takes care
> > + * of this, let's trigger it by bumping the counter every time the core vmalloc
> > + * code modifies a PMD entry in the vmalloc region.
> > + */
> > +void arch_sync_kernel_mappings(unsigned long start, unsigned long end)
> > +{
> > +     if (start > VMALLOC_END || end < VMALLOC_START)
> > +             return;
> > +
> > +     /*
> > +      * This hooks into the core vmalloc code to receive notifications of
> > +      * any PMD level changes that have been made to the kernel page tables.
> > +      * This means it should only be triggered once for every MiB worth of
> > +      * vmalloc space, given that we don't support huge vmalloc/vmap on ARM,
> > +      * and that kernel PMD level table entries are rarely (if ever)
> > +      * updated.
> > +      *
> > +      * This means that the counter is going to max out at ~250 for the
> > +      * typical case. If it overflows, something entirely unexpected has
> > +      * occurred so let's throw a warning if that happens.
> > +      */
> > +     WARN_ON(++init_mm.context.vmalloc_seq == UINT_MAX);
> > +}
> > +
> > +#endif
> > diff --git a/arch/arm/kernel/unwind.c b/arch/arm/kernel/unwind.c
> > index e8d729975f12..c5ea328c428d 100644
> > --- a/arch/arm/kernel/unwind.c
> > +++ b/arch/arm/kernel/unwind.c
> > @@ -389,7 +389,8 @@ int unwind_frame(struct stackframe *frame)
> >
> >       /* store the highest address on the stack to avoid crossing it*/
> >       ctrl.sp_low = frame->sp;
> > -     ctrl.sp_high = ALIGN(ctrl.sp_low, THREAD_SIZE);
> > +     ctrl.sp_high = ALIGN(ctrl.sp_low - THREAD_SIZE, THREAD_ALIGN)
> > +                    + THREAD_SIZE;
> >
> >       pr_debug("%s(pc = %08lx lr = %08lx sp = %08lx)\n", __func__,
> >                frame->pc, frame->lr, frame->sp);
> > diff --git a/arch/arm/kernel/vmlinux.lds.S b/arch/arm/kernel/vmlinux.lds.S
> > index f02d617e3359..aa12b65a7fd6 100644
> > --- a/arch/arm/kernel/vmlinux.lds.S
> > +++ b/arch/arm/kernel/vmlinux.lds.S
> > @@ -138,12 +138,12 @@ SECTIONS
> >  #ifdef CONFIG_STRICT_KERNEL_RWX
> >       . = ALIGN(1<<SECTION_SHIFT);
> >  #else
> > -     . = ALIGN(THREAD_SIZE);
> > +     . = ALIGN(THREAD_ALIGN);
> >  #endif
> >       __init_end = .;
> >
> >       _sdata = .;
> > -     RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
> > +     RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_ALIGN)
> >       _edata = .;
> >
> >       BSS_SECTION(0, 0, 0)
> >
>
> Git bisection log:
>
> -------------------------------------------------------------------------------
> git bisect start
> # good: [fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf] Linux 5.16-rc1
> git bisect good fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf
> # bad: [d1eccc4f44f11a8f3f5d376f08e3779d2196f93a] ARM: implement support for vmap'ed stacks
> git bisect bad d1eccc4f44f11a8f3f5d376f08e3779d2196f93a
> # good: [6bdd12e7427858bd0f1a68f553617fb1d97dbabb] ARM: call_with_stack: add unwind support
> git bisect good 6bdd12e7427858bd0f1a68f553617fb1d97dbabb
> # good: [fcc7029189cce80c2eac396ce4cd4544634d46e3] ARM: memset: clean up unwind annotations
> git bisect good fcc7029189cce80c2eac396ce4cd4544634d46e3
> # good: [e206f1841c51d2b3d8339efac3ac806f32d64821] ARM: switch_to: clean up Thumb2 code path
> git bisect good e206f1841c51d2b3d8339efac3ac806f32d64821
> # good: [a7c9e1b40e858eba7ff99a548153fd5c92b68e24] ARM: entry: rework stack realignment code in svc_entry
> git bisect good a7c9e1b40e858eba7ff99a548153fd5c92b68e24
> # first bad commit: [d1eccc4f44f11a8f3f5d376f08e3779d2196f93a] ARM: implement support for vmap'ed stacks
> -------------------------------------------------------------------------------
