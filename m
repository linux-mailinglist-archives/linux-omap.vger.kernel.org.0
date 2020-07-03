Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FCFB213E05
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jul 2020 19:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbgGCREc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 3 Jul 2020 13:04:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbgGCREb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 3 Jul 2020 13:04:31 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0D0FC08C5DE
        for <linux-omap@vger.kernel.org>; Fri,  3 Jul 2020 10:04:30 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id 80so29349111qko.7
        for <linux-omap@vger.kernel.org>; Fri, 03 Jul 2020 10:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kekVEpbIO7y7Zy2ic+9W88OAlfyvYXO9F0MmrWuPMes=;
        b=BsQbt2a2KxuCsEJCULjMcy0w8Huw7ZYVidvCJLn4GTSqKIYQBX6EFxWqAmV5lJVFcK
         fChr0d12IgjEhlw4a+1RR1RaVFZt4VLvv/E1QCHnzBwjTAH+BF/u4MvGn/Vv3gGvPRC1
         5ooFYrDK/os5YIT5k11pbkxkHT4ZnJpwCMjErn5TT5Q9Tp0qBtyHp/APu8tMzc2s1yMi
         3HLpyJoG8ilG0WYMKsS4sKriEHqjFU3yuJ5/KJnP8bBpcZwkQCSeWnX2a7YuALgxVbsT
         omzWIn4rzPVxspWRXYzOP1X6ffdX13kMVji2FqbVOPmZEYdEzWcqLu5YsQjelTjLG0xy
         e9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kekVEpbIO7y7Zy2ic+9W88OAlfyvYXO9F0MmrWuPMes=;
        b=tqxQAVyUmTl2CKAxMyHm8+HRkQuwiV9ZeoB8cL7HPso2YectgTpPApnGGL/JmaGYSS
         wFSGgHRq8CSVx9axrVaHzYiq8pJDWnDPGqZynWIiF+aROorB6J+8YzcGKWxtmpjU4QUb
         WBhBQG7bt7ieCJ+gWe5H9uP/Ujo0RBswQkp8A940N07K9dll0BfXCFW0ncrUjfR0Mejw
         eVuB7gsFJqS5zqgQFPdV/TZor/7e4SoEhJLyuoqmYy5LV2KQaq8k3rYB3Yy/An92N3vZ
         yjVrtAIWcxqbu4P3l1TONugsWyz88sxs/PFOQ5hjIQ2l61qoriONnBSiTluFTPWxWxnq
         NYWQ==
X-Gm-Message-State: AOAM530XiDLJj2xx9d9+QrN7qdBpbzc90SPHkwsFCTkbKbySqEjbcGkE
        /qs/OfkJ3q20Pz7oHHDiNn+2pZ52zeoNoi9McAYAQw==
X-Google-Smtp-Source: ABdhPJxh/pON8HZYRKACgaenguZaBxueymNnPYNgshbUR2pBl+67NWCnbO7L0Sk9aTNbXWHiF93mGRGobhPj7u9WQ48=
X-Received: by 2002:a37:64cd:: with SMTP id y196mr28956840qkb.303.1593795870000;
 Fri, 03 Jul 2020 10:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1593699479-1445-5-git-send-email-grzegorz.jaszczyk@linaro.org> <658e3a8d3374eca91387932a9a246add@kernel.org>
In-Reply-To: <658e3a8d3374eca91387932a9a246add@kernel.org>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Fri, 3 Jul 2020 19:04:18 +0200
Message-ID: <CAMxfBF5oB9=qkA8G4jD=KPht+OmZdOaTpsoqvRE881da51S2AA@mail.gmail.com>
Subject: Re: [PATCHv3 4/6] irqchip/irq-pruss-intc: Implement
 irq_{get,set}_irqchip_state ops
To:     Marc Zyngier <maz@kernel.org>
Cc:     tglx@linutronix.de, jason@lakedaemon.net,
        "Anna, Suman" <s-anna@ti.com>, robh+dt@kernel.org,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        "Mills, William" <wmills@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 2 Jul 2020 at 19:54, Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-07-02 15:17, Grzegorz Jaszczyk wrote:
> > From: David Lechner <david@lechnology.com>
> >
> > This implements the irq_get_irqchip_state and irq_set_irqchip_state
> > callbacks for the TI PRUSS INTC driver. The set callback can be used
> > by drivers to "kick" a PRU by enabling a PRU system event.
>
> "enabling"? That'd be unmasking an interrupt, which isn't what this
> does. "injecting", maybe?

