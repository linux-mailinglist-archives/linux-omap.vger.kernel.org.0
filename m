Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3CCC38FAE2
	for <lists+linux-omap@lfdr.de>; Tue, 25 May 2021 08:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231231AbhEYG3k (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 May 2021 02:29:40 -0400
Received: from muru.com ([72.249.23.125]:60060 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230509AbhEYG3c (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 25 May 2021 02:29:32 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id BF01D807E;
        Tue, 25 May 2021 06:28:06 +0000 (UTC)
Date:   Tue, 25 May 2021 09:27:58 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     Gowtham Tammana <g-tammana@ti.com>, bcousson@baylibre.com,
        robh+dt@kernel.org, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Nisanth Menon <nm@ti.com>
Subject: Re: [PATCH] ARM: dts: DRA7x: Fix duplicate USB4 device node
Message-ID: <YKyY7mYkNCHIrgSm@atomide.com>
References: <20210521211851.14674-1-g-tammana@ti.com>
 <9445e5c9-819c-0aed-f96f-b1ac2ea7d13e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9445e5c9-819c-0aed-f96f-b1ac2ea7d13e@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Suman Anna <s-anna@ti.com> [210524 15:24]:
> This can be fixed in couple of different ways, and I see there have been
> different commits that have ultimately caused this.
>  6b14eb4705d6 ("ARM: dts: DRA7: Move USB_OTG 4 to dra74x.dtsi")
>  549fce068a31 ("ARM: dts: dra7: Add l4 interconnect hierarchy and ti-sysc data"
>  bcbb63b80284 (ARM: dts: dra7: Separate AM57 dtsi files")
>  c7b72abca61e ("ARM: OMAP2+: Drop legacy platform data for dra7 dwc3")
> 
> Would you prefer that we just drop the USB4 target-module reference in
> dra7-l4.dtsi following the first commit?

Looking at commit 549fce068a31 above, we have dra7-l4.dtsi define a module
at 0x48940000. But maybe the module is only used for dwc on dra74x?

If this controller instance is on all dra7 SoCs, then it should be in
dra7-l4.dtsi. If the controller instance is only on dra74x, it should be
only in dra74x.dtsi file.

Sorry sounds like I have confused some hardware differences along the
way.

Regards,

Tony
