Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58BD76B548A
	for <lists+linux-omap@lfdr.de>; Fri, 10 Mar 2023 23:36:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231713AbjCJWgu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Mar 2023 17:36:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231714AbjCJWg3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 10 Mar 2023 17:36:29 -0500
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E10E0126F1F
        for <linux-omap@vger.kernel.org>; Fri, 10 Mar 2023 14:35:47 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32AMZfBu130335;
        Fri, 10 Mar 2023 16:35:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1678487741;
        bh=a1SL84IHvPhiFwxrVXtFEp+bRqEET5rt3qBb3efDzLU=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=QDztuxgioBNta/BKFGNRz5tgak3G+Y/rRH2C/5xqjKbdMPaYu6M7nZ7VXZnlV5+d0
         m8laHOpp+n00pZ5OAv5Bo2eTcs0yGBfCcRcmcMxRgyuxSDEXZYs8ZZp4VXm4Ert0mx
         pctGxVhYf4/1G94AeuFG9teusDHDsoEhrtTLbgaM=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32AMZfto104846
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 10 Mar 2023 16:35:41 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 10
 Mar 2023 16:35:41 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 10 Mar 2023 16:35:41 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32AMZfCS080851;
        Fri, 10 Mar 2023 16:35:41 -0600
Date:   Fri, 10 Mar 2023 16:35:41 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Yegor Yefremov <yegorslists@googlemail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>
Subject: Re: am335x: performnce issues with FTDI and LOW_LATENCY
Message-ID: <20230310223541.xa372p4gbfqg4dh2@iaqt7>
Mail-Followup-To: Bin Liu <b-liu@ti.com>, Tony Lindgren <tony@atomide.com>,
        Yegor Yefremov <yegorslists@googlemail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>
References: <CAGm1_kuc0T5xqdQU0JVbetz+pMZb2=v=jhpgmfvZQhAiPdAG=A@mail.gmail.com>
 <20230306074200.GD7501@atomide.com>
 <CAGm1_ktJH21qk=eRH_xJgwkf_pGCgp1z7Jrp5M2orZ-eNRNg=Q@mail.gmail.com>
 <20230309073000.GG7501@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230309073000.GG7501@atomide.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Mar 09, 2023 at 09:30:00AM +0200, Tony Lindgren wrote:
> * Yegor Yefremov <yegorslists@googlemail.com> [230307 09:53]:
> > On Mon, Mar 6, 2023 at 8:42 AM Tony Lindgren <tony@atomide.com> wrote:
> > >
> > > * Yegor Yefremov <yegorslists@googlemail.com> [230228 08:01]:
> > > > Any idea why the performance drop is so big?
> > >
> > > Maybe lots of interrupts and dma not being used for musb in this case?
> > 
> > Using "irqtop -d 1", I get the following results:
> > 
> > 3.18.1 LATENCY_OFF (16 ports): ca. 1000 IRQs/s INTC 17 47400000.dma-controller
> > 3.18.1 LATENCY_ON (16 ports): ca. 4000 IRQs/s INTC 17 47400000.dma-controller
> > 
> > 6.2.1 LATENCY_OFF (16 ports): ca. 300 IRQs/s INTC 17 47400000.dma-controller
> > 6.2.1 LATENCY_ON (16 ports): ca. 1000 IRQs/s INTC 17 47400000.dma-controller
> 
> Hmm I wonder what's causing that. Earlier the Ethernet gadget had some
> alignment define tweak that made transfers faster. What kind of data
> transfer are you testing with?
> 
> > #zcat /proc/config.gz | grep CPP
> > CONFIG_USB_TI_CPPI41_DMA=y
> > CONFIG_TI_CPPI41=y
> 
> From what I recall musb still handles short transfers with PIO, I think
> this is the case also for cppi41 dma. Sounds like that does not explain
> the difference you're seeing between 3.18 and 6.2 kernels though.

I quickly scanned the changes on musb_cppi41.c and dma/cppi41.c between
v3.18 and v5.4, but nothing stands out. I am wondering if this is
something caused by outside of usb subsystem...

-Bin.
