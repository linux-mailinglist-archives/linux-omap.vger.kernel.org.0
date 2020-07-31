Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC792345CB
	for <lists+linux-omap@lfdr.de>; Fri, 31 Jul 2020 14:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733019AbgGaM2Q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 31 Jul 2020 08:28:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732953AbgGaM2Q (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 31 Jul 2020 08:28:16 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18014C06174A
        for <linux-omap@vger.kernel.org>; Fri, 31 Jul 2020 05:28:16 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id t23so19623108qto.3
        for <linux-omap@vger.kernel.org>; Fri, 31 Jul 2020 05:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GpNuJXQqlOCS5GDhX83vpT+wKOWnehhWp+8dfJ9ixf8=;
        b=cXZ/EyzfeupDWbipTBUjVJZ+y8cP5jdycblY7Z44CJzHSeRA1+/URHNLmNEBG6BcOM
         stbguOeWoSqquxN/JWuE1EJG24866Y9gW6yGcPv1DjBmzHnHPnYiGSPTgEi2gsemJ0J4
         NwSvx+gXc0G4R2oNG5ktox1/YbsRpUYDKMtgMbLW6ktjs6pgCzdFaNHmT5i8GLfar8rX
         LmIX/euaj/XZnevGsKwtZrOLf3ZUdikX/ARBBD8q1Bcn9QSW91AywUdm3OVBnsaMsjoS
         cdR0EiIR/Oq/XzEOgxoNyYat+O/9QHuikFCr7b7kYlRE9bfJ5uupbOprsNTY2RGNNx2d
         ++1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GpNuJXQqlOCS5GDhX83vpT+wKOWnehhWp+8dfJ9ixf8=;
        b=aBnYOM7yrx4BdwsTUyKsBERTW490SM9JCf6kuUUty8QAAoYLCv9quPP+BA25QpziyZ
         uGDS2qd+iBDrHN0JzjyGMMr2CnpNMtYFK+cYc3OyLFdlE6Z1pvUfblWxsedNXbPV1bAO
         U9zG48CDKYx1XKVljF7CTa6aw60umBYeIXY3xz2ePqgZFBZlTkQ4gUwyBhGxTUnX5y+s
         nuqNwJQu3HpK71HVerY9Slh/NNUSK/z/cGdKwO1LwC2j9HcGQ0P4KeXGuxZgYiBiAepJ
         B7pubWN1z6tBYOS2XB7xxToyNOw563ifHxyvUAZkBwYA0vIUAzJIod3P5Cv2oR+8OypO
         8KhQ==
X-Gm-Message-State: AOAM530npVwcs57wfl4IxXWRvoRY3PE1kMZSNy5nENhBRD6ii+KZmFUo
        5ck8QvRDbijaaPxzmJdbuUWKjP6xsburtRRzqMYpUA==
X-Google-Smtp-Source: ABdhPJyC4PI0MMIp9wDUvN+USBI9m1uGvSm0aAlyJ4syTr+1+ju/bY8i/k2DL7z40LWm81Mb4WmTN/wEXFNd6QSuv7g=
X-Received: by 2002:aed:22cb:: with SMTP id q11mr1035394qtc.200.1596198495028;
 Fri, 31 Jul 2020 05:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <1595927918-19845-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1595927918-19845-5-git-send-email-grzegorz.jaszczyk@linaro.org> <f65c6b32-7754-9880-1912-3b0b30a3d6d4@lechnology.com>
In-Reply-To: <f65c6b32-7754-9880-1912-3b0b30a3d6d4@lechnology.com>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Fri, 31 Jul 2020 14:28:04 +0200
Message-ID: <CAMxfBF4--kP=tt-1LqMB=W8B6gHYu1vFFMtnLPgc-akeLiK-Yw@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] irqchip/irq-pruss-intc: Implement
 irq_{get,set}_irqchip_state ops
To:     David Lechner <david@lechnology.com>, Marc Zyngier <maz@kernel.org>
Cc:     tglx@linutronix.de, jason@lakedaemon.net,
        "Anna, Suman" <s-anna@ti.com>, robh+dt@kernel.org,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Mills, William" <wmills@ti.com>,
        "Bajjuri, Praneeth" <praneeth@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 29 Jul 2020 at 21:23, David Lechner <david@lechnology.com> wrote:
>
> On 7/28/20 4:18 AM, Grzegorz Jaszczyk wrote:
> > From: David Lechner <david@lechnology.com>
> >
> > This implements the irq_get_irqchip_state and irq_set_irqchip_state
> > callbacks for the TI PRUSS INTC driver. The set callback can be used
> > by drivers to "kick" a PRU by injecting a PRU system event.
> >
> > Example:
>
> We could improve this example by showing a device tree node of a
> firmware-defined device implemented in the PRU:
>
>         /* Software-defined UART in PRU */
>         pru_uart: serial@XXXX {
>                 compatible = "ti,pru-uart";
>                 ...
>                 interrupt-parent = <&pruss_intc>;
>                 /* PRU system event 31, channel 0, host event 0 */
>                 interrupts = <31 0 0>, ...;
>                 interrupt-names = "kick", ...;
>                 ...
>         },
>
> Then driver would request the IRQ during probe:
>
>         data->kick_irq = of_irq_get_byname(dev, "kick");
>         if (data->kick_irq < 0)
>                 ...
>
>
> And later the driver would use the IRQ to kick the PRU:
>
>         irq_set_irqchip_state(data->kick_irq, IRQCHIP_STATE_PENDING, true);
>
>

We could but I am not sure if this kind of complex example should land
in the commit log.
Marc could you please comment how you want to see this?

Thank you,
Grzegorz
