Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1739510EA47
	for <lists+linux-omap@lfdr.de>; Mon,  2 Dec 2019 13:59:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727382AbfLBM7u (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 2 Dec 2019 07:59:50 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:58104 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727381AbfLBM7u (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 2 Dec 2019 07:59:50 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78715309;
        Mon,  2 Dec 2019 13:59:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575291588;
        bh=1Jf/V8KWUkrH0agvEc/AiIJG6fg8GC6Pjz2UuUBgrF0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O+02juee+1bW8PEI7y7vcaiKeu7G7DnWs6GRrslGVNUPWLGrSonRtjgNGJEiqawEK
         HAGLGoGnF1Y2yqrTEjN5W3IOUJ2Mm7vWvOPpim+VSjjN7d6BeD8XcJbXNb7ah1JF9e
         M2+xdrbcs7v5cRZLhKrhp/PUBbZLHcBIWZsNv3uI=
Date:   Mon, 2 Dec 2019 14:59:41 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Jyri Sarha <jsarha@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: Question about drm/omap: Remove panel-dpi driver
Message-ID: <20191202125941.GF4929@pendragon.ideasonboard.com>
References: <CAHCN7x+F9c-_0febeV1EdJqVBs8aOrqYLQdds26MT25t=Sa_Fg@mail.gmail.com>
 <20190822020850.GC17402@pendragon.ideasonboard.com>
 <CAHCN7xJdCBLo2Qop6gD1kRFXE-fxkH3OuN0XO6t9kUJ3HA-tRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHCN7xJdCBLo2Qop6gD1kRFXE-fxkH3OuN0XO6t9kUJ3HA-tRw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Adam,

(CC'ing Jyri and Tomi)

I'm sorry for the very late reply, your e-mail got burried in my inbox.

On Wed, Aug 21, 2019 at 09:39:27PM -0500, Adam Ford wrote:
> On Wed, Aug 21, 2019 at 9:08 PM Laurent Pinchart wrote:
> > On Wed, Aug 21, 2019 at 08:14:43PM -0500, Adam Ford wrote:
> > > I know it's been nearly 9 months this this was removed, but for those
> > > of us who still define our displays in the device tree expecting the
> > > dpi-panel, we're not getting video.
> > >
> > > The commit message only states:
> > >
> > >     Panels are now supported through the drm_panel infrastructure, remove
> > >     the omapdrm-specific driver.
> > >
> > > It does not give examples of how to do this, and I feel like we should
> > > have been given some warning or indication.  Is there an example I can
> > > follow for linking a dpi panel into the omap DSS?
> >
> > Sorry to have left you with non-working systems :-(
> 
> I have really only been following the omap-linux mailing list and only
> really focus on the LTS kernels because my employer uses the LTS
> kernels as the basis for the their linux distributions. If there is a
> different mailing list I should follow, let me know.  I just wish it
> would have been marked as deprecated or something before just being
> killed.
> 
> > If the panel is supported by a mainline DRM panel driver the change
> > should be transparent (provided of course that the driver is compiled in
> > the kernel or as a module). Most panels are supported by the
> > panel-simple driver (CONFIG_DRM_PANEL_SIMPLE), with a few dozen of other
> > panels supported by dedicated drivers (in drivers/gpu/drm/panel/)
> >
> > Could you point me to the DT sources of one (or all) of the affected
> > systems ?
> 
> Sure,
> The same panel is used on these these two boards:
> logicpd-som-lv-baseboard.dtsi
> logicpd-torpedo-37xx-devkit-28.dts
> 
> A second panel is used on:
> logicpd-torpedo-37xx-devkit.dts which has the LCD timings defined in
> logicpd-torpedo-baseboard.dtsi
> The am3517-evm also uses the same timings, but the gpio enables are different.

I see. The omap3-ha-lcd.dts is also affected. There are only two ways to
fix this as far as I can tell:

- Add a panel driver matching against the panel-dpi compatible string,
  and parsing the panel timings from DT there. Thierry Reding, the DRM
  panel maintainer, has rejected this option multiple times (but it
  seems people are still trying).

- Add the exact panel model to the above DT files (see omap3-thunder.dts
  for an example), and make sure we have a kernel driver for those
  panels (possibly extending the panel-simple driver). It seems that we
  are also missing support in panel drivers for innolux,at070tn83,
  osddisplays,osd057T0559-34ts, samsung,lte430wq-f0c and
  startek,startek-kd050c.

Tomi, which approach do you think is best at this point ?

> The da850-evm uses the same panel as the am3517-evm, but it's not
> using the same video driver, and I haven't had a chance to see if that
> driver still exists or not.

The tilcdc driver is still present in the kernel (I'm not aware of a
plan to remove it), and uses a similar panel support hack as the omapdrm
driver. I think it would make sense to fix it at some point, but I have
no plan to do so myself at the moment.

> Thanks for your quick response.
> :-)

Looks like I did a way worse job this time. Sorry again.

> Sorry if my e-mail came across angrily, it wasn't my intention.

No worries, and in any case you had reasons to be annoyed.

-- 
Regards,

Laurent Pinchart
