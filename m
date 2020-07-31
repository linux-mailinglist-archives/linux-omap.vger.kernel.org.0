Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C202234793
	for <lists+linux-omap@lfdr.de>; Fri, 31 Jul 2020 16:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728802AbgGaOQj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 31 Jul 2020 10:16:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728752AbgGaOQj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 31 Jul 2020 10:16:39 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FF88C06174A
        for <linux-omap@vger.kernel.org>; Fri, 31 Jul 2020 07:16:39 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id s23so22991290qtq.12
        for <linux-omap@vger.kernel.org>; Fri, 31 Jul 2020 07:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ghusglmB0el24Vhn8WtszcgSvBkG8uGRUxxlzLuuep0=;
        b=GKjQcDrGctfJSP0MxKFQt7g9h74EGF0pJtWuAyksJXuJqiRblwSk7MDDFONbAqOwlZ
         DtHi1ftC7PHqIbFiOYLLvZkgwhAip/iXhI7ME0/IpOP3hmP/W8umypjmsF7HJRt7vEJm
         9c5ECjVPGhefCP/cQgx8u+ANBTh9rkUPc86UuA/GyPhbNywsciPPUrjT8hPL0H4aZeLY
         hFkGGOP3cc+rNjFBNUuKl6ijMr8wzY4Q7aopKUA3YL7qNnUohmkJKJdkO5Hhq+UOT5sA
         gQc/FzCjAHGqnqAXKDz+SFeIvIem9t1UtPRVpmIyBlYyB9UHJStUWhOYvFsgaYbf3At/
         paTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ghusglmB0el24Vhn8WtszcgSvBkG8uGRUxxlzLuuep0=;
        b=RP7BiqfSOKkL7HBqAwf41bGQTXP3ixvBTf80RctllEOCQ7wnZgOYpunENk/IiKR1WM
         Lj7/g0jeu0gtBEUdUnCJ3PwpL9BV0+z1AjVWRBp2pc4RJPgjk5Nhw0YBvHbxabAfrE32
         YzKM41rXwLKsSGtX2/rM6rlobbNg1LNLXA3bO3ZAX+5RtZKYCyvZS7tvYBkbc1r4230A
         Q3kvFoY5vDNn8sjIGTiWi4KG9J2NWilWEFCjM1Pp7lzasbIhPM6onFlZ+UJyJ2eSM1OM
         piLbpC8rP84o/ULI8FTFyz93mxoa6z6vfpE8DGCXowGwEMpBvBJzasBPUoA39VVDaoVz
         1nmA==
X-Gm-Message-State: AOAM5303d7ZFit1fUtVs9chMkdzF+nhHUhfkQjqWtvLJTy2YGAuF9P66
        lSpxnVyzxYmNAXLVxY6zS93ricjMUgdcCipBQRRgqmoZ
X-Google-Smtp-Source: ABdhPJxBCJqCBGgyBFCMXjcC3LyLHOUNRibNVNQ966bV6UxDsl4M2CekvEMJxZx1HEcMnDbKyFJ0YnkBduJNah6kqV0=
X-Received: by 2002:ac8:42c8:: with SMTP id g8mr3664569qtm.97.1596204998340;
 Fri, 31 Jul 2020 07:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <1595927918-19845-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1595927918-19845-2-git-send-email-grzegorz.jaszczyk@linaro.org>
 <01bac597-c1a0-1851-b630-a79929777a16@lechnology.com> <CAMxfBF6Ru1Fm1oWDyrSM=kBdCUe+eUDChqDgoYo4ziVr-8c50Q@mail.gmail.com>
 <19fbf4f6-ea75-3eb7-7e95-c7c9ce987996@lechnology.com>
In-Reply-To: <19fbf4f6-ea75-3eb7-7e95-c7c9ce987996@lechnology.com>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Fri, 31 Jul 2020 16:16:27 +0200
Message-ID: <CAMxfBF4jvWiT8CH+--OBxLiptiN42-WOMHAZhP7VM51GzgHWnA@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: irqchip: Add PRU-ICSS interrupt
 controller bindings
To:     David Lechner <david@lechnology.com>
Cc:     tglx@linutronix.de, jason@lakedaemon.net,
        Marc Zyngier <maz@kernel.org>, "Anna, Suman" <s-anna@ti.com>,
        robh+dt@kernel.org, Lee Jones <lee.jones@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "Mills, William" <wmills@ti.com>,
        "Bajjuri, Praneeth" <praneeth@ti.com>,
        "Andrew F . Davis" <afd@ti.com>, Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 31 Jul 2020 at 16:09, David Lechner <david@lechnology.com> wrote:
>
> On 7/31/20 6:48 AM, Grzegorz Jaszczyk wrote:
> > On Wed, 29 Jul 2020 at 19:34, David Lechner <david@lechnology.com> wrote:
> >> It is not clear what the meaning of each cell is. Looking at later patches, it
> >> looks like the first cell is the PRU system event number, the second cell is the
> >> channel and the third cell is the host event number.
> >
> > Ok, how about updating above description like this:
> > Client users shall use the PRU System event number (the interrupt source
> > that the client is interested in) [cell 1], PRU channel [cell 2] and PRU
> > host_intr (target) [cell 3] as the value of the interrupts property in their
> > node.  The system events can be mapped to some output host interrupts through 2
> > levels of many-to-one mapping i.e. events to channel mapping and channels to
> > host interrupts so through this property entire mapping is provided.
>
> Cell 3 is host_intr0-7? How would we map to other host events?

Again this is due to misleading TRM nomenclature: host_intr vs host
interrupts (one that we discuss in patch #2). I will use "and PRU host
event (target) [cell 3]...". Sorry for my mistake.

Thank you,
Grzegorz
