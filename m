Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A66AD666F80
	for <lists+linux-omap@lfdr.de>; Thu, 12 Jan 2023 11:26:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237483AbjALK0V (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Jan 2023 05:26:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237183AbjALKZk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Jan 2023 05:25:40 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4243237391
        for <linux-omap@vger.kernel.org>; Thu, 12 Jan 2023 02:20:15 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9081480A6;
        Thu, 12 Jan 2023 10:20:14 +0000 (UTC)
Date:   Thu, 12 Jan 2023 12:20:13 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: AM3517 Failed to request pm_wkup irq
Message-ID: <Y7/e3WzHuSf5Km1X@atomide.com>
References: <CAHCN7xKqRi+MXh97gzHM1RPo9ojBDGJABN0B0jZ6zPQYe1M=TA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xKqRi+MXh97gzHM1RPo9ojBDGJABN0B0jZ6zPQYe1M=TA@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Adam Ford <aford173@gmail.com> [230105 18:32]:
> When booting the AM3517-EVM, I get a few errors related to the pm.
> 
> [    2.038452] pm: Failed to request pm_wkup irq
> [    2.042846] omap2_common_pm_late_init: pm soc init failed: -22
> 
> omap3_pm_init inside pm34xx.c calls omap_prcm_event_to_irq looking for
> "wkup" which returns EINVAL .
> 
> Inside omap_prm.c, there are a bunch of data structures for
> omap_prm_data which contain for various boards for AM3, AM4, omap4,
> omap5 and dra7, but a reference to ti,omap3-prm-inst appears to be
> missing.  I looked at the TRM for the AM335X, and i can clearly see a
> nice table with addresses that correspond to the tables found in
> omap_prm.c, but after looking at both a DM3730 and AM3517 TRM, I am
> not seeing a corresponding L4_WKUP Peripheral Memory map.
> 
> If someone can point me in the right direction, I can try to setup the
> OMAP3 tables accordingly.

The older SoCs set up the prm wakeup via omap3_prcm_irq_setup. Ideally
this would be nowadays done using dts and driver/irqchip though.

Maybe see omap3xxx_check_features() and try adding flags for
OMAP3_HAS_IO_WAKEUP for am3517? Likely this is the same as for 34xx.
It may also have OMAP3_HAS_IO_CHAIN_CTRL like 36xx, but likely not.

Regards,

Tony
