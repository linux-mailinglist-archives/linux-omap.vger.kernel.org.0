Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8408E26DDFE
	for <lists+linux-omap@lfdr.de>; Thu, 17 Sep 2020 16:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbgIQOUz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Sep 2020 10:20:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727454AbgIQOUh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 17 Sep 2020 10:20:37 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4480C061A28
        for <linux-omap@vger.kernel.org>; Thu, 17 Sep 2020 07:20:22 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id j3so1031233qvi.7
        for <linux-omap@vger.kernel.org>; Thu, 17 Sep 2020 07:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M7jZEG2Sruw3Jx4XQRAj0GDBXLVaPTMEGlVWTk6ugBI=;
        b=Zq1phMQAKGYqJWuXNL0yZLtOuPC6XEm8SZDz33cEnAJUyc/4q021fuLhFs53dtzuE2
         lX3OQeSDXqzF0+nGbWzTsZZzEc69i4icLE7jvV9WCYbTJvRwWeaPqDvFU6z2oN/0z5us
         i77gKNaXxZ4k4oehzh7O6nFoCLjtYCovgSZCqpX7tnBLfOWabI9OhbNiq1HZkFqALWAE
         Rvniy59LTFJBqxd4Xu5DtsM1TJT/0HAofrXp64PtT3FwCfbviGH3uw66qBczPiRdIex5
         ba/xkV5IOt6231SSZLzoRX8beU/dsIR4pNMcW7qLM1Y9meXOc0O7rg4VneOYg/cMsKJw
         pFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M7jZEG2Sruw3Jx4XQRAj0GDBXLVaPTMEGlVWTk6ugBI=;
        b=E4PwPjf30Ze0FAkuYrKiEPeWzhpPjnf64nTscua89tshxYX9tJ8qB1vOWrwmI/JDMQ
         nm78WX4yW5VM8Uvy+j61qdx+A2ub/ys+yqClydscDmw2Ftr8Ix4zSPuCmsl/AW1pHeki
         jTwXyvmGqRM+FGCuKP+QOP5NzwP7hlOMHCw+p+sbTeVVP0+75nmzHahF7bIoctGn5am+
         UXa63f+6HhuFaL8ZwhUAHRQ9djAaZ2WhL1hQKkLylanHr4zh57hL/ZVtkJqGwCvOZHrK
         D8G+SImuZgLjo9afbkH4AzKqtJ1Cr/ySgRTltgewc3OJDqtv8OatWq7mKitMXFZfi3PV
         4ddw==
X-Gm-Message-State: AOAM532CDX+0/SOhxz3nTBciBtKKXPzVKmKPgbVLOlmQegQprUJPCkDN
        5D9iBfD0Un+j8sIqUUJFdC4DUjhAyPa36cANI8QuFyERdlg=
X-Google-Smtp-Source: ABdhPJwMCn4z6UNz8c+Wp5fWTbuMOdJQrYNPE8efSjlFDxPEi/5DlPH02wBB60WIc/pNmJqU0u1f/FQRQ+txF6naRMA=
X-Received: by 2002:a0c:e348:: with SMTP id a8mr12621270qvm.49.1600352419745;
 Thu, 17 Sep 2020 07:20:19 -0700 (PDT)
MIME-Version: 1.0
References: <1600274110-30384-1-git-send-email-grzegorz.jaszczyk@linaro.org> <9797030dd2c11b24ae0f7ef760f12ffa@kernel.org>
In-Reply-To: <9797030dd2c11b24ae0f7ef760f12ffa@kernel.org>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Thu, 17 Sep 2020 16:20:08 +0200
Message-ID: <CAMxfBF6P7qz0WQs8j18j93Jjw5H3VfmP+1KOwHKw_giCAFKg1A@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] Add TI PRUSS Local Interrupt Controller IRQChip driver
To:     Marc Zyngier <maz@kernel.org>
Cc:     tglx@linutronix.de, jason@lakedaemon.net,
        "Anna, Suman" <s-anna@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        David Lechner <david@lechnology.com>,
        "Bajjuri, Praneeth" <praneeth@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 17 Sep 2020 at 12:45, Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-09-16 17:35, Grzegorz Jaszczyk wrote:
> > Hi All,
> >
> > The following is a v7 version of the series [1-6] that adds an IRQChip
> > driver for the local interrupt controller present within a Programmable
> > Real-Time Unit and Industrial Communication Subsystem (PRU-ICSS)
> > present on a
> > number of TI SoCs including OMAP architecture based AM335x, AM437x,
> > AM57xx SoCs,
> > Keystone 2 architecture based 66AK2G SoCs, Davinci architecture based
> > OMAP-L138/DA850 SoCs and the latest K3 architecture based AM65x and
> > J721E SoCs.
> > Please see the v1 cover-letter [1] for details about the features of
> > this
> > interrupt controller.  More details can be found in any of the
> > supported SoC
> > TRMs.  Eg: Chapter 30.1.6 of AM5728 TRM [7]
> >
> > Please see the individual patches for exact changes in each patch,
> > following are
> > the main changes from v5:
> >  - Add Co-developed-by tags.
> >  - Change the irq type to IRQ_TYPE_LEVEL_HIGH in patch #2.
>
> Applied to irq/irqchip-next.
>

Thank you!
Grzegorz
