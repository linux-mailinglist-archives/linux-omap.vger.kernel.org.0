Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DABD13AFC4
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jan 2020 17:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728831AbgANQqS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Jan 2020 11:46:18 -0500
Received: from muru.com ([72.249.23.125]:50930 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728777AbgANQqR (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 14 Jan 2020 11:46:17 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 60F9F816C;
        Tue, 14 Jan 2020 16:46:58 +0000 (UTC)
Date:   Tue, 14 Jan 2020 08:46:13 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Matthijs van Duin <matthijsvanduin@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH] ARM: dts: Configure omap5 AESS
Message-ID: <20200114164613.GR5885@atomide.com>
References: <20200114150937.18304-1-tony@atomide.com>
 <52905C15-A2D1-4372-9781-D602D0B274B6@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52905C15-A2D1-4372-9781-D602D0B274B6@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [200114 16:38]:
> Hi Tony,
> 
> > Am 14.01.2020 um 16:09 schrieb Tony Lindgren <tony@atomide.com>:
> > 
> > We are missing AESS for omap5. Looks like it's similar to what we have
> > for omap4, and this gets ti-sysc interconnect target module driver to
> > detect it properly.
> > 
> > Note that we currently have no child device driver available for it.
> 
> What I have is a non-working and no more compiling driver originally written by
> Peter Ujfalusi and reworked by Andrej Utkin. We did have it almost running on
> v4.14 or so except problems with firmware versions and headers...
> 
> There we used classical hwmods and I could revert them now to try your new patches.
> Unfortunately, I could only compile-test your two patches but nothing with AESS.
> 
> We had tried to follow kernel API changes in the sound subsystem but today it is
> not even compiling any more :(
> 
> So getting a working device driver is an even bigger task than SGX was.

OK. Well hopefully that's at least a little bit easier now though.

> > Cc: H. Nikolaus Schaller <hns@goldelico.com>
> > Cc: Matthijs van Duin <matthijsvanduin@gmail.com>
> > Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> > Cc: Tero Kristo <t-kristo@ti.com>
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> > 
> > Note that this depends on "[PATCH] clk: ti: omap5: Add missing AESS clock".
> > 
> > arch/arm/boot/dts/omap5-l4-abe.dtsi | 16 ++++++++++++++--
> > 1 file changed, 14 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/omap5-l4-abe.dtsi b/arch/arm/boot/dts/omap5-l4-abe.dtsi
> > --- a/arch/arm/boot/dts/omap5-l4-abe.dtsi
> > +++ b/arch/arm/boot/dts/omap5-l4-abe.dtsi
> > @@ -426,8 +426,20 @@ target-module@c0000 {			/* 0x401c0000, ap 30 1e.0 */
> > 		};
> > 
> > 		target-module@f1000 {			/* 0x401f1000, ap 32 20.0 */
> 
> Here its may be good to have an "aess" label.

Care to clarify what you have in mind? The module is generic, aess
device will be the child node.

How about just a comment for aess?

Regards,

Tony

