Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8C8218032
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jul 2020 09:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730020AbgGHHEQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 8 Jul 2020 03:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729856AbgGHHEP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 8 Jul 2020 03:04:15 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA71EC061755
        for <linux-omap@vger.kernel.org>; Wed,  8 Jul 2020 00:04:15 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id b25so12304667qto.2
        for <linux-omap@vger.kernel.org>; Wed, 08 Jul 2020 00:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2iS8GNVus2oLt6BrJG806hhfOAQEc/axdhBS15zjWLo=;
        b=Omi9/UjyrDM94m6Hn/9tGzuCwejaXFZixzxkS4l0YPmtw6UPjYdnkDbOX5Q2rV/lFr
         u1TxIMxdxNTW4aT9NliJDUOzsqwMCfgBqv/GaB6/YcxP8D6m9dW9G1Q2A+k1AhXcnIcJ
         YDBmI2aKHBzbPIgwQ/GLoCx1rqtpSxv5WBgRsVTLGi4tu0OSrcxmQGlKWX7U++jKCkNF
         C7COudJTQnTpO/GUP94Li97jg42fApyQJxTH5GM9g+U2rK42Dat7lPNCxd5duQoADePp
         vx27GRxaYe2rU7Vecb4trNeAPCLI/J4z3NdkXw3WZKnEZ10krHbJ+zMVgBT/BokdEoOk
         LZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2iS8GNVus2oLt6BrJG806hhfOAQEc/axdhBS15zjWLo=;
        b=N+1IZBqju7d3YzBn3fC2oGUyLATvRfuOeEJpv3L5OJo7GcdyIe/9nJmJ7/VfraBsZX
         Q1Uv2RVEeIRMkwjGPPC+iPYS6k54k4v3Qa3K71yFOoVT70XEuNJI1czjeKj6TEn9stZY
         0Kta0wysxiEFzjXhudPrJ03K9C+U+6cXaKLigfwQXjKHPs8MT1X7G7jDSFVi9ChqVQPs
         UcVRxzGAKXdPGJZAVFOUVSJ7pKVLrudc67puEORIo+QP54q+4b9J2/tMD9rSejhdn3Rs
         KGv6vAbSGW51RzSqXJYqz56yjzuOMMXD//+rNl1l/pWHlhy53Ptp4gs0Qz6g7CpgykLN
         R7dw==
X-Gm-Message-State: AOAM531ZPGcb8CZNWq4BWK0/W+PXIBpN6FBZTHKxUqY2cPJ7ceDyb6kn
        KEDFzCZnR0ZQ4k1w7BICoz+mG68ybwD0i7TJ/SwXow==
X-Google-Smtp-Source: ABdhPJyOpd9MCvJq83xKqOPDNKMak9gwDotLjA6QoKzbnEMOiGr9okynYLPyXCkNOJLEALP09uEV9N6WRvLQc4GN8+c=
X-Received: by 2002:ac8:66d1:: with SMTP id m17mr58814731qtp.88.1594191854938;
 Wed, 08 Jul 2020 00:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1593699479-1445-3-git-send-email-grzegorz.jaszczyk@linaro.org>
 <f0d3f3224a1b8fa2be668dd2b8d9d84e@kernel.org> <CAMxfBF6A9702-rBOo0jHtfn4Ds1_G+nWG4O9-urNqU00dFXeww@mail.gmail.com>
 <12db6d22c12369b6d64f410aa2434b03@kernel.org> <CAMxfBF7pbH1LLE4fJnnCPnrqnQ-tdO+_xfoN1VerJcQ-ZyYM9Q@mail.gmail.com>
 <53d39d8fbd63c6638dbf0584c7016ee0@kernel.org>
In-Reply-To: <53d39d8fbd63c6638dbf0584c7016ee0@kernel.org>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Wed, 8 Jul 2020 09:04:03 +0200
Message-ID: <CAMxfBF6Th+zKOmogA5phkh21tSUzutokCgU+pv0Eh-sDk=1Hbg@mail.gmail.com>
Subject: Re: [PATCHv3 2/6] irqchip/irq-pruss-intc: Add a PRUSS irqchip driver
 for PRUSS interrupts
To:     Marc Zyngier <maz@kernel.org>
Cc:     tglx@linutronix.de, jason@lakedaemon.net,
        "Anna, Suman" <s-anna@ti.com>, robh+dt@kernel.org,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        "Mills, William" <wmills@ti.com>, "Andrew F . Davis" <afd@ti.com>,
        Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, 5 Jul 2020 at 22:45, Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-07-05 14:26, Grzegorz Jaszczyk wrote:
