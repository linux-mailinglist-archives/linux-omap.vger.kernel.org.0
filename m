Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 840C63047BB
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jan 2021 20:12:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732886AbhAZF53 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Jan 2021 00:57:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:42012 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729771AbhAZCsF (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 25 Jan 2021 21:48:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 865C322EBF;
        Tue, 26 Jan 2021 02:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611629244;
        bh=LwqYiU3oRlYo9FShj+CR8F39sEMecoUEsL8JexS7mlk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Ytpa+AJgfdSkPhWvfrCLezbbz355uloVnAK/2fKFQowbfA7lckWbiPn6NoxlBkrnu
         5lfD+IlN9yrOP5buiZRptqOt56rvqd0mOQyYpSXM4E8NT/ggkTGpHV/0HLoY5D+EiY
         YMjJhjvEBNl1LKp5ZjV97nYWBX08ak0aS0XtjjaepdSTfopPsNCBTYQcf1qIDrn+29
         n/wtiPxcTkTFBUmUA7G/gke7Z0eytD8X8ZFXJUM5vLerJnOTKJhj2m6ZWdz7NftPJO
         jfsrRHCYxJ67dpXzOFr5MBwDARwWlRonY5N0c+V6+6YiCYvJPchobIAFYxH80IznUW
         dqr3/w0ervbYQ==
Received: by mail-ej1-f45.google.com with SMTP id ox12so21016791ejb.2;
        Mon, 25 Jan 2021 18:47:24 -0800 (PST)
X-Gm-Message-State: AOAM531LUtRKVvxE8UkeGh+nwI1tehCA1EAYu7KK62B8gromemeBM635
        ktJcCAAwjIbhF7B65Sy/05pKcql9JBih+AXtPg==
X-Google-Smtp-Source: ABdhPJzhkSY6hKt7+GAS1hDt9h/064YyPtrM+ZOJ1MWC9e2hwRKo3F2kv3CME3814mJk+ka7plMlgXPIv5fl/5/2FYo=
X-Received: by 2002:a17:906:a94:: with SMTP id y20mr2013640ejf.525.1611629243021;
 Mon, 25 Jan 2021 18:47:23 -0800 (PST)
MIME-Version: 1.0
References: <20210115205819.19426-1-s-anna@ti.com> <20210126000443.GA1223706@robh.at.kernel.org>
 <8f4a47f8-18dc-cb73-10db-033e5e5adb25@ti.com>
In-Reply-To: <8f4a47f8-18dc-cb73-10db-033e5e5adb25@ti.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 25 Jan 2021 20:47:11 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLYfGvJ=zYbdJp4pUjmmJ_ROu1u_0dVwTj06Cw5+23fGw@mail.gmail.com>
Message-ID: <CAL_JsqLYfGvJ=zYbdJp4pUjmmJ_ROu1u_0dVwTj06Cw5+23fGw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: irqchip: Add #address-cells to PRUSS INTC
To:     Suman Anna <s-anna@ti.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nishanth Menon <nm@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Lechner <david@lechnology.com>,
        devicetree@vger.kernel.org,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jan 25, 2021 at 6:16 PM Suman Anna <s-anna@ti.com> wrote:
>
> Hi Rob,
>
> On 1/25/21 6:04 PM, Rob Herring wrote:
> > On Fri, Jan 15, 2021 at 02:58:19PM -0600, Suman Anna wrote:
> >> The '#address-cells' property looks to be a required property for
> >> interrupt controller nodes as indicated by a warning message seen
> >> when building dtbs with W=2. Adding the property to the PRUSS INTC
> >> dts nodes though fails the dtbs_check. Add this property to the
> >> PRUSS INTC binding to make it compliant with both dtbs_check and
> >> building dtbs.
> >>
> >> Signed-off-by: Suman Anna <s-anna@ti.com>
> >> ---
> >> Hi Rob,
> >>
> >> This patch is also part of our effort to get rid of the warnings seen
> >> around interrupt providers on TI K3 dtbs [1]. I needed this in the PRUSS
> >> INTC bindings to not get a warning with dtbs_check while also ensuring
> >> no warnings while building dtbs with W=2.
> >>
> >> I would have expected the '#address-cells' requirement to be inherited
> >> automatically. And looking through the schema files, I actually do not
> >> see the interrupt-controller.yaml included automatically anywhere. You
> >> had asked us to drop the inclusion in this binding in our first version
> >> with YAML [3]. Am I missing something, and how do we ensure that this
> >> is enforced automatically for everyone?
> >
> > interrupt-controller.yaml is applied to any node named
> > 'interrupt-controller'. More generally, if 'compatible' is not present,
> > then we look at $nodename for the default 'select'. In your case, you
> > didn't name the node appropriately.
>
> Thanks for the clarification. Yeah, I didn't add anything specifically, since
> the expectation is interrupt-controller. Should I be adding that to this binding?

No, either interrupt-controller.yaml needs to learn a new node name or
your node names need to be fixed. I prefer the latter, but if you have
more than 1 and don't have a unit-address (and in turn a 'reg' prop)
we'd have to do the former. How are the interrupts controllers
accessed if there's no way to address them?

>
> >
> > We can't check this in interrupt-controller.yaml because #address-cells
> > is not always 0. GICv3 is one notable exception.
> >
> >>
> >> regards
> >> Suman
> >>
> >> [1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20210115083003.27387-1-lokeshvutla@ti.com/
> >
> > I've commented on this thread now in regards to #address-cells.
>
> I suppose I still need this patch to be defined to unblock the ICSSG nodes
> getting accepted by our dts maintainer. Care to give your Reviewed-by for the
> change? Or I can spin a v2 with $nodename added as well if that's needed too.

No, I don't think you have to add #address-cells. We need to fix the
warning in dtc.

Rob
