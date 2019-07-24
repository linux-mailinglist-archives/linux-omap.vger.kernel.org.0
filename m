Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 638A77287A
	for <lists+linux-omap@lfdr.de>; Wed, 24 Jul 2019 08:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbfGXGsE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Jul 2019 02:48:04 -0400
Received: from muru.com ([72.249.23.125]:55858 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725878AbfGXGsD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 24 Jul 2019 02:48:03 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6EFF9816A;
        Wed, 24 Jul 2019 06:48:27 +0000 (UTC)
Date:   Tue, 23 Jul 2019 23:47:58 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     linux-omap@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Tero Kristo <t-kristo@ti.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/8] ARM: dts: Drop bogus ahclkr clocks for dra7 mcasp 3
 to 8
Message-ID: <20190724064758.GU5447@atomide.com>
References: <20190723112811.44381-1-tony@atomide.com>
 <20190723112811.44381-6-tony@atomide.com>
 <2c750847-700e-c835-ee53-a656b363c36c@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c750847-700e-c835-ee53-a656b363c36c@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Suman Anna <s-anna@ti.com> [190723 21:02]:
> Hi Tony,
> 
> On 7/23/19 6:28 AM, Tony Lindgren wrote:
> > The ahclkr clkctrl clock bit 28 only exists for mcasp 1 and 2 on dra7.
> > Otherwise we get the following warning on beagle-x15:
...
> > @@ -2962,9 +2958,8 @@
> >  					<SYSC_IDLE_SMART>;
> >  			/* Domains (P, C): l4per_pwrdm, l4per2_clkdm */
> >  			clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP7_CLKCTRL 0>,
> > -				 <&l4per2_clkctrl DRA7_L4PER2_MCASP7_CLKCTRL 24>,
> > -				 <&l4per2_clkctrl DRA7_L4PER2_MCASP7_CLKCTRL 28>;
> > -			clock-names = "fck", "ahclkx", "ahclkr";
> > +				 <&l4per2_clkctrl DRA7_L4PER2_MCASP7_CLKCTRL 24>;
> > +			clock-names = "fck", "ahclkx";
> 
> The equivalent change to MCASP8 is missing.

Thanks for spotting it, probably should be set up the same way as
MCASP4 too looking at the TRM.

Tero, care to check the dra7 mcasp clocks we have defined?

$ grep MCASP drivers/clk/ti/clk-7xx.c
        { DRA7_IPU_MCASP1_CLKCTRL, dra7_mcasp1_bit_data, CLKF_SW_SUP, "ipu-clkctrl:0000:22" },
        { DRA7_L4PER2_MCASP2_CLKCTRL, dra7_mcasp2_bit_data, CLKF_SW_SUP, "l4per2-clkctrl:0154:22" },
        { DRA7_L4PER2_MCASP3_CLKCTRL, dra7_mcasp3_bit_data, CLKF_SW_SUP, "l4per2-clkctrl:015c:22" },
        { DRA7_L4PER2_MCASP5_CLKCTRL, dra7_mcasp5_bit_data, CLKF_SW_SUP, "l4per2-clkctrl:016c:22" },
        { DRA7_L4PER2_MCASP8_CLKCTRL, dra7_mcasp8_bit_data, CLKF_SW_SUP, "l4per2-clkctrl:0184:24" },
        { DRA7_L4PER2_MCASP4_CLKCTRL, dra7_mcasp4_bit_data, CLKF_SW_SUP, "l4per2-clkctrl:018c:22" },
        { DRA7_L4PER2_MCASP6_CLKCTRL, dra7_mcasp6_bit_data, CLKF_SW_SUP, "l4per2-clkctrl:01f8:22" },
        { DRA7_L4PER2_MCASP7_CLKCTRL, dra7_mcasp7_bit_data, CLKF_SW_SUP, "l4per2-clkctrl:01fc:22" },

Is bit 24 above correct for MCASP8 or should it too be 22 like
adjacent MCASP4 in the TRM?

Regards,

Tony
