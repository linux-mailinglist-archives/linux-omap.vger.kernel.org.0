Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51EAB6B1C44
	for <lists+linux-omap@lfdr.de>; Thu,  9 Mar 2023 08:30:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbjCIHaE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 9 Mar 2023 02:30:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbjCIHaD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 9 Mar 2023 02:30:03 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B6645F763
        for <linux-omap@vger.kernel.org>; Wed,  8 Mar 2023 23:30:02 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0DABE80DE;
        Thu,  9 Mar 2023 07:30:02 +0000 (UTC)
Date:   Thu, 9 Mar 2023 09:30:00 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>, Bin Liu <b-liu@ti.com>,
        Johan Hovold <johan@kernel.org>
Subject: Re: am335x: performnce issues with FTDI and LOW_LATENCY
Message-ID: <20230309073000.GG7501@atomide.com>
References: <CAGm1_kuc0T5xqdQU0JVbetz+pMZb2=v=jhpgmfvZQhAiPdAG=A@mail.gmail.com>
 <20230306074200.GD7501@atomide.com>
 <CAGm1_ktJH21qk=eRH_xJgwkf_pGCgp1z7Jrp5M2orZ-eNRNg=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGm1_ktJH21qk=eRH_xJgwkf_pGCgp1z7Jrp5M2orZ-eNRNg=Q@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Yegor Yefremov <yegorslists@googlemail.com> [230307 09:53]:
> On Mon, Mar 6, 2023 at 8:42 AM Tony Lindgren <tony@atomide.com> wrote:
> >
> > * Yegor Yefremov <yegorslists@googlemail.com> [230228 08:01]:
> > > Any idea why the performance drop is so big?
> >
> > Maybe lots of interrupts and dma not being used for musb in this case?
> 
> Using "irqtop -d 1", I get the following results:
> 
> 3.18.1 LATENCY_OFF (16 ports): ca. 1000 IRQs/s INTC 17 47400000.dma-controller
> 3.18.1 LATENCY_ON (16 ports): ca. 4000 IRQs/s INTC 17 47400000.dma-controller
> 
> 6.2.1 LATENCY_OFF (16 ports): ca. 300 IRQs/s INTC 17 47400000.dma-controller
> 6.2.1 LATENCY_ON (16 ports): ca. 1000 IRQs/s INTC 17 47400000.dma-controller

Hmm I wonder what's causing that. Earlier the Ethernet gadget had some
alignment define tweak that made transfers faster. What kind of data
transfer are you testing with?

> #zcat /proc/config.gz | grep CPP
> CONFIG_USB_TI_CPPI41_DMA=y
> CONFIG_TI_CPPI41=y

From what I recall musb still handles short transfers with PIO, I think
this is the case also for cppi41 dma. Sounds like that does not explain
the difference you're seeing between 3.18 and 6.2 kernels though.

Regards,

Tony
