Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEDAC10EAA5
	for <lists+linux-omap@lfdr.de>; Mon,  2 Dec 2019 14:18:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbfLBNSV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 2 Dec 2019 08:18:21 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:58314 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727381AbfLBNSU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 2 Dec 2019 08:18:20 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1610C309;
        Mon,  2 Dec 2019 14:18:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575292698;
        bh=n28ewQfjy6Rc3pUZzIF5WoY3Z0cN1+fEqETlEQCUFVw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J9g6k41snTNSMxmiAyA6SycfvYfuMfzew1rbxBnyr1kmjjNa9AisGYKC+7moxkddv
         1trancG4J0LEjJbXZBMqTD7dS2vaDRzkTfmJvb6KzKdBDimO7YyIRTFM1RFEVF8nAQ
         h+VcDe2KVMcbgi7rNSZqx2Q5r/4JI+U7TE8ol99k=
Date:   Mon, 2 Dec 2019 15:18:11 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Jyri Sarha <jsarha@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: Question about drm/omap: Remove panel-dpi driver
Message-ID: <20191202131811.GK4929@pendragon.ideasonboard.com>
References: <CAHCN7x+F9c-_0febeV1EdJqVBs8aOrqYLQdds26MT25t=Sa_Fg@mail.gmail.com>
 <20190822020850.GC17402@pendragon.ideasonboard.com>
 <CAHCN7xJdCBLo2Qop6gD1kRFXE-fxkH3OuN0XO6t9kUJ3HA-tRw@mail.gmail.com>
 <20191202125941.GF4929@pendragon.ideasonboard.com>
 <CAHCN7xLPDicS=1ZJ_npXGxh-DOyNLjXcqZTpNvkpErjcce-t1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHCN7xLPDicS=1ZJ_npXGxh-DOyNLjXcqZTpNvkpErjcce-t1w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Adam,

On Mon, Dec 02, 2019 at 07:13:40AM -0600, Adam Ford wrote:
> On Mon, Dec 2, 2019 at 6:59 AM Laurent Pinchart wrote:
> >
> > Hi Adam,
> >
> > (CC'ing Jyri and Tomi)
> >
> > I'm sorry for the very late reply, your e-mail got burried in my inbox.
> 
> No worries. I moved on a while ago.  ;-)
> 
> > On Wed, Aug 21, 2019 at 09:39:27PM -0500, Adam Ford wrote:
> > > On Wed, Aug 21, 2019 at 9:08 PM Laurent Pinchart wrote:
> > > > On Wed, Aug 21, 2019 at 08:14:43PM -0500, Adam Ford wrote:
> > > > > I know it's been nearly 9 months this this was removed, but for those
> > > > > of us who still define our displays in the device tree expecting the
> > > > > dpi-panel, we're not getting video.
> > > > >
> > > > > The commit message only states:
> > > > >
> > > > >     Panels are now supported through the drm_panel infrastructure, remove
> > > > >     the omapdrm-specific driver.
> > > > >
> > > > > It does not give examples of how to do this, and I feel like we should
> > > > > have been given some warning or indication.  Is there an example I can
> > > > > follow for linking a dpi panel into the omap DSS?
> > > >
> > > > Sorry to have left you with non-working systems :-(
> > >
> > > I have really only been following the omap-linux mailing list and only
> > > really focus on the LTS kernels because my employer uses the LTS
> > > kernels as the basis for the their linux distributions. If there is a
> > > different mailing list I should follow, let me know.  I just wish it
> > > would have been marked as deprecated or something before just being
> > > killed.
> 
> I believe device trees that I support for Logic PD are now in the
> MAINTAINER file with references to the omap mailing list, so if they
> are modified, I should see them if I don't subscribe to other mailing
> lists which modify stuff.
> 
> I think what would have helped is if the 'panel-dpi' reference in the
> device trees would have been deleted since there were no longer any
> drivers to support.  I think I could have caught it earlier.  I don't
> always have an LCD on the devices I test when I do spot checks.

I agree, and I should have submitted support for the corresponding
panels to panel-simple.c as part of that process, but I failed to notice
the issue :-S

> The good news in the process, I was able to work with Tomi and others
> to fix an annoying bug in the OMAP3630 which always requried me to
> modify the kernel config because the stock omap2plus crashed with my
> panel timings on the omap3630.
> 
> > > > If the panel is supported by a mainline DRM panel driver the change
> > > > should be transparent (provided of course that the driver is compiled in
> > > > the kernel or as a module). Most panels are supported by the
> > > > panel-simple driver (CONFIG_DRM_PANEL_SIMPLE), with a few dozen of other
> > > > panels supported by dedicated drivers (in drivers/gpu/drm/panel/)
> > > >
> > > > Could you point me to the DT sources of one (or all) of the affected
> > > > systems ?
> > >
> > > Sure,
> > > The same panel is used on these these two boards:
> > > logicpd-som-lv-baseboard.dtsi
> > > logicpd-torpedo-37xx-devkit-28.dts
> > >
> > > A second panel is used on:
> > > logicpd-torpedo-37xx-devkit.dts which has the LCD timings defined in
> > > logicpd-torpedo-baseboard.dtsi
> > > The am3517-evm also uses the same timings, but the gpio enables are different.
> >
> > I see. The omap3-ha-lcd.dts is also affected. There are only two ways to
> > fix this as far as I can tell:
> >
> > - Add a panel driver matching against the panel-dpi compatible string,
> >   and parsing the panel timings from DT there. Thierry Reding, the DRM
> >   panel maintainer, has rejected this option multiple times (but it
> >   seems people are still trying).
> 
> It would be nice to have a generic DT based parser so we don't have to
> keep writing C code for something that could be done in DT.  I also
> recognize that not all platforms use DT, but for those people C makes
> sense.
> 
> > - Add the exact panel model to the above DT files (see omap3-thunder.dts
> >   for an example), and make sure we have a kernel driver for those
> >   panels (possibly extending the panel-simple driver). It seems that we
> >   are also missing support in panel drivers for innolux,at070tn83,
> >   osddisplays,osd057T0559-34ts, samsung,lte430wq-f0c and
> >   startek,startek-kd050c.
> >
> > Tomi, which approach do you think is best at this point ?
> 
> I have already submitted patches to add the missing panels to the
> simple panel driver for one of the LCD's.

Great :-) Thanks for that.

> I believe they've been
> accepted already.  For the other LCD, I found a device already present
> in the simple panels driver and I'm using it.  So for my omap3 based,
> boards, I have a solution already in process.  I also submitted a fix
> to all the simple panel driver to the omap2plus_defconfig so it is
> included in the build.

Please note the related discussion in
https://patchwork.kernel.org/cover/11243277/.

> > > The da850-evm uses the same panel as the am3517-evm, but it's not
> > > using the same video driver, and I haven't had a chance to see if that
> > > driver still exists or not.
> >
> > The tilcdc driver is still present in the kernel (I'm not aware of a
> > plan to remove it), and uses a similar panel support hack as the omapdrm
> > driver. I think it would make sense to fix it at some point, but I have
> > no plan to do so myself at the moment.
> 
> If this driver does lose support for the LCD's, it should be trivial
> to migrate the da850-evm to the simple panel driver.
> 
> > > Thanks for your quick response.
> > > :-)
> >
> > Looks like I did a way worse job this time. Sorry again.
> 
> I get why you did it.
> 
> > > Sorry if my e-mail came across angrily, it wasn't my intention.
> >
> > No worries, and in any case you had reasons to be annoyed.

-- 
Regards,

Laurent Pinchart
