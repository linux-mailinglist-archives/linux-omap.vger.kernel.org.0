Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0365E59E4D0
	for <lists+linux-omap@lfdr.de>; Tue, 23 Aug 2022 16:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240980AbiHWOEQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Aug 2022 10:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242407AbiHWODJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 23 Aug 2022 10:03:09 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 29861246D0B;
        Tue, 23 Aug 2022 04:12:31 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A54398125;
        Tue, 23 Aug 2022 10:06:25 +0000 (UTC)
Date:   Tue, 23 Aug 2022 13:13:31 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Romain Naour <romain.naour@smile.fr>
Cc:     linux-omap@vger.kernel.org,
        U-Boot Mailing List <u-boot@lists.denx.de>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>, s-anna@ti.com
Subject: Re: [PATCH] ARM: dts: Use clock-output-names for dra7
Message-ID: <YwSoSzWBZEGy5UlQ@atomide.com>
References: <20220204080842.40673-1-tony@atomide.com>
 <2404bcc0-d01c-1ff1-6ea1-bfdef38cb64e@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2404bcc0-d01c-1ff1-6ea1-bfdef38cb64e@smile.fr>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Romain Naour <romain.naour@smile.fr> [220823 08:25]:
> Hello,
> 
> Le 04/02/2022 à 09:08, Tony Lindgren a écrit :
> > With the TI clocks supporting the use of clock-output-names devicetree
> > property, we no longer need to use non-standard node names for clocks.
> > 
> > Depends-on: 31aa7056bbec ("ARM: dts: Don't use legacy clock defines for dra7 clkctrl")
> > Depends-on: 9206a3af4fc0 ("clk: ti: Move dra7 clock devices out of the legacy section")
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Tero Kristo <kristo@kernel.org>
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> 
> With this patch applied, u-boot triggers a new warning while applying clock fixup:
> 
> ft_fixup_clocks failed for DSP voltage domain: <valid offset/length>

Hmm sounds like u-boot might be automatically syncing to Linux dts files,
and now needs some patching to make use of clock-output-names. The old
non-standard method of relying for node names to get the clock name will
not work as we use generic node names such as "clock".

Regards,

Tony
