Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66379170A8C
	for <lists+linux-omap@lfdr.de>; Wed, 26 Feb 2020 22:36:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727721AbgBZVg4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Feb 2020 16:36:56 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42002 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727581AbgBZVgz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 Feb 2020 16:36:55 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CFE9DC3;
        Wed, 26 Feb 2020 22:36:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1582753013;
        bh=BGTEB2bSgBCwtx3g1gHs/U9S15mXns6Knjh7S7rOYRA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L0lx0iBrIQjk+4LXCrE/R26PRofCV8CYYd1D2b5v8+/q+n2oknJCc+Shqu+PwKWEi
         QoJbhdun0EvSMVzkzShh4A7vm/2oUZaRlNDhauu7FHmDTK5pkWbvrwN6SP0RAZVYPc
         FGRcuQErDOYQ3KD5O679zgY5m/G5pkiK1q4fNNcQ=
Date:   Wed, 26 Feb 2020 23:36:30 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCHv2 04/56] omap/drm: drop unused dsi.configure_pins
Message-ID: <20200226213630.GH4770@pendragon.ideasonboard.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-5-sebastian.reichel@collabora.com>
 <20200224234249.GI16163@pendragon.ideasonboard.com>
 <20200226212819.6d3sm4uor6xsgxsw@earth.universe>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200226212819.6d3sm4uor6xsgxsw@earth.universe>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sebastian,

On Wed, Feb 26, 2020 at 10:28:19PM +0100, Sebastian Reichel wrote:
> On Tue, Feb 25, 2020 at 01:42:49AM +0200, Laurent Pinchart wrote:
> > On Tue, Feb 25, 2020 at 12:20:34AM +0100, Sebastian Reichel wrote:
> > > The panel-dsi-cm's ddata->pin_config is always NULL, so this
> > > callback is never called. Instead the DSI encoder gets the pin
> > > configuration directly from DT.
> > > 
> > > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > ---
> > >  drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 11 -----------
> > >  drivers/gpu/drm/omapdrm/dss/dsi.c               |  1 -
> > >  drivers/gpu/drm/omapdrm/dss/omapdss.h           |  2 --
> > >  3 files changed, 14 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> > > index 3484b5d4a91c..e7fe5d702337 100644
> > > --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> > > +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> > > @@ -68,8 +68,6 @@ struct panel_drv_data {
> > >  	int width_mm;
> > >  	int height_mm;
> > >  
> > > -	struct omap_dsi_pin_config pin_config;
> > > -
> > >  	/* runtime variables */
> > >  	bool enabled;
> > >  
> > > @@ -623,15 +621,6 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
> > >  		}
> > >  	}
> > >  
> > > -	if (ddata->pin_config.num_pins > 0) {
> > > -		r = src->ops->dsi.configure_pins(src, &ddata->pin_config);
> > > -		if (r) {
> > > -			dev_err(&ddata->pdev->dev,
> > > -				"failed to configure DSI pins\n");
> > > -			goto err_vddi;
> > > -		}
> > > -	}
> > > -
> > >  	r = src->ops->dsi.set_config(src, &dsi_config);
> > >  	if (r) {
> > >  		dev_err(&ddata->pdev->dev, "failed to configure DSI\n");
> > > diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> > > index 79ddfbfd1b58..8c39823a8295 100644
> > > --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> > > +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> > > @@ -4892,7 +4892,6 @@ static const struct omap_dss_device_ops dsi_ops = {
> > >  
> > >  		.enable_hs = dsi_vc_enable_hs,
> > >  
> > > -		.configure_pins = dsi_configure_pins,
> > >  		.set_config = dsi_set_config,
> > >  
> > >  		.enable_video_output = dsi_enable_video_output,
> > > diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> > > index cbbe10b2b60d..b0424daaceed 100644
> > > --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> > > +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> > > @@ -292,8 +292,6 @@ struct omapdss_dsi_ops {
> > 
> > I think you can drop the definition of the omap_dsi_pin_config structure
> > earlier in this file too, as well as the OMAP_DSS_MAX_DSI_PINS macro.
> > With this fixed,
> 
> No, the struct is still used by the code setting up the pins from
> DT.

Indeed, my bad. I think I'd pass the unsigned int num_pins and const int
*pins to dsi_configure_pins() directly to drop the structure, but that
can be done in a subsequent patch (maybe it is already :-)).

> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

This tag holds.

> > >  	/* bus configuration */
> > >  	int (*set_config)(struct omap_dss_device *dssdev,
> > >  			const struct omap_dss_dsi_config *cfg);
> > > -	int (*configure_pins)(struct omap_dss_device *dssdev,
> > > -			const struct omap_dsi_pin_config *pin_cfg);
> > >  
> > >  	void (*enable_hs)(struct omap_dss_device *dssdev, int channel,
> > >  			bool enable);

-- 
Regards,

Laurent Pinchart
