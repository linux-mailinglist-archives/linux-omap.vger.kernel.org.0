Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAFA779247F
	for <lists+linux-omap@lfdr.de>; Tue,  5 Sep 2023 17:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231537AbjIEP7F (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Sep 2023 11:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353379AbjIEGMO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Sep 2023 02:12:14 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5C08BE6
        for <linux-omap@vger.kernel.org>; Mon,  4 Sep 2023 23:12:10 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 716E180A3;
        Tue,  5 Sep 2023 06:12:09 +0000 (UTC)
Date:   Tue, 5 Sep 2023 09:12:08 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        Patrik =?utf-8?Q?Dahlstr=C3=B6m?= <risca@dalakolonin.se>,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        linux-omap@vger.kernel.org,
        =?utf-8?B?UMOpdGVy?= Ujfalusi <peter.ujfalusi@gmail.com>
Subject: Re: ABE/AESS on modern kernel: clocks, hwmods etc.
Message-ID: <20230905061208.GW11676@atomide.com>
References: <45F44D32-E846-4A53-BA20-9C78CD4411F3@goldelico.com>
 <ZO4SWw/rbJH5Dpbq@dalakolonin.se>
 <A029FB33-9FBB-4CE5-92D5-597E10B3A032@goldelico.com>
 <ZPH5Yr3w7ruN/io0@dalakolonin.se>
 <05B47ED4-CA2C-4754-ABB1-0591E9018E57@goldelico.com>
 <ZPLYG16mwiwt9G9R@dalakolonin.se>
 <CB775A6F-FDB6-4639-B386-8E8BEE4CD88C@goldelico.com>
 <20230902122635.2482b0cf@aktux>
 <20230904063432.GV11676@atomide.com>
 <03375B42-C86E-4B37-98C2-C1FBA7AB68B6@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03375B42-C86E-4B37-98C2-C1FBA7AB68B6@goldelico.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [230904 18:07]:
> > Am 04.09.2023 um 08:34 schrieb Tony Lindgren <tony@atomide.com>:
> > No idea about this one, but this might be doable with generic pwm code
> > now with the dmtimers. See for example how the ir-rx51 is getting phased
> > away and replaced with the generci pwm ir driver.
> 
> This is not PWM. It writes to some register shared with the AESS DSP and we assume that the
> DSP firmware should be started. I have put Péter on CC, maybe he knows something.

Hmm sorry I somehow thought it was using a dmtimer. There are references to
ABE_GPT5_FCLK to ABE_GPT8_FCLK in the TRM but maybe those are separate
and the driver is not tinkering with the timer register directly hopefully.

> >>> It seems as if clocks and code like omap_hwmod_aess_preprogram() is missing. Especially for the
> >>> omap4 we have found no equivalent to aess_fclk which exists for omap5 and dra7.
> >>> Nowhere is a reference using the abe_iclk node.
> >>> 
> >> for omap4 I guess the 
> >>                        clocks = <&abe_clkctrl OMAP4_AESS_CLKCTRL 0>;
> >> 
> >> in omap4-l4-abe.dtsi should be enough and correcly referencing fclk?
> > 
> > Yeah the clocks chould be there and should use addressing like Andreas is
> > showing.
> 
> Well, according to my analysis the fclk may be there but the iclk is missing or not initialized.
> That could explain why we get L3 problems as soon as we try to start the AESS-DSP.

OK

> The key observation is that the abe_iclk references in the DTS seem to be nowhere referenced
> (which may or may not be an issue):
>
> https://github.com/goldelico/letux-kernel/blob/letux/aess-v12/arch/arm/boot/dts/ti/omap/omap44xx-clocks.dtsi#L509
> https://github.com/goldelico/letux-kernel/blob/letux/aess-v12/arch/arm/boot/dts/ti/omap/omap54xx-clocks.dtsi#L161

So I guess the ick is in the dts the ocp_abe_iclk@528 for omap4 and
abe_iclk@528 for omap5. Seems like the driver should request them, I recall
that the interconnect target module does not need the ick to access sysc
and revision registers.

> The branch where all changes are sitting can be inspected here:
> 
> https://github.com/goldelico/letux-kernel/commits/letux/aess-v12?after=567e9011a67f4ed0824c2989a5d5f73ca0139461+63&branch=letux%2Faess-v12&qualified_name=refs%2Fheads%2Fletux%2Faess-v12
> 
> They are all tagged ARM: DTS: omap4 or omap5.

Hmm the "we don't need separate target modules" patch is wrong, the modules
may have separate clocks and power domains, and flushing a posted write to
one module does not flush write to the other module. This can lead into hard
to track down bugs accessing separate modules. The dts module data I
generated from the hardware AP registers for each SoC so the module ranges
should be correct.

> Hope this helps. Otherwise we have to prepare a cleaned up version of the DTS changes as a patch series.

Yeah nice,

Tony