Yes "injecting" is much better.

>
> >
> > Example:
> >      irq_set_irqchip_state(irq, IRQCHIP_STATE_PENDING, true);
>
> Nice example.
>
> What this example does explain is how you are actually going to kick
> a PRU via this interface. For that to happen, you'd have to have on
> the Linux side an interrupt that is actually routed to a PRU.

Correct.

> And from what I have understood of the previous patches, this can't
> be the case. What didi I miss?

The hwirq's handled by this driver are so called system events in
PRUSS nomenclature. This driver is responsible for the entire mapping
of those system events to PRUSS specific channels which are next
mapped to host_irq (patch #6 https://lkml.org/lkml/2020/7/2/612).
There are 8 host_irqs that are routed to the main cpu (running Linux)
and they are called host_intr0..host_intr7 (were seen in previous
patches of this series). But there are other "host_interrupts" that
are routed not to the main CPU but to PRU cores and this driver is
responsible for creating proper mapping (system
event/channel/host_irq) for them, and allowing to kick PRU via the
introduced interface.

It is worth noting that the PRUSS is quite flexible and allows various
things e.g.:
- map any of 160/64 internal system events to any of the 20/10 channels
- map any of the 20/10 channels to any of the 20/10 host interrupts.

So e.g. it is possible to map e.g. system event 17 to the main CPU
(through e.g. channel 1 which is the next map to e.g. host_intr0). Or
(exclusively) map the same system event 17 to PRU core (through e.g.
channel 1 which is the next map to PRU0).

>
> >
> > Signed-off-by: David Lechner <david@lechnology.com>
> > Signed-off-by: Suman Anna <s-anna@ti.com>
> > Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> > Reviewed-by: Lee Jones <lee.jones@linaro.org>
> > ---
> > v2->v3:
> > - Get rid of unnecessary pruss_intc_check_write() and use
> >   pruss_intc_write_reg directly.
> > v1->v2:
> > - https://patchwork.kernel.org/patch/11069769/
> > ---
> >  drivers/irqchip/irq-pruss-intc.c | 43
> > ++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 41 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-pruss-intc.c
> > b/drivers/irqchip/irq-pruss-intc.c
> > index 49c936f..19b3d38 100644
> > --- a/drivers/irqchip/irq-pruss-intc.c
> > +++ b/drivers/irqchip/irq-pruss-intc.c
> > @@ -7,6 +7,7 @@
> >   *   Suman Anna <s-anna@ti.com>
> >   */
> >
> > +#include <linux/interrupt.h>
> >  #include <linux/irq.h>
> >  #include <linux/irqchip/chained_irq.h>
> >  #include <linux/irqdomain.h>
> > @@ -39,8 +40,7 @@
> >  #define PRU_INTC_HIEISR              0x0034
> >  #define PRU_INTC_HIDISR              0x0038
> >  #define PRU_INTC_GPIR                0x0080
> > -#define PRU_INTC_SRSR0               0x0200
> > -#define PRU_INTC_SRSR1               0x0204
> > +#define PRU_INTC_SRSR(x)     (0x0200 + (x) * 4)
> >  #define PRU_INTC_SECR0               0x0280
> >  #define PRU_INTC_SECR1               0x0284
> >  #define PRU_INTC_ESR0                0x0300
> > @@ -145,6 +145,43 @@ static void pruss_intc_irq_relres(struct irq_data
> > *data)
> >       module_put(THIS_MODULE);
> >  }
> >
> > +static int pruss_intc_irq_get_irqchip_state(struct irq_data *data,
> > +                                         enum irqchip_irq_state which,
> > +                                         bool *state)
> > +{
> > +     struct pruss_intc *intc = irq_data_get_irq_chip_data(data);
> > +     u32 reg, mask, srsr;
> > +
> > +     if (which != IRQCHIP_STATE_PENDING)
> > +             return -EINVAL;
> > +
> > +     reg = PRU_INTC_SRSR(data->hwirq / 32);
>
> I assume the register file scales as more interrupts are added in the
> subsequent patch?
>
Yes, after I will move part of the next patch to patch #2 as you
suggested it will stop being confusing.

Thank you,
Grzegorz
