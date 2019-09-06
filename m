Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC44AC180
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2019 22:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbfIFUhj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Sep 2019 16:37:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:48658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726776AbfIFUhi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 6 Sep 2019 16:37:38 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 59A592070C;
        Fri,  6 Sep 2019 20:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567802257;
        bh=kDvMHv3TwiSKK0oZRUf58uBDdc0xHs3w2kiIWMY/3gw=;
        h=In-Reply-To:References:To:From:Cc:Subject:Date:From;
        b=WWqyHesMUAZswloxpKHAI0z6/Z+5h29ewfO+UTbCpz1j9iooovd38PU0MYAoGHCNv
         8RxWdekDWGOSQkTKcLDUL0KBne/fd0fLFrAF04KDkoU09n+F1xv2Lm+jg6v0ATlY8u
         3TP+FL9hoo8JeeY9wBBmFTyN+DAEYsrs/bDNz/t0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3c1c9285-1627-0b71-18aa-f3bc1f5286ca@ti.com>
References: <20190828065929.32150-1-t-kristo@ti.com> <20190828065929.32150-5-t-kristo@ti.com> <20190829200515.AFB0622CEA@mail.kernel.org> <ed1e3868-af4d-8141-2a04-202923715d06@ti.com> <20190906161543.EB392206CD@mail.kernel.org> <3c1c9285-1627-0b71-18aa-f3bc1f5286ca@ti.com>
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-omap@vger.kernel.org, tony@atomide.com, s-anna@ti.com
Subject: Re: [PATCHv2 4/6] clk: ti: clkctrl: add API to notify reset status
User-Agent: alot/0.8.1
Date:   Fri, 06 Sep 2019 13:37:36 -0700
Message-Id: <20190906203737.59A592070C@mail.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tero Kristo (2019-09-06 12:57:06)
> On 06/09/2019 19:15, Stephen Boyd wrote:
> > Quoting Tero Kristo (2019-08-29 23:06:41)
> >> On 29/08/2019 23:05, Stephen Boyd wrote:
> >>> Quoting Tero Kristo (2019-08-27 23:59:27)
> >>>> diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
> >>>> index e3e0a66a6ce2..47a0d1398c6f 100644
> >>>> --- a/drivers/clk/ti/clkctrl.c
> >>>> +++ b/drivers/clk/ti/clkctrl.c
> >>>> @@ -680,3 +689,38 @@ u32 ti_clk_is_in_standby(struct clk *clk)
> >>>>           return false;
> >>>>    }
> >>>>    EXPORT_SYMBOL_GPL(ti_clk_is_in_standby);
> >>>> +
> >>>> +/**
> >>>> + * ti_clk_notify_resets - Notify the clock driver associated reset =
status
> >>>
> >>> This is completely unused in this patch series. What's going on?
> >>
> >> This is needed by the OMAP reset driver. See:
> >>
> >> https://lwn.net/Articles/797597/
> >>
> >=20
> > Ok. I decided to punt this topic forward to next release at the least.
> > To clarify, TI is not special with regards to coordinating resets and
> > clk enable/disable state. Every other silicon vendor has the same
> > requirements and nobody is doing a good job at it.
> >=20
> > Please devise a way that avoids making a tight coupling between the clk
> > driver and the reset driver in this way. Are the two in the same
> > register space?
>=20
> No, they do not share register space. One is under a PRM node, one is=20
> under CM node, and there are multiple instances of each following each=20
> other:
>=20
> prm-1
> prm-2
> prm-3

So PRM is reset?

>=20
> ...
>=20
> cm-1
> cm-2
> cm-3

And CM is clk?

>=20
> And the gap between PRM + CM nodes is multiple megabytes in register=20
> space. To make things worse, there are some mutant CM nodes in the=20
> middle of the PRM nodes on certain SoCs.

Ok, sounds fair!

>=20
>   Perhaps we need to combine the two drivers then. Or can
> > this be implemented as a genpd that coordinates the resets and clk
> > controls for various devices?
>=20
> Generally, ti-sysc bus driver is the one doing the trick combining reset =

> + clock handling. However, this is linked at the pm-runtime on device=20
> level so it imposes certain sequencing due to way kernel PM is=20
> implemented. Basically we can't enable the clocks + deassert reset for=20
> remoteproc before the driver is able to load up the firmware for it.=20
> Maybe if I add a custom genpd or just custom PM runtime for the=20
> remoteprocs that would handle both clk + reset...
>=20
> Another potential change I can think of here is that I would add resets=20
> property under the clkctrl nodes, and link them via DT handles. The=20
> clock driver would get a handle to the reset controller, and query its=20
> state via generic API instead of adding this custom one. I would still=20
> need to add a separate custom API for telling the clocks that reset=20
> controller is in place though... And this would still be a hard link=20
> between reset + clocks.
>=20
> Do you think fully custom PM implementation would be better here which=20
> would just control reset + clock signals directly?
>=20

From what you're saying it sounds like a job for genpds. Maybe genpds
aren't up to the task yet, but we want devices that have resets and clks
going to them to manage the order of operations somehow without having
to "lie" and say that the resets go to the clk controller when they
don't (or vice versa).

