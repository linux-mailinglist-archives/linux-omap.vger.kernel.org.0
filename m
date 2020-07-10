Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6200D21BC74
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jul 2020 19:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbgGJRkz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Jul 2020 13:40:55 -0400
Received: from muru.com ([72.249.23.125]:33310 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726925AbgGJRkx (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 10 Jul 2020 13:40:53 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 1239780E5;
        Fri, 10 Jul 2020 17:41:46 +0000 (UTC)
Date:   Fri, 10 Jul 2020 10:40:51 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH 00/13] Add IPU & DSP remoteprocs on OMAP4 and OMAP5
Message-ID: <20200710174051.GG5849@atomide.com>
References: <20200709231954.1973-1-s-anna@ti.com>
 <20200710165814.GF5849@atomide.com>
 <41bd2bb4-06fe-5f70-22cf-ce9cedc8bbc3@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41bd2bb4-06fe-5f70-22cf-ce9cedc8bbc3@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Suman Anna <s-anna@ti.com> [200710 17:18]:
> On 7/10/20 11:58 AM, Tony Lindgren wrote:
> > I wonder the following commit in v5.8-rc3 might help with this though:
> > 
> > 5ce8aee81be6 ("bus: ti-sysc: Flush posted write on enable and disable")
> > 
> 
> I had already tested on v5.8-rc4 when I posted the patches, so this patch
> doesn't help. OMAP5 DSP is fine, because Think it has to do with this
> automated

OK

> So, I am looking at the TRM, and the three VDD_{IVA,MPU,CORE}_I2C_DISABLE
> bits in VOLTCTRL are marked debug-purpose only, so I don't think we should
> be setting those to begin with. Any reason why you want to set those?
> Anyway, these bits were not an issue, I have specifically tried that
> already.

I'm pretty sure that's how the old TI PM branch was initializing them to
disable voltctrl I2C use on init. But if these are not the issue I guess
no need to mess with them.

Could it be that we have wrong voltage tables for 4460 in the mainline
kernel? See earlier commit 32236a84906f ("ARM: OMAP2+: Update 4430
voltage controller operating points").

Regards,

Tony
