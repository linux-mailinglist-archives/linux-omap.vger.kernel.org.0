Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0DE97BBFB8
	for <lists+linux-omap@lfdr.de>; Fri,  6 Oct 2023 21:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233125AbjJFTaZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Fri, 6 Oct 2023 15:30:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233013AbjJFTaY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 6 Oct 2023 15:30:24 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a02:c205:3004:2154::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B0AF95;
        Fri,  6 Oct 2023 12:30:22 -0700 (PDT)
Received: from p5dc58044.dip0.t-ipconnect.de ([93.197.128.68] helo=aktux)
        by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <andreas@kemnade.info>)
        id 1qoqWU-004b0J-U9; Fri, 06 Oct 2023 21:30:06 +0200
Date:   Fri, 6 Oct 2023 21:30:03 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Tony Lindgren <tony@atomide.com>
Cc:     =?UTF-8?B?UMOpdGVy?= Ujfalusi <peter.ujfalusi@gmail.com>,
        bcousson@baylibre.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, jarkko.nikula@bitmer.com,
        dmitry.torokhov@gmail.com, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/3] ASoC: ti: omap-mcbsp: Ignore errors for getting
 fck_src
Message-ID: <20231006213003.0fbac87a@aktux>
In-Reply-To: <20231006102348.GK34982@atomide.com>
References: <20230705190324.355282-1-andreas@kemnade.info>
        <20230705190324.355282-2-andreas@kemnade.info>
        <7d58d52d-2087-45af-b29e-2515b63ead13@gmail.com>
        <20230920063353.GQ5285@atomide.com>
        <dac768d2-2c66-4d6b-b3d3-d1ef69103c76@gmail.com>
        <20230921121626.GT5285@atomide.com>
        <20231006102348.GK34982@atomide.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 6 Oct 2023 13:23:48 +0300
Tony Lindgren <tony@atomide.com> wrote:

> * Tony Lindgren <tony@atomide.com> [230921 20:34]:
> > * Péter Ujfalusi <peter.ujfalusi@gmail.com> [230920 17:40]:  
> > > It is not the parent's fck, it is the PRCM clock which is selected as
> > > the sourcee of the clock generator (CLKS) for BCLK/FSYNC. That is the
> > > functional clock as well for the McBSP instance.  
> > 
> > Oh OK
> >   
> > > Out of reset it is using the PRCM source which is fine in all current users.
> > > I would do this fix or workaround in a different way: instead of
> > > ignoring the error, avoid it in the first place. Do nothing if the
> > > already selected clock is requested.
> > > That would remove the error and will fail in case the reparenting is not
> > > working -> boards will know this and might be able to do something about
> > > it in a reasonable way.  
> 
> Here's what I think the regression fix for omap4 clocks would be, the
> old main_clk is not the same as the module clock that we get by default.
> If this looks OK I'll do a similar fix also for omap5.
> 
> Or is something else also needed?
> 

hmm,
audio output works, the waring is away, but something new is here:
omap-mcbsp 40124000.mcbsp: Runtime PM usage count underflow!
# cat /sys/bus/platform/devices/40124000.mcbsp/power/runtime_status 
active

even with no sound.

Regards,
Andreas
