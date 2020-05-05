Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4AB41C5FA0
	for <lists+linux-omap@lfdr.de>; Tue,  5 May 2020 20:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730636AbgEESHj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 May 2020 14:07:39 -0400
Received: from muru.com ([72.249.23.125]:52916 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729315AbgEESHj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 5 May 2020 14:07:39 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C3AD880A5;
        Tue,  5 May 2020 18:08:26 +0000 (UTC)
Date:   Tue, 5 May 2020 11:07:34 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Lokesh Vutla <lokeshvutla@ti.com>
Cc:     daniel.lezcano@linaro.org, Tero Kristo <t-kristo@ti.com>,
        Sekhar Nori <nsekhar@ti.com>, Suman Anna <s-anna@ti.com>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clocksource/drivers/timer-ti-dm: Do one override clock
 parent in prepare()
Message-ID: <20200505180734.GN37466@atomide.com>
References: <20200427172831.16546-1-lokeshvutla@ti.com>
 <20200428182209.GT37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428182209.GT37466@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [200428 18:23]:
> * Lokesh Vutla <lokeshvutla@ti.com> [200427 17:29]:
> > omap_dm_timer_prepare() is setting up the parent 32KHz clock. This
> > prepare() gets called by request_timer in the client's driver. Because of
> > this, the timer clock parent that is set with assigned-clock-parent is being
> > overwritten. So drop this default setting of parent in prepare().
> > 
> > Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> 
> This works just fine for me but depends on the dts changes.
> 
> Daniel, for merging, do you want to set up an immutable branch
> for the related dts change and this? I'm afraid it will conflict
> with the related systimer changes for the dts otherwise.

So I've pushed out an immutable branch for the dts changes
this patch depends on against v5.7-rc1 as omap-for-v5.8/dt-timer
[0][1].

Daniel feel free to merge it in to apply this clocksource patch if
no more comments:

Acked-by: Tony Lindgren <tony@atomide.com>

[0] git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git omap-for-v5.8/dt-timer
[1] https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git/log/?h=omap-for-v5.8/dt-timer
