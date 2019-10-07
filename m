Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 653A9CE958
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 18:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727830AbfJGQfp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 12:35:45 -0400
Received: from muru.com ([72.249.23.125]:35684 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727801AbfJGQfp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 7 Oct 2019 12:35:45 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C424A8127;
        Mon,  7 Oct 2019 16:36:17 +0000 (UTC)
Date:   Mon, 7 Oct 2019 09:35:41 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Michael Allwright <allsey87@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@osg.samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Subject: Re: iss: camera interface omap5
Message-ID: <20191007163541.GT5610@atomide.com>
References: <0D08B352-F0DF-45A4-8279-51B07D366AD0@goldelico.com>
 <20191004161117.GO5610@atomide.com>
 <EDF29A32-77BB-4346-BBCC-C12F2BB4745E@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <EDF29A32-77BB-4346-BBCC-C12F2BB4745E@goldelico.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [191004 16:27]:
> Hi Tony,
> 
> > Am 04.10.2019 um 18:11 schrieb Tony Lindgren <tony@atomide.com>:
> > 
> > * H. Nikolaus Schaller <hns@goldelico.com> [191004 07:25]:
> >> Hi Tony,
> >> is there a similar node for omap5 comparable to this for omap4:
> >> 
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/omap4.dtsi?h=v5.4-rc1#n176
> 
> (I just noticed there seems to be a missing empty line between 216 and 217)
> 
> > 
> > Not sure if it's the same interface as on omap4, but at
> > least TRM has "8.1.3.1 ISS Instance Summary" at 0x52000000.
> 
> Ok.
> 
> IMHO there was a patch where someone got it working a while ago so it is likely the same:
> 
> 	https://e2e.ti.com/support/interface/f/138/t/647460
> 
> Now I wonder how it can be updated to current target-module style.
> 
> Is it correct to do it similar to omap4 and replace
> 
> 	/* No child device binding, driver in staging */
> 
> by a child node that is compatible to "ti,omap4-iss".
> And there define a reg record like in the example on e2e?
> I.e. split into sysc registers for the target-module@52000000
> and driver specific registers in the child node?

Yeah something like that. Michael Alwright has a patch at [0]
with improvments for the iss staging driver to get it working.
Have you seen that one?

> Regarding clocks they likely have to stay with the target-module@52000000
> node, right?

I think it should be just something like this for
the target-module (on top of Michael's changes):

clocks = <&iss_clkctrl OMAP4_ISS_CLKCTRL 0>;
clock-names = "fck";

Then in the child node:

clocks = <&iss_clkctrl OMAP4_ISS_CLKCTRL 8>;
clock-names = "ctrlclk";

> And what about the dma nodes? Also keep in the target-module@52000000?

Those should be all in the child iss driver(s).

In general, it sounds like the iss is a private interconnect with
a control module for clocks etc, so doing it as multiple device
drivers probably makes sense.

Regards,

Tony

[0] https://github.com/allsey87/meta-builderbot/blob/master/recipes-kernel/linux/linux-stable-4.16/0008-omap4iss-Fix-multiple-bugs-and-use-device-tree.patch
