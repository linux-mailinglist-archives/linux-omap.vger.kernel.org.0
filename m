Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E38920DAEE
	for <lists+linux-omap@lfdr.de>; Mon, 29 Jun 2020 22:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388120AbgF2UB4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Jun 2020 16:01:56 -0400
Received: from muru.com ([72.249.23.125]:59972 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731818AbgF2TkL (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 29 Jun 2020 15:40:11 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id EA96381A8;
        Mon, 29 Jun 2020 17:13:52 +0000 (UTC)
Date:   Mon, 29 Jun 2020 10:12:57 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        "Mark A. Yoder" <mark.a.yoder@gmail.com>
Subject: Re: [PATCH V2] ARM: dts: am33xx-l4: add gpio-ranges
Message-ID: <20200629171257.GU37466@atomide.com>
References: <20200610110258.GA3024740@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200610110258.GA3024740@x1>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [200610 04:03]:
> Add gpio-ranges properties to the gpio controller nodes.
> 
> These gpio-ranges were created based on "Table 9-10. CONTROL_MODULE
> REGISTERS" in the  "AM335x Technical Reference Manual" [0] and "Table
> 4-2. Pin Attributes" in the "AM335x Sitara Processor datasheet" [1].
> A csv file with this data is available for reference [2].
> 
> These mappings are valid for all SoC's that are using am33xx-l4.dtsi.
> In addition, the only TI AM33xx parts that actually exist are [0]:
> AM3351, AM3352, AM3354, AM3356, AM3357, AM3358, AM3359
> 
> These gpio-ranges properties should be added as they describe the
> relationship between a gpio line and pin control register that exists
> in the hardware.  For example, GPMC_A0 pin has mode 7 which is labeled
> gpio1_16. conf_gpmc_a0 register is at offset 840h which makes it pin 16.
> 
> [0] https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf
> [1] http://www.ti.com/lit/ds/symlink/am3358.pdf
> [2] https://gist.github.com/pdp7/6ffaddc8867973c1c3e8612cfaf72020
> [3] http://www.ti.com/processors/sitara-arm/am335x-cortex-a8/overview.html
> 
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
> V2 changes:
> - clarify that these gpio-ranges are valid for all SoCs including that
>   am33xx-l4.dtsi
> - describe why these gpio-ranges should be added

Thanks applying into omap-for-v5.9/dt.

Regards,

Tony
