Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62C94328444
	for <lists+linux-omap@lfdr.de>; Mon,  1 Mar 2021 17:36:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232475AbhCAQci (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 1 Mar 2021 11:32:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232258AbhCAQ2N (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 1 Mar 2021 11:28:13 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16083C06178C;
        Mon,  1 Mar 2021 08:25:54 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4986D41;
        Mon,  1 Mar 2021 17:25:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1614615952;
        bh=UvI2xmse+6+yXcYP2RLtBl9/nRaWGjo9yx7bCKFX/9g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SuQN+Ee+SD7jnK2NAdbWHX0W4mkxhqZh7iYmTk87YMpahQNRMI/tVhumDP0J4RRW6
         8iwW0Ti9SJkEI6cehG6NUj8IiXQzfVmGEv44ZsBM3tJ4Xiht6BY0cxVNK0BwTzuFCx
         AslQs0lTcV7NdpMC8q9fXZnDxJxCCQvIgleEMTe0=
Date:   Mon, 1 Mar 2021 18:25:24 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/5] drm: drm_bridge: add cec_init/exit bridge ops
Message-ID: <YD0VdP2boc1aO88s@pendragon.ideasonboard.com>
References: <20210211103703.444625-1-hverkuil-cisco@xs4all.nl>
 <20210211103703.444625-2-hverkuil-cisco@xs4all.nl>
 <YC+oyavcOV0uFJUb@pendragon.ideasonboard.com>
 <663ec8d4-eb1a-a6ed-056f-cc51a544e6a7@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <663ec8d4-eb1a-a6ed-056f-cc51a544e6a7@xs4all.nl>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Hans,

(CC'ing the DRM bridge maintainers and Daniel Vetter)

On Mon, Mar 01, 2021 at 11:56:28AM +0100, Hans Verkuil wrote:
> On 19/02/2021 13:02, Laurent Pinchart wrote:
> > On Thu, Feb 11, 2021 at 11:36:59AM +0100, Hans Verkuil wrote:
> >> Add bridge cec_init/exit ops. These ops will be responsible for
> >> creating and destroying the CEC adapter for the bridge that supports
> >> CEC.
> >>
> >> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >> ---
> >>  drivers/gpu/drm/drm_bridge_connector.c | 23 +++++++++++++++++++
> >>  include/drm/drm_bridge.h               | 31 ++++++++++++++++++++++++++
> >>  2 files changed, 54 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> >> index 791379816837..2ff90f5e468c 100644
> >> --- a/drivers/gpu/drm/drm_bridge_connector.c
> >> +++ b/drivers/gpu/drm/drm_bridge_connector.c
> >> @@ -84,6 +84,13 @@ struct drm_bridge_connector {
> >>  	 * connector modes detection, if any (see &DRM_BRIDGE_OP_MODES).
> >>  	 */
> >>  	struct drm_bridge *bridge_modes;
> >> +	/**
> >> +	 * @bridge_cec:
> >> +	 *
> >> +	 * The last bridge in the chain (closest to the connector) that provides
> >> +	 * cec adapter support, if any (see &DRM_BRIDGE_OP_CEC).
> >> +	 */
> >> +	struct drm_bridge *bridge_cec;
> >>  };
> >>  
> >>  #define to_drm_bridge_connector(x) \
> >> @@ -204,6 +211,11 @@ static void drm_bridge_connector_destroy(struct drm_connector *connector)
> >>  	struct drm_bridge_connector *bridge_connector =
> >>  		to_drm_bridge_connector(connector);
> >>  
> >> +	if (bridge_connector->bridge_cec) {
> >> +		struct drm_bridge *cec = bridge_connector->bridge_cec;
> >> +
> >> +		cec->funcs->cec_exit(cec);
> >> +	}
> >>  	if (bridge_connector->bridge_hpd) {
> >>  		struct drm_bridge *hpd = bridge_connector->bridge_hpd;
> >>  
> >> @@ -352,6 +364,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> >>  			bridge_connector->bridge_detect = bridge;
> >>  		if (bridge->ops & DRM_BRIDGE_OP_MODES)
> >>  			bridge_connector->bridge_modes = bridge;
> >> +		if (bridge->ops & DRM_BRIDGE_OP_CEC)
> >> +			bridge_connector->bridge_cec = bridge;
> >>  
> >>  		if (!drm_bridge_get_next_bridge(bridge))
> >>  			connector_type = bridge->type;
> >> @@ -374,6 +388,15 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> >>  	else if (bridge_connector->bridge_detect)
> >>  		connector->polled = DRM_CONNECTOR_POLL_CONNECT
> >>  				  | DRM_CONNECTOR_POLL_DISCONNECT;
> >> +	if (bridge_connector->bridge_cec) {
> >> +		struct drm_bridge *bridge = bridge_connector->bridge_cec;
> >> +		int ret = bridge->funcs->cec_init(bridge, connector);
> >> +
> >> +		if (ret) {
> >> +			drm_bridge_connector_destroy(connector);
> >> +			return ERR_PTR(ret);
> >> +		}
> >> +	}
> >>  
> >>  	return connector;
> >>  }
> >> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> >> index 2195daa289d2..4c83c2657e87 100644
> >> --- a/include/drm/drm_bridge.h
> >> +++ b/include/drm/drm_bridge.h
> >> @@ -629,6 +629,30 @@ struct drm_bridge_funcs {
> >>  	 * the DRM_BRIDGE_OP_HPD flag in their &drm_bridge->ops.
> >>  	 */
> >>  	void (*hpd_disable)(struct drm_bridge *bridge);
> >> +
> >> +	/**
> >> +	 * @cec_init:
> >> +	 *
> >> +	 * Initialize the CEC adapter.
> >> +	 *
> >> +	 * This callback is optional and shall only be implemented by bridges
> >> +	 * that support a CEC adapter. Bridges that implement it shall also
> >> +	 * implement the @cec_exit callback and set the DRM_BRIDGE_OP_CEC flag
> >> +	 * in their &drm_bridge->ops.
> >> +	 */
> >> +	int (*cec_init)(struct drm_bridge *bridge, struct drm_connector *conn);
> >> +
> >> +	/**
> >> +	 * @cec_exit:
> >> +	 *
> >> +	 * Terminate the CEC adapter.
> >> +	 *
> >> +	 * This callback is optional and shall only be implemented by bridges
> >> +	 * that support a CEC adapter. Bridges that implement it shall also
> >> +	 * implement the @cec_init callback and set the DRM_BRIDGE_OP_CEC flag
> >> +	 * in their &drm_bridge->ops.
> >> +	 */
> >> +	void (*cec_exit)(struct drm_bridge *bridge);
> > 
> > These are very ad-hoc operations. Would it make sense to have something
> > that could also be reused for other type of intiialization and cleanup
> > that require access to the drm_connector ?
> 
> I do not have a very strong opinion, to be honest.
> 
> How about this:
> 
> 	/**
> 	 * @DRM_BRIDGE_OP_CONN: The bridge can do additional work when
> 	 * a drm_connector is created or destroyed, such as creating or
> 	 * removing a CEC adapter.
> 	 * &drm_bridge_funcs->conn_init and &drm_bridge_funcs->conn_exit
> 	 * callbacks.
> 	 */
> 	DRM_BRIDGE_OP_CONN = BIT(4),
> 
> Would that work better for you?

I like that better, it's more generic, but I then think we should drop
DRM_BRIDGE_OP_CONN. More than one bridge may need to be notified of
connector creation and deletion, so I'd loop over the bridges and call
all the ones that implement conn_init and conn_exit (which I'd rename to
spell out connector in full, but maybe there could also be better names
for init/exit as conn_init doesn't initialize the connector itself).

We could also merge the conn_init and conn_exit operations into a
connector_notify operation that would take an enum notification
parameter.

> >>  };
> >>  
> >>  /**
> >> @@ -698,6 +722,13 @@ enum drm_bridge_ops {
> >>  	 * this flag shall implement the &drm_bridge_funcs->get_modes callback.
> >>  	 */
> >>  	DRM_BRIDGE_OP_MODES = BIT(3),
> >> +	/**
> >> +	 * @DRM_BRIDGE_OP_CEC: The bridge supports a CEC adapter.
> >> +	 * Bridges that set this flag shall implement the
> >> +	 * &drm_bridge_funcs->cec_init and &drm_bridge_funcs->cec_exit
> >> +	 * callbacks.
> >> +	 */
> >> +	DRM_BRIDGE_OP_CEC = BIT(4),
> >>  };
> >>  
> >>  /**

-- 
Regards,

Laurent Pinchart
