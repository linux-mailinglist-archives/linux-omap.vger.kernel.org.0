Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8466D158D30
	for <lists+linux-omap@lfdr.de>; Tue, 11 Feb 2020 12:07:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbgBKLH3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Feb 2020 06:07:29 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46568 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727264AbgBKLH3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Feb 2020 06:07:29 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7ECE52A;
        Tue, 11 Feb 2020 12:07:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1581419247;
        bh=pBTt/u7T3z2+TO23AZgfk6mLR2REE3Psxm7jHS2oWcc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HsqMyuSsu9+ikDDmWp1U+jfXsGr4562qnPs5W9HoPv9TbJB3kxOWl0cr4TFB9bV37
         +O5Fzr7CsRL2YLhwH1Wz0bYHnM5BfRrI5/OiGon4UWZKdJp2rrHCars+lEnMK42ct4
         dZRZRDKzw3MwOC5PQKA8hI3TzMJ4qkaIo1jTR45s=
Date:   Tue, 11 Feb 2020 13:07:12 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Jyri Sarha <jsarha@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 2/3] ARM: dts: am437x-gp/epos-evm: drop unused panel
 timings
Message-ID: <20200211110712.GB28355@pendragon.ideasonboard.com>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
 <20191114093950.4101-3-tomi.valkeinen@ti.com>
 <20191202130459.GH4929@pendragon.ideasonboard.com>
 <20191211165331.GC43123@atomide.com>
 <45dae8f7-2f5e-6948-5a05-dc8a09ace1fa@ti.com>
 <20191212203550.GB4892@pendragon.ideasonboard.com>
 <add3d8af-6977-68e6-fb77-2fa748c4714a@ti.com>
 <b39e52f1-3e73-5f26-6206-0956cf482631@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b39e52f1-3e73-5f26-6206-0956cf482631@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi,

On Tue, Feb 11, 2020 at 12:01:31PM +0200, Tomi Valkeinen wrote:
> On 13/01/2020 14:01, Tomi Valkeinen wrote:
> > On 12/12/2019 22:35, Laurent Pinchart wrote:
> >> On Thu, Dec 12, 2019 at 11:37:51AM +0200, Tomi Valkeinen wrote:
> >>> On 11/12/2019 18:53, Tony Lindgren wrote:
> >>>> * Laurent Pinchart <laurent.pinchart@ideasonboard.com> [191202 13:05]:
> >>>>> Hi Tomi,
> >>>>>
> >>>>> Thank you for the patch.
> >>>>>
> >>>>> On Thu, Nov 14, 2019 at 11:39:49AM +0200, Tomi Valkeinen wrote:
> >>>>>> panel-simple now handled panel osd070t1718-19ts, and we no longer need
> >>>>>> the panel timings in the DT file. So remove them.
> >>>>>
> >>>>> Should you in that case drop the panel-dpi compatible string too, as the
> >>>>> panel-dpi bindings require panel timings in DT ?
> >>>>
> >>>> Yeah sounds like if panel-dpi is no longer usable for this device it
> >>>> should be dropped from the compatible list.
> >>>
> >>> Ok, I agree.
> >>>
> >>> Looking at the dts files, panel-dpi is used in a bunch of boards. But
> >>> we even have 3 dts files with panel-dpi, without the detailed panel
> >>> model in compatible...
> >>>
> >>> Fixing those will break the compatibility with old dtbs and new
> >>> kernel, unless we add timings-from-dt to a panel driver that handles
> >>> panel-dpi.
> >>
> >> I know, and I don't have a perfect answer for this :-( I don't see a
> >> third option, it's either breaking DT backward compatibility or adding
> >> timings parsing to a panel driver (either a new panel-dpi driver or to
> >> panel-simple). What's your preferred option ?
> > 
> > Hmm, I just realized that changing these will break omapfb. It
> > relies on panel-dpi and timings from DT...
> 
> If no one objects, I think we should just drop the timings from the
> .dts, and say that these boards are no longer supported with omapfb. I
> don't think there's much point in trying to keep omapfb working fine
> for boards that are fully supported by omapdrm.

No objection from me.

> Hopefully soon (in five years? =) we can say that omapdrm supports all
> the boards, and we can deprecate omapfb.

I'd love to send a patch to remove omapfb, but I'll let you do the
honours :-)

-- 
Regards,

Laurent Pinchart
