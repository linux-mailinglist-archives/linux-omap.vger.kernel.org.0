Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21B77B32E6
	for <lists+linux-omap@lfdr.de>; Mon, 16 Sep 2019 03:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729004AbfIPBU3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 15 Sep 2019 21:20:29 -0400
Received: from muru.com ([72.249.23.125]:33090 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729000AbfIPBU3 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 15 Sep 2019 21:20:29 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E7D9C80BB;
        Mon, 16 Sep 2019 01:20:57 +0000 (UTC)
Date:   Sun, 15 Sep 2019 18:20:23 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Pavel Machek <pavel@denx.de>, Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Marcel Partap <mpartap@gmx.net>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Scott <hashcode0f@gmail.com>,
        NeKit <nekit1000@gmail.com>, Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 0/4] musb host improvments mostly for omap2430 glue
Message-ID: <20190916012023.GX52127@atomide.com>
References: <20190830232058.53414-1-tony@atomide.com>
 <20190902092344.GA31410@amd>
 <20190902094408.GB31410@amd>
 <20190902160651.GI52127@atomide.com>
 <20190903080725.GA26076@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190903080725.GA26076@amd>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Pavel Machek <pavel@ucw.cz> [190903 08:08]:
> On Mon 2019-09-02 09:06:51, Tony Lindgren wrote:
> #2 definitely has _something_, because it does work in original
>  android. But not even original android provides VBUS (5V on USB) in
>  that configuration. It also looks like hardware _can_ provide at
>  least VBAT on VBUS, because I seen that during some of the crashes.

I started seeing the musb hang issue you reported today
on one droid4 but not on an other one :) Turns out we have
racy .set_vbus still around that might get called.

The following patch is needed in preparation for this $subject
series as otherwise patch "[PATCH 3/4] usb: musb: Add
musb_set_host and peripheral and use them for omap2430" can
cause a hang with "scheduling while atomic" if .set_vbus
gets called from musb_stage0_irq() path.

Regards,

Tony

8< -----------------
From tony Mon Sep 17 00:00:00 2001
From: Tony Lindgren <tony@atomide.com>
Date: Sun, 15 Sep 2019 17:16:58 -0700
Subject: [PATCH] usb: musb: Get rid of musb_set_vbus()

We currently have musb_set_vbus() called from two different paths. Mostly
it gets called from the USB PHY via omap_musb_set_mailbox(), but in some
cases it can get also called from musb_stage0_irq() rather via .set_vbus:

(musb_set_host [musb_hdrc])
(omap2430_musb_set_vbus [omap2430])
(musb_stage0_irq [musb_hdrc])
(musb_interrupt [musb_hdrc])
(omap2430_musb_interrupt [omap2430])

This is racy and will not work with introducing generic helper functions
for musb_set_host() and musb_set_peripheral(). We want to get rid of the
busy loops in favor of usleep_range().

Let's just get rid of .set_vbus for omap2430 glue layer and let the PHY
code handle VBUS with musb_set_vbus(). Note that in the follow-up patch
we can completely remove omap2430_musb_set_vbus(), but let's do it in a
separate patch as this change may actually turn out to be needed as a
fix.

Reported-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/usb/musb/omap2430.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -312,8 +312,6 @@ static const struct musb_platform_ops omap2430_ops = {
 	.init		= omap2430_musb_init,
 	.exit		= omap2430_musb_exit,
 
-	.set_vbus	= omap2430_musb_set_vbus,
-
 	.enable		= omap2430_musb_enable,
 	.disable	= omap2430_musb_disable,
 
-- 
2.23.0
