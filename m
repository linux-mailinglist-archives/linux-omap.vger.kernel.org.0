Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 707332C41D
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2019 12:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbfE1KSw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 May 2019 06:18:52 -0400
Received: from muru.com ([72.249.23.125]:51544 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726236AbfE1KSw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 28 May 2019 06:18:52 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id AA3D080F3;
        Tue, 28 May 2019 10:19:10 +0000 (UTC)
Date:   Tue, 28 May 2019 03:18:47 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Keerthy <j-keerthy@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCHv6 0/4] omapdrm: DSI command mode panel support
Message-ID: <20190528101847.GN5447@atomide.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
 <60c45d23-de2f-d94a-c3d7-146a2bee538f@ti.com>
 <20190527112122.GJ5447@atomide.com>
 <e507c415-38de-86fe-9265-4b0aed0d7224@ti.com>
 <20190528093952.GM5447@atomide.com>
 <14c6c702-844b-756d-2d97-44e8f5a169df@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14c6c702-844b-756d-2d97-44e8f5a169df@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ti.com> [190528 10:05]:
> On 28/05/2019 12:39, Tony Lindgren wrote:
> > Hi,
> > 
> > * Tomi Valkeinen <tomi.valkeinen@ti.com> [190528 09:19]:
> > > On 27/05/2019 14:21, Tony Lindgren wrote:
> > > 
> > > > > Looks good to me. For some reason I can't boot 5.2-rc2 (on x15) so I haven't
> > > > > been able to test yet. I'll pick the series up in any case, and I'll test it
> > > > > when I get the kernel booting.
> > > > 
> > > > Great good to have these merged finally :)
> > > > 
> > > > Hmm I wonder if some x15 models are affected by the SoC variant
> > > > changes queued in my fixes branch?
> > > 
> > > This is what I see with earlycon, on linux-omap fixes branch. I think this looks
> > > similar to what I saw with dra76 _without_ the fixes.
> > 
> > OK sounds like we need to use some different SoC specific .dtsi file,
> > is this maybe x15 rev c?
> > 
> > You can detect which modules fail based on the module base address
> > for revision register seen with the following debug patch. Then
> > those need to be tagged with status = "disabled" at the module
> > level in the SoC specific dtsi file.
> 
> [    1.370609] ti-sysc 4ae20000.target-module: probing device
> 
> This change lets me boot. I don't know that's the correct place, though:
> 
> diff --git a/arch/arm/boot/dts/am5728.dtsi b/arch/arm/boot/dts/am5728.dtsi
> index 82e5427ef6a9..c778f9a86b3a 100644
> --- a/arch/arm/boot/dts/am5728.dtsi
> +++ b/arch/arm/boot/dts/am5728.dtsi
> @@ -31,3 +31,7 @@
> &atl_tm {
>        status = "disabled";
> };
> +
> +&timer12 {
> +       status = "disabled";
> +};

OK we should disable it at the target-module level though. Interesting
that reading the revision register works with the above, or maybe you
still get some warning?

> My board is x15 rev A3, attached to AM5 EVM. I've also attached my kernel
> config.

Strange that this is not affecting other x15? I think timer12 would
be blocked on HS devices though?

Regards,

Tony
