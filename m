Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA4A2C364
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2019 11:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbfE1Jj5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 May 2019 05:39:57 -0400
Received: from muru.com ([72.249.23.125]:51514 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726236AbfE1Jj4 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 28 May 2019 05:39:56 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5C1A780F3;
        Tue, 28 May 2019 09:40:15 +0000 (UTC)
Date:   Tue, 28 May 2019 02:39:52 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCHv6 0/4] omapdrm: DSI command mode panel support
Message-ID: <20190528093952.GM5447@atomide.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
 <60c45d23-de2f-d94a-c3d7-146a2bee538f@ti.com>
 <20190527112122.GJ5447@atomide.com>
 <e507c415-38de-86fe-9265-4b0aed0d7224@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e507c415-38de-86fe-9265-4b0aed0d7224@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Tomi Valkeinen <tomi.valkeinen@ti.com> [190528 09:19]:
> On 27/05/2019 14:21, Tony Lindgren wrote:
> 
> >> Looks good to me. For some reason I can't boot 5.2-rc2 (on x15) so I haven't
> >> been able to test yet. I'll pick the series up in any case, and I'll test it
> >> when I get the kernel booting.
> > 
> > Great good to have these merged finally :)
> > 
> > Hmm I wonder if some x15 models are affected by the SoC variant
> > changes queued in my fixes branch?
> 
> This is what I see with earlycon, on linux-omap fixes branch. I think this looks
> similar to what I saw with dra76 _without_ the fixes.

OK sounds like we need to use some different SoC specific .dtsi file,
is this maybe x15 rev c?

You can detect which modules fail based on the module base address
for revision register seen with the following debug patch. Then
those need to be tagged with status = "disabled" at the module
level in the SoC specific dtsi file.

Regards,

Tony

8< --------------
diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -2069,6 +2069,8 @@ static int sysc_probe(struct platform_device *pdev)
 	struct sysc *ddata;
 	int error;
 
+	dev_info(&pdev->dev, "probing device\n");
+
 	ddata = devm_kzalloc(&pdev->dev, sizeof(*ddata), GFP_KERNEL);
 	if (!ddata)
 		return -ENOMEM;
