Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAA05472DD7
	for <lists+linux-omap@lfdr.de>; Mon, 13 Dec 2021 14:50:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237997AbhLMNu1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 Dec 2021 08:50:27 -0500
Received: from muru.com ([72.249.23.125]:38068 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229779AbhLMNu0 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 13 Dec 2021 08:50:26 -0500
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 19EE780C7;
        Mon, 13 Dec 2021 13:51:07 +0000 (UTC)
Date:   Mon, 13 Dec 2021 15:50:23 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        "Merlijn B.W. Wajer" <merlijn@archive.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Pavel Machek <pavel@ucw.cz>,
        linux-omap <linux-omap@vger.kernel.org>,
        Dev Null <devnull@uvos.xyz>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: Oops while booting 5.15.2 on Nokia N900
Message-ID: <YbdPn21Xf8HD6ILM@atomide.com>
References: <20211208205700.GA12125@duo.ucw.cz>
 <20211208220400.1f9cff00@aktux>
 <ee94556b-2c35-c641-a86a-e9e70600aab7@archive.org>
 <20211210111345.GD799423@darkstar.musicnaut.iki.fi>
 <7438fa4a-ea92-a3ce-4cc7-8da8a4af02b5@wizzup.org>
 <YbRL75F/SlcPJjtf@atomide.com>
 <370c8e25-d582-decb-5dd9-625d6548dcd3@wizzup.org>
 <Ybbegfbnl8+5Xqc5@atomide.com>
 <9dc4e8d4-ca35-c931-d4c7-7bae43184ef1@wizzup.org>
 <7b61f212-b665-f8fb-72c7-4c354e773f5a@wizzup.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b61f212-b665-f8fb-72c7-4c354e773f5a@wizzup.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Merlijn Wajer <merlijn@wizzup.org> [211213 10:45]:
> Hi Tony,
> 
> On 13/12/2021 11:36, Merlijn Wajer wrote:
> 
> >>
> >> OK so it's not omap_hsmmc vs sdhci-omap issue. So does setting the thermal
> >> driver to status = "disabled" make the issue disappear?
> > 
> > In my kernel I have CONFIG_OMAP3_THERMAL disabled currently (per my
> > other email), but my understanding is that you're suggesting that
> > disabling the node all together in the dts can help. Would this be the
> > bandgap node, thermal_sensors or cpu_thermal node(s)?
> 
> I made this change (I just disabled all three of them, not knowing which
> one was the right one, will try to narrow that down further if useful):
> 
> > diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
> > index 1746a44e96bc..e97b7efbd790 100644
> > --- a/arch/arm/boot/dts/omap3-n900.dts
> > +++ b/arch/arm/boot/dts/omap3-n900.dts
> > @@ -28,6 +28,19 @@ &aes2_target {
> >         status = "disabled";
> >  };
> > 
> > +&cpu_thermal {
> > +       status = "disabled";
> > +};
> > +
> > +&bandgap {
> > +       status = "disabled";
> > +};
> > +
> > +&thermal_zones {
> > +       status = "disabled";
> > +};
> > +
> 
> and I am no longer seeing the oopses or resets when running "sleep 30;
> blkid" from minimal userspace.

If disabling the cpu_thermal makes things behave, chances are we have wrong
thermal values in the dts for n900 and possible all 34xx devices. The 36xx
values are behaving AFAIK.

Regards,

Tony
