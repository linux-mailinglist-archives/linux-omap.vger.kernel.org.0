Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 142376732A5
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jan 2023 08:41:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbjASHll (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Jan 2023 02:41:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbjASHlk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Jan 2023 02:41:40 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E606359C1
        for <linux-omap@vger.kernel.org>; Wed, 18 Jan 2023 23:41:38 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E183080F1;
        Thu, 19 Jan 2023 07:41:37 +0000 (UTC)
Date:   Thu, 19 Jan 2023 09:41:36 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     linux-omap@vger.kernel.org, peter.ujfalusi@gmail.com,
        jarkko.nikula@bitmer.com
Subject: Re: omap  mcbsp and prcm_fck
Message-ID: <Y8j0MMLoanjo1MCf@atomide.com>
References: <20230117120810.6cf8b6f7@aktux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117120810.6cf8b6f7@aktux>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Andreas Kemnade <andreas@kemnade.info> [230117 11:08]:
> Hi,
> 
> while trying to create a devicetree for a omap4 device, I stumbled upon this:
> 
> [   59.789367] omap-mcbsp 40124000.mcbsp: CLKS: could not clk_get() prcm_fck
> 
> But where should prcm_fck come from? The string does not appear in the
> devicetree binding documentation. I have seen it only in the omap_hwmod_* stuff
> used by omap2/3.
> 
> So how to make mcbsp happy?

I think all you need to do is add an entry for prcm_fck to point to
mcbsp4_sync_mux_ck in omap44xx_clks[]. Seems this got dropped with commit
349355ce3a05 ("ARM: OMAP2+: Drop legacy platform data for omap4 mcbsp").

Or patch the driver so it tries to use the dt clock so that the standard
assigned-clocks devicetree property works for a board specific
configuration.

Regards,

Tony
