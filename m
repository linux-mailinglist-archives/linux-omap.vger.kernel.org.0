Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8628E46DD66
	for <lists+linux-omap@lfdr.de>; Wed,  8 Dec 2021 22:04:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237028AbhLHVHi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 8 Dec 2021 16:07:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237027AbhLHVHi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 8 Dec 2021 16:07:38 -0500
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB705C061746
        for <linux-omap@vger.kernel.org>; Wed,  8 Dec 2021 13:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ZU+AQuaDO+E76KpdyHk4e400l7H1FIcYj3Id/PlBnWg=; b=PU9VFj3jegsL2zBlWciQSI5Ooc
        nDBD8a9ZE7Wvsb1XcJuTtVm/3oKcKq+GaThFDSOf0BW9QZIOKM5eUP1sga7EXXjYFccieagID/nPd
        OuJJwy6FksEsC6P/hb/Wgt6kFDT77IBTREkgecGbtGLOorvPUYrI01rOU3xlf4t6GIMA=;
Received: from p200300ccff0cdf001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0c:df00:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1mv46b-0008Pf-L2; Wed, 08 Dec 2021 22:04:01 +0100
Date:   Wed, 8 Dec 2021 22:04:00 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     "Merlijn B.W. Wajer" <merlijn@archive.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>, Dev Null <devnull@uvos.xyz>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: Oops while booting 5.15.2 on Nokia N900
Message-ID: <20211208220400.1f9cff00@aktux>
In-Reply-To: <20211208205700.GA12125@duo.ucw.cz>
References: <12e13327-3bb5-229e-d784-cd528db4b58e@archive.org>
        <6fa3d07a-28e5-7853-e6ca-fc405d3080e4@archive.org>
        <c75ac850-7d9b-6263-a046-57c8f4435090@archive.org>
        <f463d8f2-109e-3040-4350-ce20d651ffe6@archive.org>
        <20211208205700.GA12125@duo.ucw.cz>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Wed, 8 Dec 2021 21:57:00 +0100
Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
> 
> You may want to cc: linux-kernel@vger.kernel.org and
> phone-devel@vger.kernel.org, since this is kernel issue.
> 
> > > I am back with a bit more news, but no solution.  
> > 
> > It looks like commit fb2c599f056640d289b2147fbe6d9eaee689f1b2 ("ARM:
> > omap3: enable off mode automatically") is causing these failures on the
> > Nokia N900. Reverting this commit on top of v5.10 (with
> > 21b2cec61c04bd175f0860d9411a472d5a0e7ba1 also reverted), makes the
> > problem go away (I tried 10 times).
> > 
> > The same holds for 5.15.y, just reverting
> > fb2c599f056640d289b2147fbe6d9eaee689f1b2 makes the system "stable" (at
> > least the problem reported in the first email is gone).
> > 
> > Perhaps the "pwrst->next_state" change is causing these problems, since
> > I can enter OFF mode just fine with init=/bin/sh and a custom
> > script?  
> 
> fb2c599f056640d28 has some hints in it. Perhaps Andreas can mention
> what boards he tested it on?
> 
well, I tested it on gta04a4 and gta04a5 (both dm3730).
There is one 1Ghz issue at least on the a5, so I disabled that opp.

> And rather than reverting it, we may want to delete ti,twl4030-idle*
> hints from n900 device tree for now?
> 
well, it has side effects on power consumption, power consumption
should be worse without ti,twl4030-idle-*. So the real solution would
be to understand what is causing the trouble here.

Regards,
Andreas
