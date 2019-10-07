Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB1BCEA64
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 19:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbfJGRQl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 13:16:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39568 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727970AbfJGRQl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Oct 2019 13:16:41 -0400
Received: from pendragon.ideasonboard.com (modemcable118.64-20-96.mc.videotron.ca [96.20.64.118])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67FCFB2D;
        Mon,  7 Oct 2019 19:16:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1570468598;
        bh=yeGcY0TtxD7c9pfFdsT6/oUxOBZyIhvn1OM7dinxI3E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aHiUTT9rltB1HpUJW0LhlBgqYRX5nzr2vv+HTQd5V9+DeM97FL65SdgZ19n0ORsxO
         zrkNz2OJQkoiyFYrKPvB9FsRlemo6YEDDZUhoYYDt3Rx6XbQrtEOZYO+CN9/fOVG8U
         fC9KF0SRLvYp/zjxxgXvKmVSK+jXEhAFH64+JP1U=
Date:   Mon, 7 Oct 2019 20:16:35 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Sebastian Reichel <sre@kernel.org>, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        omi Valkeinen <tomi.valkeinen@ti.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, Tony Lindgren <tony@atomide.com>,
        Jyri Sarha <jsarha@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] drm: panels: fix spi aliases of former omap panels
Message-ID: <20191007171635.GC11781@pendragon.ideasonboard.com>
References: <20191007164130.31534-1-andreas@kemnade.info>
 <20191007170446.yotb24s6jhe6nx3r@earth.universe>
 <20191007191428.016ddcd4@aktux>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191007191428.016ddcd4@aktux>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Andreas,

On Mon, Oct 07, 2019 at 07:14:28PM +0200, Andreas Kemnade wrote:
> On Mon, 7 Oct 2019 19:04:46 +0200 Sebastian Reichel wrote:
> > On Mon, Oct 07, 2019 at 06:41:30PM +0200, Andreas Kemnade wrote:
> > > When the panels were moved from omap/displays/ to panel/
> > > omapdss prefix was stripped, which cause spi modalias
> > > to not contain the vendor-prefix anymore.
> > > 
> > > so we had e.g. in former times:
> > > compatible=omapdss,tpo,td028ttec1 -> modalias=spi:tpo,td028ttec1
> > > now:
> > > compatible=tpo,td028ttec1 -> modalias=spi:td028ttec1
> > > 
> > > This is consistent with other drivers. Tested the td028ttec.c
> > > only, but the pattern looks the same for the other ones.
> > > 
> > > Fixes: 45f16c82db7e8 ("drm/omap: displays: Remove unused panel drivers")
> > > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > > ---  
> > 
> > Patch looks good to me, but you have one false positive.
> > 
> > > [...]
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c b/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
> > > index 46cd9a2501298..838d39a263f53 100644
> > > --- a/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
> > > +++ b/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
> > > @@ -204,7 +204,7 @@ static int ls037v7dw01_remove(struct platform_device *pdev)
> > >  }
> > >  
> > >  static const struct of_device_id ls037v7dw01_of_match[] = {
> > > -	{ .compatible = "sharp,ls037v7dw01", },
> > > +	{ .compatible = "ls037v7dw01", },
> > >  	{ /* sentinel */ },
> > >  };
> > 
> > The DT compatible should have a vendor prefix.
> 
> oops, sorry, but I it seems that Laurent already has submitted a fix.

Seems we've been racing each other :-S Feel free to submit a v2 of this
patch if you think it's better than my series. As long as the problem
gets fixed, I'll be happy :-)

-- 
Regards,

Laurent Pinchart
