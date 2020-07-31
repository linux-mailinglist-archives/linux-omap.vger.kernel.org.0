Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81F0D234776
	for <lists+linux-omap@lfdr.de>; Fri, 31 Jul 2020 16:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732335AbgGaOLm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 31 Jul 2020 10:11:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727851AbgGaOLm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 31 Jul 2020 10:11:42 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1999FC061574
        for <linux-omap@vger.kernel.org>; Fri, 31 Jul 2020 07:11:42 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id e5so8967161qth.5
        for <linux-omap@vger.kernel.org>; Fri, 31 Jul 2020 07:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zXpZPwG3QbgNXE97/2cLGjIf1FCzQ19LC9h/m/WwwVs=;
        b=DIbX+0nIyTNIDs1WHA8a4ipIxsqC7PW2mFt1JElyKYD6wSvmpQQTdzFJ5TQLeAWFin
         Wc4xWl1vAewfC9Mt2ZGKPcAo8yISkbT6r1OIiLdrekXbkOMECjodVIejniTqfoz4qqJr
         JxcjZvvoLn3sd2u5RI44glIsSUQPX9pVpc+fHAuXjUfLHMvDo9hVe74z0aaOO7uyALya
         SEx1SGQNbDiqr5kgZ4TWJDSJkbmmsJUp98fDdgNcAA0U0whTsJhSYzt/alALC1ZrU9P3
         qpItJysOvjdmMfygPOEgjphd2YjRabPfYOb3Bs+kZu7CxdCej/+jK+1hPXYkjyya/bCu
         F0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zXpZPwG3QbgNXE97/2cLGjIf1FCzQ19LC9h/m/WwwVs=;
        b=FZERHCVXgLwovvx8S33N7bTKaJGwiI+a3Tj4GTgn41U0UIp1F1vBa4aXXFsxFtvXLc
         1+1YRAZa8oYm7eSyWZyokUZLqrHPPRVP9az9BdXoxJQHnINX/qfMId3n6BswfcRJ50Py
         tzGdxeDWH4nXt3QwGe2t1UtS1R6E8hf3TQsKvISiESBPvZAHCy0LJdPvprFHyqaw7o6Z
         /u3E8WGXUXWUK3uxsNqPhh61QAu+8d/ABnBYvT7sA3VL5k0jijGXfdunf0+wT85Ieeso
         yIj6KZTn94l/ZiTT4TrN7Ni+z6GDr82ZFRzOfLKA3GeFMbylPvj/+nmrqAbYXEBAEVK1
         9qBA==
X-Gm-Message-State: AOAM533RJCpN1Z/f2ZFpDneaTM8BVvUxt19AexE/XgYjrpWYhDWJGYB7
        B6hL5AB49aHl3u7AgKwl8BvNBF162N5yCKyMeg0IUw==
X-Google-Smtp-Source: ABdhPJwnmQyoXfzFX+W8K45D31R9RbniOEVvLK4NDZCe/SS88TfcmX7MQjEuWl25D353CCsRvk63E7rRxCErB9u6Sr4=
X-Received: by 2002:ac8:6713:: with SMTP id e19mr3833232qtp.88.1596204701220;
 Fri, 31 Jul 2020 07:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <1595927918-19845-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1595927918-19845-4-git-send-email-grzegorz.jaszczyk@linaro.org> <c2695e63-dd4f-9eb9-afbc-fa52d7e88a86@lechnology.com>
In-Reply-To: <c2695e63-dd4f-9eb9-afbc-fa52d7e88a86@lechnology.com>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Fri, 31 Jul 2020 16:11:30 +0200
Message-ID: <CAMxfBF5aQVE2YMKyBcSRaP-=NWHowSfzLz11WzEi=7ZeJDQLBw@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] irqchip/irq-pruss-intc: Add logic for handling
 reserved interrupts