> > On Sat, 4 Jul 2020 at 11:39, Marc Zyngier <maz@kernel.org> wrote:
> >>
> >> On 2020-07-03 15:28, Grzegorz Jaszczyk wrote:
>
> [...]
>
> >> It still begs the question: if the HW can support both edge and level
> >> triggered interrupts, why isn't the driver supporting this diversity?
> >> I appreciate that your HW may only have level interrupts so far, but
> >> what guarantees that this will forever be true? It would imply a
> >> change
> >> in the DT binding, which isn't desirable.
> >
> > Ok, I've got your point. I will try to come up with something later
> > on. Probably extending interrupt-cells by one and passing interrupt
> > type will be enough for now. Extending this driver to actually support
> > it can be handled later if needed. Hope it works for you.
>
> Writing a set_type callback to deal with this should be pretty easy.
> Don't delay doing the right thing.

Ok.

>
> [...]
>
> >> >> > +             hwirq = hipir & GENMASK(9, 0);
> >> >> > +             virq = irq_linear_revmap(intc->domain, hwirq);
> >> >>
> >> >> And this is where I worry. You seems to have a single irqdomain
> >> >> for all the muxes. Are you guaranteed that you will have no
> >> >> overlap between muxes? And please use irq_find_mapping(), as
> >> >> I have top-secret plans to kill irq_linear_revmap().
> >> >
> >> > Regarding irq_find_mapping - sure.
> >> >
> >> > Regarding irqdomains:
> >> > It is a single irqdomain since the hwirq (system event) can be mapped
> >> > to different irq_host (muxes). Patch #6
> >> > https://lkml.org/lkml/2020/7/2/616 implements and describes how input
> >> > events can be mapped to some output host interrupts through 2 levels
> >> > of many-to-one mapping i.e. events to channel mapping and channels to
> >> > host interrupts. Mentioned implementation ensures that specific system
> >> > event (hwirq) can be mapped through PRUSS specific channel into a
> >> > single host interrupt.
> >>
> >> Patch #6 is a nightmare of its own, and I haven't fully groked it yet.
> >> Also, this driver seems to totally ignore the 2-level routing. Where
> >> is it set up? map/unmap in this driver do exactly *nothing*, so
> >> something somewhere must set it up.
> >
> > The map/unmap is updated in patch #6 and it deals with those 2-level
> > routing setup. Map is responsible for programming the Channel Map
> > Registers (CMRx) and Host-Interrupt Map Registers (HMRx) basing on
> > provided configuration from the one parsed in the xlate function.
> > Unmap undo whatever was done on the map. More details can be found in
> > patch #6.
> >
> > Maybe it would be better to squash patch #6 with this one so it would
> > be less confusing. What is your advice?
>
> So am I right in understanding that without patch #6, this driver does
> exactly nothing? If so, it has been a waste of review time.
>
> Please split patch #6 so that this driver does something useful
> for Linux, without any of the PRU interrupt routing stuff. I want
> to see a Linux-only driver that works and doesn't rely on any other
> exotic feature.
>

Patch #6 provides PRU specific 2-level routing setup. This step is
required and it is part of the entire patch-set. Theoretically routing
setup could be done by other platform driver (not irq one) or e.g. by
PRU firmware. In such case this driver would be functional without
patch #6 but I do not think it would be proper. All this routing setup
is done via PRUSS INTC unit and uses PRUSS INTC register set,
therefore delegating it to another driver doesn't seem to be the best
option. Furthermore delegating this step to PRU firmware is also
problematic. First of all the PRU core tiny Instruction RAM space
makes it difficult to fit it together with the code that is required
for running a PRU specific application. Another issue that I see is
splitting management of the PRUSS INTC unit to Linux (main CPU) and
PRU firmware (PRU core).

I am also not sure if splitting patch #6 makes sense. Mentioned patch
allows to perform the entire 2-level routing setup. There is no
distinction between routing setup for main CPU and PRU core, both use
the same logic.The only difference between setting up the routing for
main CPU (Linux) and PRU core is choosing different, so called, "host
interrupt" in final level mapping.

Discussion about previous approach of handling this 2-level routing
setup can be found in v2 of this patch-set
(https://patchwork.kernel.org/patch/11069751/) - mentioned approach
wasn't good and was dropped but problem description made by Suman may
be useful.

I am open to any suggestion if there is a better way of handling
2-level routing. I will also appreciate if you could elaborate about
issues that you see with patch #6.

Best regards,
Grzegorz
