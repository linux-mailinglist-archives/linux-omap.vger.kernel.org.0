Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D905B268EAC
	for <lists+linux-omap@lfdr.de>; Mon, 14 Sep 2020 16:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgINO7T (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Sep 2020 10:59:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726921AbgINO7Q (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 14 Sep 2020 10:59:16 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A350FC06174A
        for <linux-omap@vger.kernel.org>; Mon, 14 Sep 2020 07:59:15 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id g3so54378qtq.10
        for <linux-omap@vger.kernel.org>; Mon, 14 Sep 2020 07:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TI5UfO8CrhKlxSTB0fizVNNuJljGKxUe27eUOJYXQoA=;
        b=sr6LAD6B25leq62gmbiDCVsb2Vy+TsneobGpZ3/FszDIr9j20hCmO7B/S3Hs+2EQ98
         Rfb4eFP8MeWQJLG74ckXsXbR3dxP2fDKJJi5uZMjxXwDwvG0EETtramH1ibOBF7jhgfz
         61mce+LvufkYZynzEbEuGlYadfQpcsA5sunof0rCFfMS205sRw1np8xG7qRhHDwwCBBI
         EjYnHxMdR5ml0TMUNtCMFNXNPlb4gIyT3g0b9D6TAva7QaC64gEceI3VSiy81P6thUIB
         Cm+EeQyqAOOxrphSsTLMe/T6Cw2tLSd4WgHBDUAXg1mwO1udm0CyBmiNjfgEHqJHXq2v
         TZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TI5UfO8CrhKlxSTB0fizVNNuJljGKxUe27eUOJYXQoA=;
        b=nLZoG9t/zu+QN/F1t6YjKQ0M4RRTPmcNwZR1QETit20tJiSl45gAf+Vb+U4tyyt16c
         zvJ2Vgb2T8cRN95PbfzzT8tb3srvTMVtbV08PnByfL8wJzEqzV7Aj31mxaRAz5Viur94
         NcOetFUBaD+lufJUMYZGswhAlfiVlO+KuoU61KhtDghQ96ucTq1/m09x2CZIhQdqGdcS
         lYBNH40ZaWf2D3HGYdFcEYndqXAJKEn09f2gYCM1iKhGaWZPBJ0tpevE2Vz4J2nZVMaR
         opsR19AcHyXNoKeCZNkAMyZSzZoZYDSOth+eXrhwSzZ2xdn8M9IqDsg4h8YzPXiBHnDp
         8WCg==
X-Gm-Message-State: AOAM533Q3Af45HbQrX4vHYgJWMoUHBCAlGxbiy3V6RctmxpTzkrRvHGb
        KfzmKWgpFH9BZJdwP4YGaBwtNJALJ6uAZDxDYfrQbw==
X-Google-Smtp-Source: ABdhPJzE1Q0xqknRdRoK8U7HNFZKzLHcd3U+p+aKDmfcmkAnNREsFT1MH9lvooSs/7x/6zC3vSbp+glWuGc4ZBbbnCw=
X-Received: by 2002:ac8:6ec2:: with SMTP id f2mr13983987qtv.159.1600095554884;
 Mon, 14 Sep 2020 07:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <1598886558-16546-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1598886558-16546-5-git-send-email-grzegorz.jaszczyk@linaro.org> <87lfhfl3yv.wl-maz@kernel.org>
In-Reply-To: <87lfhfl3yv.wl-maz@kernel.org>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Mon, 14 Sep 2020 16:59:03 +0200
Message-ID: <CAMxfBF7cPwPSbNuNqohy3BJGMqtiPk22_5hxrrSpvKUAVB4epA@mail.gmail.com>
Subject: Re: [RESEND PATCH v5 4/5] irqchip/irq-pruss-intc: Implement
 irq_{get,set}_irqchip_state ops
To:     Marc Zyngier <maz@kernel.org>
Cc:     tglx@linutronix.de, jason@lakedaemon.net,
        "Anna, Suman" <s-anna@ti.com>, robh+dt@kernel.org,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        David Lechner <david@lechnology.com>,
        "Bajjuri, Praneeth" <praneeth@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, 12 Sep 2020 at 11:49, Marc Zyngier <maz@kernel.org> wrote:
>
> On Mon, 31 Aug 2020 16:09:17 +0100,
> Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org> wrote:
> >
> > From: David Lechner <david@lechnology.com>
> >
> > This implements the irq_get_irqchip_state and irq_set_irqchip_state
> > callbacks for the TI PRUSS INTC driver. The set callback can be used
> > by drivers to "kick" a PRU by injecting a PRU system event.
> >
> > Example:
> >      irq_set_irqchip_state(irq, IRQCHIP_STATE_PENDING, true);
> >
>
> Please drop this "example", it brings nothing without the full
> context. This patch just implements a standard callback.
>

Ok. Thank you for your review,
Grzegorz
