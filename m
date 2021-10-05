Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC2C1422018
	for <lists+linux-omap@lfdr.de>; Tue,  5 Oct 2021 10:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232920AbhJEIG3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Oct 2021 04:06:29 -0400
Received: from muru.com ([72.249.23.125]:40900 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232793AbhJEIG2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 5 Oct 2021 04:06:28 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3911180E1;
        Tue,  5 Oct 2021 08:05:06 +0000 (UTC)
Date:   Tue, 5 Oct 2021 11:04:34 +0300
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
Message-ID: <YVwHEqaAtk0MFwmR@atomide.com>
References: <20210930065733.31943-1-tony@atomide.com>
 <20210930065733.31943-2-tony@atomide.com>
 <CAHCN7xJ_28ALRds4rduQP3LZoEK9y6mdia_czKU0DWse7FnjoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xJ_28ALRds4rduQP3LZoEK9y6mdia_czKU0DWse7FnjoA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Adam Ford <aford173@gmail.com> [211002 13:29]:
> I noticed that you added omap3 compatibility to the driver and the
> bindings, but no device tree changes for omap3.dtsi to enable this.
> Is there anything holding back?

There is at least the wl1251 quirk handling missing as I mentioned in
the cover letter. I guess we could enable sdhci except for wl1251 users
though.

> I modified omap3.dtsi and changed the compatible flag to
> ti,omap3-sdhci and it boots from SD card just fine.  For some reason,
> I cannot get the wl1283 to function, but the driver probes, so I need
> to spend some time investigating this.
> 
> If i can get my wl1283 working again, I'll reply with a tested note.
> I hope to have more time tomorrow, but i can't do it any more today.

I don't have wl1283 omap3 devices online, but I have tested that the
sdhci patches do work with wl12xx and mwifiex drivers. Did you figure
out why your wl1283 is not working with sdhci?

Regards,

Tony
