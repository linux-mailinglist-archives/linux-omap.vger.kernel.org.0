Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E25C5324FF2
	for <lists+linux-omap@lfdr.de>; Thu, 25 Feb 2021 13:47:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231614AbhBYMr2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Feb 2021 07:47:28 -0500
Received: from muru.com ([72.249.23.125]:37208 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229571AbhBYMr2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 25 Feb 2021 07:47:28 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9632E807A;
        Thu, 25 Feb 2021 12:47:18 +0000 (UTC)
Date:   Thu, 25 Feb 2021 14:46:43 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, hns@goldelico.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v4 24/80] drm/omap: dsi: move TE GPIO handling into core
Message-ID: <YDecMzuPaXGS/n5l@atomide.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-25-tomi.valkeinen@ti.com>
 <YCF7ARchcMKvWa4s@atomide.com>
 <5b469566-c926-7e1f-8872-84774b96f389@ideasonboard.com>
 <YCVq8JnuMLQq6FEc@atomide.com>
 <4432cf2c-fe15-dab0-3034-789f6d711396@ideasonboard.com>
 <YC4Bte47SFKVgrqX@atomide.com>
 <7c852efd-560a-4dbb-ed04-e4812b343a33@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c852efd-560a-4dbb-ed04-e4812b343a33@ideasonboard.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [210222 08:47]:
> On 18/02/2021 07:57, Tony Lindgren wrote:
> > Oh cool that you have those running again/still :) In this case there
> > is no te-gpios if that might make a difference.
> 
> No, GPIO TE is not used on OMAP4 SDP either.

OK

> >> So these errors start from the boot? Or only when running something
> >> specific?
> > 
> > They start from the boot when modules are loaded.
> 
> Normally there are no updates happening unless an userspace app is
> running, but I guess you have fb console enabled, with the blinking
> cursor which makes the updates.
> 
> I usually don't have fbcon enabled, but OMAP4 SDP works fine for me with
> fbcon too...

I'm using loadable modules with omap2plus_defconfig in case that makes
a difference. Maybe there's some state preserved somewhere if deferred
probe happens?

> >> Is there a bootloader that initializes the display?
> > 
> > Yes it boots with kexec.
> 
> Is that open source? Can you disable the display setup from the
> bootloader? Maybe the DSS or the panel is left into a state that for
> whatever reason makes the kernel drivers break.

Well that's a signed kernel booting kexec. But it has been working
just fine for years now so I'd rather not blame that.

> Or maybe a DSS or DSI reset via SYSCONFIG at probe would help, or panel
> reset if it has such a feature.

Maybe. But why would the $subject patch cause the errors?

Regards,

Tony