To:     David Lechner <david@lechnology.com>
Cc:     tglx@linutronix.de, jason@lakedaemon.net,
        Marc Zyngier <maz@kernel.org>, "Anna, Suman" <s-anna@ti.com>,
        robh+dt@kernel.org, Lee Jones <lee.jones@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "Mills, William" <wmills@ti.com>,
        "Bajjuri, Praneeth" <praneeth@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 29 Jul 2020 at 20:48, David Lechner <david@lechnology.com> wrote:
>
> On 7/28/20 4:18 AM, Grzegorz Jaszczyk wrote:
> > From: Suman Anna <s-anna@ti.com>
> >
> > The PRUSS INTC has a fixed number of output interrupt lines that are
> > connected to a number of processors or other PRUSS instances or other
> > devices (like DMA) on the SoC. The output interrupt lines 2 through 9
> > are usually connected to the main Arm host processor and are referred
> > to as host interrupts 0 through 7 from ARM/MPU perspective.
> >
> > All of these 8 host interrupts are not always exclusively connected
> > to the Arm interrupt controller. Some SoCs have some interrupt lines
> > not connected to the Arm interrupt controller at all, while a few others
> > have the interrupt lines connected to multiple processors in which they
> > need to be partitioned as per SoC integration needs. For example, AM437x
> > and 66AK2G SoCs have 2 PRUSS instances each and have the host interrupt 5
> > connected to the other PRUSS, while AM335x has host interrupt 0 shared
> > between MPU and TSC_ADC and host interrupts 6 & 7 shared between MPU and
> > a DMA controller.
> >
> > Add logic to the PRUSS INTC driver to ignore both these shared and
> > invalid interrupts.
>
> If a person wanted to use DMA with a PRU what will handle the mapping
> of a PRU event to host interrupt 6 or 7 if they are being ignored here?

Mapping can be handled independently: even if a given host interrupt
is on irqs-reserved list, the mapping description for it can be
provided (e.g. similar to the resource table case passed through rproc
subsystem) and nothing prevents this driver from actually routing it.

>
> >
> > Signed-off-by: Suman Anna <s-anna@ti.com>
> > Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> > ---
> > v3->v4:
> > - Due to changes in DT bindings which converts irqs-reserved
> >    property from uint8-array to bitmask requested by Rob introduce
> >    relevant changes in the driver.
> > - Merge the irqs-reserved and irqs-shared to one property since they
> >    can be handled by one logic (relevant change was introduced to DT
> >    binding).
> > - Update commit message.
> > v2->v3:
> > - Extra checks for (intc->irqs[i]) in error/remove path was moved from
> >    "irqchip/irq-pruss-intc: Add a PRUSS irqchip driver for PRUSS
> >    interrupts" to this patch
> > v1->v2:
> > - https://patchwork.kernel.org/patch/11069757/
> > ---
> >   drivers/irqchip/irq-pruss-intc.c | 29 ++++++++++++++++++++++++-----
> >   1 file changed, 24 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-intc.c
> > index 45b966a..cf9a59b 100644
> > --- a/drivers/irqchip/irq-pruss-intc.c
> > +++ b/drivers/irqchip/irq-pruss-intc.c
> > @@ -474,7 +474,7 @@ static int pruss_intc_probe(struct platform_device *pdev)
> >       struct pruss_intc *intc;
> >       struct pruss_host_irq_data *host_data[MAX_NUM_HOST_IRQS] = { NULL };
> >       int i, irq, ret;
> > -     u8 max_system_events;
> > +     u8 max_system_events, invalid_intr = 0;
> >
> >       data = of_device_get_match_data(dev);
> >       if (!data)
> > @@ -496,6 +496,16 @@ static int pruss_intc_probe(struct platform_device *pdev)
> >               return PTR_ERR(intc->base);
> >       }
> >
> > +     ret = of_property_read_u8(dev->of_node, "ti,irqs-reserved",
> > +                               &invalid_intr);
>
> Why not make the variable name match the property name?

Sure, I will rename this variable.

Thank you for your review,
Grzegorz
