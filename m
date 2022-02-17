Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 465F44BA074
	for <lists+linux-omap@lfdr.de>; Thu, 17 Feb 2022 13:58:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237431AbiBQM6q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Feb 2022 07:58:46 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240578AbiBQM6p (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 17 Feb 2022 07:58:45 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0582E28421A
        for <linux-omap@vger.kernel.org>; Thu, 17 Feb 2022 04:58:30 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id BD95D80E4;
        Thu, 17 Feb 2022 12:57:46 +0000 (UTC)
Date:   Thu, 17 Feb 2022 14:58:28 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Romain Naour <romain.naour@smile.fr>
Cc:     linux-omap@vger.kernel.org
Subject: Re: AM5749: tty serial 8250 omap driver crash
Message-ID: <Yg5GdIp5Glp9p/G5@atomide.com>
References: <e3cf5082-b494-9309-6878-da208920fa5a@smile.fr>
 <YgT/fhpFQfkj1b0j@atomide.com>
 <9f0cb8f9-ac94-eb50-266a-95df521a7360@smile.fr>
 <YgoIMPZd7bi6XDGW@atomide.com>
 <YgpUNMAiXgu+vrtl@atomide.com>
 <ca2faa1d-715b-77f8-4f19-037ba9aabc8e@smile.fr>
 <YgzkLjWwIlm9/SiK@atomide.com>
 <114d59cb-bbea-6298-c346-3f50f04ab2a5@smile.fr>
 <Yg4CZb1Jy2M8wwn/@atomide.com>
 <77a24941-4c46-8d78-391a-d3d1018f311a@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77a24941-4c46-8d78-391a-d3d1018f311a@smile.fr>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Romain Naour <romain.naour@smile.fr> [220217 09:09]:
> On u-boot devicetree the uart4 node is missing, but we don't plan to use the gps
> from uboot :)
> Should I add the uart4 node?

There should be no need for that, kernel should be able to initialize it
properly no matter what the state is from the bootloader.

> Since removing the uart quirk had some other side effect, I did a shameless hack
> in 8250_omap.c to disable autosuspend.
> 
> -	pm_runtime_put_autosuspend(port->dev);
> +	pm_runtime_dont_use_autosuspend(port->dev);
> 
> With that the uart is always up and running.

Yes but note that 8250_omap autosuspend does not do anything unless the
timeouts are manually enabled by the userspace. They are initialized to -1
during probe.

> > The test script I posted does that for all the uarts, probably best not
> > to do that until the other issues are sorted out :) If so, maybe the issue
> > on close is that the uart has already autoidled.
> 
> Indeed. But I'm not sure why the autosuspend is enabled by default?

See above, it's always been initialized to -1 by default so it won't
do anything. But if you ran the test script I posted, autosuspend timeout
got enabled for all the uarts. But maybe the issue you posted is yet
another issue that I don't quite understand yet.

To me it seems we should always have runtime PM functions enable the
serial port to usable state and get rid of the conditional enable for
probe and dma.

Regards,

Tony
