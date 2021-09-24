Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A12FB416C7E
	for <lists+linux-omap@lfdr.de>; Fri, 24 Sep 2021 09:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244309AbhIXHF5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Sep 2021 03:05:57 -0400
Received: from muru.com ([72.249.23.125]:36762 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244299AbhIXHFu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Sep 2021 03:05:50 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id AE3A080EE;
        Fri, 24 Sep 2021 07:04:45 +0000 (UTC)
Date:   Fri, 24 Sep 2021 10:04:15 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>
Subject: Re: [PATCH 4/5] mmc: sdhci-omap: Parse legacy ti,non-removable
 property
Message-ID: <YU14b0SJ336bh8tr@atomide.com>
References: <20210921110029.21944-1-tony@atomide.com>
 <20210921110029.21944-5-tony@atomide.com>
 <CAPDyKFoxheP2BjGBwf+MMt6hzURi2ymFrB8X9zzO9aQWzatJog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFoxheP2BjGBwf+MMt6hzURi2ymFrB8X9zzO9aQWzatJog@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Ulf Hansson <ulf.hansson@linaro.org> [210923 18:43]:
> On Tue, 21 Sept 2021 at 13:00, Tony Lindgren <tony@atomide.com> wrote:
> > --- a/drivers/mmc/host/sdhci-omap.c
> > +++ b/drivers/mmc/host/sdhci-omap.c
> > @@ -1213,6 +1213,11 @@ static int sdhci_omap_probe(struct platform_device *pdev)
> >         if (of_find_property(dev->of_node, "dmas", NULL))
> >                 sdhci_switch_external_dma(host, true);
> >
> > +       if (device_property_read_bool(dev, "ti,non-removable")) {
> > +               dev_warn_once(dev, "using old ti,non-removable property\n");
> 
> Perhaps we should document this property for sdhci-omap and thus also
> set it as deprecated. What do you think?

Yes good idea, I'll send a patch for that.

Regards,

Tony
