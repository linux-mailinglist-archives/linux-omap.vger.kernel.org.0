Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C5375ADF05
	for <lists+linux-omap@lfdr.de>; Tue,  6 Sep 2022 07:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232803AbiIFFm7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Sep 2022 01:42:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232570AbiIFFm6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 6 Sep 2022 01:42:58 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 85B7C5AC5A
        for <linux-omap@vger.kernel.org>; Mon,  5 Sep 2022 22:42:57 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3AE0680B0;
        Tue,  6 Sep 2022 05:35:21 +0000 (UTC)
Date:   Tue, 6 Sep 2022 08:42:55 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Nishanth Menon <nm@ti.com>, Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: Unable to boot 6.0-rc3 on dra76
Message-ID: <Yxbd3xbv2elWZ6/I@atomide.com>
References: <abf4d275-b732-b1d5-35f0-40d78ef09962@ideasonboard.com>
 <Yw9MAKJyZlonv9b3@atomide.com>
 <7a0d68b0-0458-9c12-0e8a-cb0ed402700a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a0d68b0-0458-9c12-0e8a-cb0ed402700a@ideasonboard.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [220831 12:22]:
> On 31/08/2022 14:54, Tony Lindgren wrote:
> > * Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [220831 11:35]:
> > > Hi,
> > > 
> > > I've been unable to boot 6.0-rc3 on dra76 evm with omap2plus_defconfig. I get no output from the kernel.
> > > Enabling earlyprintk gives me the following. Any ideas?
> > 
> > This series of fixes for deferred probe in Linux next should help:
> > 
> > https://lore.kernel.org/linux-kernel/20220819221616.2107893-1-saravanak@google.com/
> > 
> > Hopefully it will get merged to the mainline kernel soonish.
> 
> Thanks Tony! This solves the issue.

Looks like the deferred probe fixes are now merged in v6.0-rc4 FYI.

Tony
