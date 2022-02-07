Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 672044AB6BD
	for <lists+linux-omap@lfdr.de>; Mon,  7 Feb 2022 09:44:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233017AbiBGIVY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Feb 2022 03:21:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239163AbiBGIN6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Feb 2022 03:13:58 -0500
X-Greylist: delayed 564 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 07 Feb 2022 00:13:57 PST
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9E445C043181
        for <linux-omap@vger.kernel.org>; Mon,  7 Feb 2022 00:13:57 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8E5DF80E1;
        Mon,  7 Feb 2022 08:04:10 +0000 (UTC)
Date:   Mon, 7 Feb 2022 10:04:31 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Romain Naour <romain.naour@smile.fr>
Cc:     linux-omap@vger.kernel.org
Subject: Re: AM5749: tty serial 8250 omap driver crash
Message-ID: <YgDSj7FJS7nbkJol@atomide.com>
References: <2c80fd8a-2935-9a6d-43fd-f95fa53c93d2@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c80fd8a-2935-9a6d-43fd-f95fa53c93d2@smile.fr>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Romain Naour <romain.naour@smile.fr> [220204 13:39]:
> It seems that the driver fail to read the UART_LCR register from
> omap8250_set_mctrl():
> 
> "lcr = serial_in(up, UART_LCR);"
> 
> PC is at mem_serial_in+0x2c/0x30
> LR is at omap8250_set_mctrl+0x48/0xb0
> 
> The problem only occurs with a -rt kernel, I tried with several kernel version:
> 5.10-rt, 5.15-rt and 5.17-rt.
> 
> I'm not able to reproduce the issue with a standard kernel.

Interesting, what's the exception you get with the -rt kernel? Is it an
unhandled external abort or something else?

> While looking at the git history, I noticed this commit [3] about "flakey idling
> of uarts and stop using swsup_sidle_act".
> 
> So I removed the SYSC_QUIRK for uart IP revision 0x50411e03 and it fixed my issue.

Hmm.

> Is the SYSC_QUIRK for omap4 still needed ? Is it safe to remove it ?
> It seems this issue was introduced while dropping the legacy platform data
> (between 4.19 and 5.4 kernels).

AFAIK it's still needed, but maybe we can disable it for am57xx though.

Regards,

Tony
