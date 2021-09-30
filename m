Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 340F541D52F
	for <lists+linux-omap@lfdr.de>; Thu, 30 Sep 2021 10:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349011AbhI3IIi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Sep 2021 04:08:38 -0400
Received: from muru.com ([72.249.23.125]:39052 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349206AbhI3IH6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 30 Sep 2021 04:07:58 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C235B8050;
        Thu, 30 Sep 2021 08:06:44 +0000 (UTC)
Date:   Thu, 30 Sep 2021 11:06:13 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>,
        Paul Barker <paul.barker@sancloud.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: beaglebone black boot failure Linux v5.15.rc1
Message-ID: <YVVv9YjIaEksXPEr@atomide.com>
References: <YUQyQgFAOFnBlcdP@atomide.com>
 <0679a5bb-88d1-077d-6107-d5f88ef60dbf@fi.rohmeurope.com>
 <8f3963ca-ff09-b876-ae9e-433add242de2@ti.com>
 <331ab81e-cd42-7e9b-617a-fde4c773c07a@ti.com>
 <615b6fec-6c62-4a97-6d0c-d2e5a5d1ccb2@fi.rohmeurope.com>
 <dab93132-2e5a-78f2-4313-fc541ea36a10@ti.com>
 <36785ccf-57b4-eaf1-cfc0-b024857f7694@gmail.com>
 <YUmOGFUFONR/ynfW@atomide.com>
 <34b4c7a7-155c-5f06-c5c7-54489a59bce1@fi.rohmeurope.com>
 <YUrt3fGQVIwmvuOv@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUrt3fGQVIwmvuOv@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [210922 08:49]:
> * Vaittinen, Matti <Matti.Vaittinen@fi.rohmeurope.com> [210922 08:45]:
> > Hi Tony & All,
> > 
> > 
> > On 9/21/21 10:47, Tony Lindgren wrote:
> > > * Matti Vaittinen <mazziesaccount@gmail.com> [210920 08:23]:
> > > 
> > > It also allows leaving out the udelay for dra7 iva reset. Care to try
> > > this and see if it helps?
> > 
> > Thanks Tony. I applied your patch on top of v5.15-rc1 and my BBB booted 
> > up successfully. I didn't give it more than few attempts though. Do you 
> > think that could merged as a fix to mainline?
> > 
> > If so - feel free to add a
> > Tested-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> 
> OK great, good to hear! And thanks for testing :) Yeah I'll post a proper
> fix for mainline. But one thing to consider though..
> 
> I'm wondering if we should always wait for the rstctrl bit to go down
> before we even attempt to check the rststs bit if a rststs registe
> exists.

I've sent out a proper patch for this at [0] below, please review and
test.

Regards,

Tony

[0] [PATCH] soc: ti: omap-prm: Fix external abort for am335x pruss
    https://lore.kernel.org/linux-omap/20210930080100.56820-1-tony@atomide.com/T/#u
