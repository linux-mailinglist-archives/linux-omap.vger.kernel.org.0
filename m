Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0271423758
	for <lists+linux-omap@lfdr.de>; Wed,  6 Oct 2021 07:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbhJFFFT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Oct 2021 01:05:19 -0400
Received: from muru.com ([72.249.23.125]:41174 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231355AbhJFFFS (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 6 Oct 2021 01:05:18 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8EC3580E1;
        Wed,  6 Oct 2021 05:03:56 +0000 (UTC)
Date:   Wed, 6 Oct 2021 08:03:24 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: sdhci-omap: Update binding for legacy
 SoCs
Message-ID: <YV0uHN9N73YbWUsK@atomide.com>
References: <20210930065733.31943-1-tony@atomide.com>
 <20210930065733.31943-2-tony@atomide.com>
 <CAHCN7xJ_28ALRds4rduQP3LZoEK9y6mdia_czKU0DWse7FnjoA@mail.gmail.com>
 <YVwHEqaAtk0MFwmR@atomide.com>
 <CAHCN7xLBi09oHa75SxOc=CJ3hHZCNTxn6Z7m0NwuMcLY8+UL6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xLBi09oHa75SxOc=CJ3hHZCNTxn6Z7m0NwuMcLY8+UL6g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [211005 10:46]:
> On Tue, Oct 5, 2021 at 3:04 AM Tony Lindgren <tony@atomide.com> wrote:
> >
> > Hi,
> >
> > * Adam Ford <aford173@gmail.com> [211002 13:29]:
> > > I noticed that you added omap3 compatibility to the driver and the
> > > bindings, but no device tree changes for omap3.dtsi to enable this.
> > > Is there anything holding back?
> >
> > There is at least the wl1251 quirk handling missing as I mentioned in
> > the cover letter. I guess we could enable sdhci except for wl1251 users
> > though.
> 
> Sorry, I guess I missed the cover letter.  I didn't see any obvious
> differences between the drivers other than the hsmmc driver enumerated
> before the DMA, so it threw some splat indicating that.  The newer
> driver appears to enumerate after the DMA, so that message
> disappeared.

OK

> > > I modified omap3.dtsi and changed the compatible flag to
> > > ti,omap3-sdhci and it boots from SD card just fine.  For some reason,
> > > I cannot get the wl1283 to function, but the driver probes, so I need
> > > to spend some time investigating this.
> > >
> > > If i can get my wl1283 working again, I'll reply with a tested note.
> > > I hope to have more time tomorrow, but i can't do it any more today.
> >
> > I don't have wl1283 omap3 devices online, but I have tested that the
> > sdhci patches do work with wl12xx and mwifiex drivers. Did you figure
> > out why your wl1283 is not working with sdhci?
> 
> I did get it working.  It was a MAC address issue.  I didn't properly
> set the MAC address.  Once I did, it worked just fine.
> 
> I think I sent a 2nd reply with a tested-by message.

OK good to hear, thanks for testing :)

Regards,

Tony
