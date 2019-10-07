Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55DDBCEAD5
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 19:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728440AbfJGRoc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 13:44:32 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39790 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728031AbfJGRoc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Oct 2019 13:44:32 -0400
Received: from pendragon.ideasonboard.com (modemcable118.64-20-96.mc.videotron.ca [96.20.64.118])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 48CF0B2D;
        Mon,  7 Oct 2019 19:44:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1570470269;
        bh=j/RZ7vTnFpQSXDCVdsQh487qVdy1glteYbQqTh4+P7Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jfSJUyyq+xRnwgljPVfYonhPmN1RDpoDSHN9SyPloUPuA6KjNJPldONrvJmwH1ty4
         wfa87wudunZ2Mf9Q7g9jseK2IXfUTL9dJL3qA5QKIVpJHSd3P53rT/C2gP7CKNCO5H
         3TYWN4fCa9Aa1jEVpxJp24Ae7maAzQ2HLvjZjGeI=
Date:   Mon, 7 Oct 2019 20:44:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        thierry.reding@gmail.com, letux-kernel@openphoenux.org,
        Tony Lindgren <tony@atomide.com>, Jyri Sarha <jsarha@ti.com>,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH 0/5] Fix SPI module alias for panels used by omapdrm
Message-ID: <20191007174426.GF11781@pendragon.ideasonboard.com>
References: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
 <20191007172256.GA1956@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191007172256.GA1956@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sam,

On Mon, Oct 07, 2019 at 07:22:56PM +0200, Sam Ravnborg wrote:
> Hi Laurent.
> On Mon, Oct 07, 2019 at 08:07:56PM +0300, Laurent Pinchart wrote:
> > Hello,
> > 
> > This patch series fixes a module alias issue with the five recently
> > added panel drivers used by omapdrm.
> > 
> > Before those panel drivers, omapdrm had custom drivers for the panels,
> > and prefixed the OF compatible strings with an "omapdss," prefix. The
> > SPI device IDs are constructed by stripping the OF compatible string
> > from the prefix, resulting in the "omapdss," prefix being removed, but
> > the subsequence OF vendor prefix being kept. The SPI drivers thus had
> > modules aliases that contained the vendor prefix.
> > 
> > Now that the panels are supported by standard drivers and the "omapdss,"
> > prefix is removed, the SPI device IDs are stripped from the OF vendor
> > prefix. As the new panel drivers copied the module aliases from the
> > omapdrm-specific drivers, they contain the vendor prefix in their SPI
> > module aliases, and are thus not loaded automatically.
> > 
> > Fix this by removing the vendor prefix from the SPI modules aliases in
> > the drivers. For consistency reason, the manual module aliases are also
> > moved to use an SPI module table.
> 
> Good explanation - thanks.
> 
> > These patches are based on the drm-misc-fixes branch as they fix v5.4
> > regressions.
> > 
> > Laurent Pinchart (5):
> >   drm/panel: lg-lb035q02: Fix SPI alias
> >   drm/panel: nec-nl8048hl11: Fix SPI alias
> >   drm/panel: sony-acx565akm: Fix SPI alias
> >   drm/panel: tpo-td028ttec1: Fix SPI alias
> >   drm/panel: tpo-td043mtea1: Fix SPI alias
> 
> Full series is:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> I expect someone else to pick them up or that you apply them.

I'd like someone to test the patches first if possible :-) Tomi, could
you then pick these up as v5.4 fixes ?

-- 
Regards,

Laurent Pinchart
