Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22C8E43CA17
	for <lists+linux-omap@lfdr.de>; Wed, 27 Oct 2021 14:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240371AbhJ0Mwz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Oct 2021 08:52:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231811AbhJ0Mwy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Oct 2021 08:52:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A83CC061570;
        Wed, 27 Oct 2021 05:50:29 -0700 (PDT)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 526B8596;
        Wed, 27 Oct 2021 14:50:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1635339026;
        bh=ysJRXAHrR6neHB/KsiIYXfrZ4fUx+6xTFv4Js/Z1DcI=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=aa1WTzd8SrStlDrhsXvhuvNQKCeAtC/YRKoEnodI0EdpzVESmn/ysZwHeBH+r0QUf
         eNzMqto8NEMujtjGKf/uFvYvmKCt/uPzV0kv981pe1y0kC8op6g6Hz35ehlaXJllWm
         br0BV955Nzsm548BGqHQuWRgqGTyH0yFTEdBNRgQ=
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Benoit Parrot <bparrot@ti.com>
References: <20211018142842.2511200-1-narmstrong@baylibre.com>
 <20211018142842.2511200-10-narmstrong@baylibre.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v6 9/9] drm/omap: Add a 'right overlay' to plane state
Message-ID: <8fbf92ae-3802-94b6-6ad8-af669974aaf1@ideasonboard.com>
Date:   Wed, 27 Oct 2021 15:50:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211018142842.2511200-10-narmstrong@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 18/10/2021 17:28, Neil Armstrong wrote:
> From: Benoit Parrot <bparrot@ti.com>
> 
> If the drm_plane has a source width that's greater than the max width
> supported by a single hw overlay, then we assign a 'r_overlay' to it in
> omap_plane_atomic_check().
> 
> Both overlays should have the capabilities required to handle the source
> framebuffer. The only parameters that vary between the left and right
> hwoverlays are the src_w, crtc_w, src_x and crtc_x as we just even chop
> the fb into left and right halves.
> 
> We also take care of not creating odd width size when dealing with YUV
> formats.
> 
> Since both halves need to be 'appear' side by side the zpos is
> recalculated when dealing with dual overlay cases so that the other
> planes zpos is consistent.
> 
> Depending on user space usage it is possible that on occasion the number
> of requested planes exceeds the numbers of overlays required to display
> them. In that case a failure would be returned for the plane that cannot
> be handled at that time. It is up to user space to make sure the H/W
> resource are not over-subscribed.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>   drivers/gpu/drm/omapdrm/omap_drv.c     |  91 ++++++++++++++++++-
>   drivers/gpu/drm/omapdrm/omap_fb.c      |  33 ++++++-
>   drivers/gpu/drm/omapdrm/omap_fb.h      |   4 +-
>   drivers/gpu/drm/omapdrm/omap_overlay.c |  23 ++++-
>   drivers/gpu/drm/omapdrm/omap_overlay.h |   3 +-
>   drivers/gpu/drm/omapdrm/omap_plane.c   | 120 +++++++++++++++++++++++--
>   drivers/gpu/drm/omapdrm/omap_plane.h   |   1 +
>   7 files changed, 263 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> index c7912374d393..f088b6313950 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -117,6 +117,95 @@ static void omap_atomic_commit_tail(struct drm_atomic_state *old_state)
>   	dispc_runtime_put(priv->dispc);
>   }
>   
> +static int drm_atomic_state_normalized_zpos_cmp(const void *a, const void *b)
> +{
> +	const struct drm_plane_state *sa = *(struct drm_plane_state **)a;
> +	const struct drm_plane_state *sb = *(struct drm_plane_state **)b;
> +
> +	if (sa->normalized_zpos != sb->normalized_zpos)
> +		return sa->normalized_zpos - sb->normalized_zpos;
> +	else
> +		return sa->plane->base.id - sb->plane->base.id;
> +}

I think this, or the function below, needs a comment. I don't think it's 
obvious what's the logic here. It's mostly a copy of 
drm_atomic_normalize_zpos and drm_atomic_helper_crtc_normalize_zpos, if 
I'm not mistaken, it migth be good to point out what the difference is.

I'm also wondering if these normalize_zpos functions should be split to 
a separate patch (without the is_omap_plane_dual_overlay call part).

> +static int omap_atomic_update_normalize_zpos(struct drm_device *dev,
> +					     struct drm_atomic_state *state)
> +{
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *old_state, *new_state;
> +	struct drm_plane *plane;
> +	int c, i, n, inc;
> +	int total_planes = dev->mode_config.num_total_plane;
> +	struct drm_plane_state **states;
> +	int ret = 0;
> +
> +	states = kmalloc_array(total_planes, sizeof(*states), GFP_KERNEL);
> +	if (!states)
> +		return -ENOMEM;
> +
> +	for_each_oldnew_crtc_in_state(state, crtc, old_state, new_state, c) {
> +		if (old_state->plane_mask == new_state->plane_mask &&
> +		    !new_state->zpos_changed)
> +			continue;
> +
> +		/* Reset plane increment and index value for every crtc */
> +		n = 0;
> +
> +		/*
> +		 * Normalization process might create new states for planes
> +		 * which normalized_zpos has to be recalculated.
> +		 */
> +		drm_for_each_plane_mask(plane, dev, new_state->plane_mask) {
> +			struct drm_plane_state *plane_state =
> +				drm_atomic_get_plane_state(new_state->state,
> +							   plane);
> +			if (IS_ERR(plane_state)) {
> +				ret = PTR_ERR(plane_state);
> +				goto done;
> +			}
> +			states[n++] = plane_state;
> +		}
> +
> +		sort(states, n, sizeof(*states),
> +		     drm_atomic_state_normalized_zpos_cmp, NULL);
> +
> +		for (i = 0, inc = 0; i < n; i++) {
> +			plane = states[i]->plane;
> +
> +			states[i]->normalized_zpos = i + inc;
> +			DRM_DEBUG_ATOMIC("[PLANE:%d:%s] updated normalized zpos value %d\n",
> +					 plane->base.id, plane->name,
> +					 states[i]->normalized_zpos);
> +
> +			if (is_omap_plane_dual_overlay(states[i]))
> +				inc++;
> +		}
> +		new_state->zpos_changed = true;
> +	}
> +
> +done:
> +	kfree(states);
> +	return ret;
> +}
> +
> +static int omap_atomic_check(struct drm_device *dev,
> +			     struct drm_atomic_state *state)
> +{
> +	int ret;
> +
> +	ret = drm_atomic_helper_check(dev, state);
> +	if (ret)
> +		return ret;
> +
> +	if (dev->mode_config.normalize_zpos) {
> +		ret = omap_atomic_update_normalize_zpos(dev, state);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   static const struct drm_mode_config_helper_funcs omap_mode_config_helper_funcs = {
>   	.atomic_commit_tail = omap_atomic_commit_tail,
>   };
> @@ -124,7 +213,7 @@ static const struct drm_mode_config_helper_funcs omap_mode_config_helper_funcs =
>   static const struct drm_mode_config_funcs omap_mode_config_funcs = {
>   	.fb_create = omap_framebuffer_create,
>   	.output_poll_changed = drm_fb_helper_output_poll_changed,
> -	.atomic_check = drm_atomic_helper_check,
> +	.atomic_check = omap_atomic_check,
>   	.atomic_commit = drm_atomic_helper_commit,
>   };
>   
> diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
> index 190afc564914..895e66b08a81 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fb.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fb.c
> @@ -131,7 +131,9 @@ static u32 drm_rotation_to_tiler(unsigned int drm_rot)
>   /* update ovl info for scanout, handles cases of multi-planar fb's, etc.
>    */
>   void omap_framebuffer_update_scanout(struct drm_framebuffer *fb,
> -		struct drm_plane_state *state, struct omap_overlay_info *info)
> +		struct drm_plane_state *state,
> +		struct omap_overlay_info *info,
> +		struct omap_overlay_info *r_info)
>   {
>   	struct omap_framebuffer *omap_fb = to_omap_framebuffer(fb);
>   	const struct drm_format_info *format = omap_fb->format;
> @@ -218,6 +220,35 @@ void omap_framebuffer_update_scanout(struct drm_framebuffer *fb,
>   	} else {
>   		info->p_uv_addr = 0;
>   	}
> +
> +	if (r_info) {
> +		info->width /= 2;
> +		info->out_width /= 2;
> +
> +		*r_info = *info;
> +
> +		if (fb->format->is_yuv) {
> +			if (info->width & 1) {
> +				info->width++;
> +				r_info->width--;
> +			}
> +
> +			if (info->out_width & 1) {
> +				info->out_width++;
> +				r_info->out_width--;
> +			}
> +		}
> +
> +		r_info->pos_x = info->pos_x + info->out_width;
> +
> +		r_info->paddr =	get_linear_addr(fb, format, 0,
> +						x + info->width, y);
> +		if (fb->format->format == DRM_FORMAT_NV12) {
> +			r_info->p_uv_addr =
> +				get_linear_addr(fb, format, 1,
> +						x + info->width, y);
> +		}
> +	}
>   }
>   
>   /* pin, prepare for scanout: */
> diff --git a/drivers/gpu/drm/omapdrm/omap_fb.h b/drivers/gpu/drm/omapdrm/omap_fb.h
> index c0e19aed8220..b75f0b5ef1d8 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fb.h
> +++ b/drivers/gpu/drm/omapdrm/omap_fb.h
> @@ -26,7 +26,9 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
>   int omap_framebuffer_pin(struct drm_framebuffer *fb);
>   void omap_framebuffer_unpin(struct drm_framebuffer *fb);
>   void omap_framebuffer_update_scanout(struct drm_framebuffer *fb,
> -		struct drm_plane_state *state, struct omap_overlay_info *info);
> +		struct drm_plane_state *state,
> +		struct omap_overlay_info *info,
> +		struct omap_overlay_info *r_info);
>   bool omap_framebuffer_supports_rotation(struct drm_framebuffer *fb);
>   void omap_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m);
>   
> diff --git a/drivers/gpu/drm/omapdrm/omap_overlay.c b/drivers/gpu/drm/omapdrm/omap_overlay.c
> index afb2b44fdf86..10730c9b2752 100644
> --- a/drivers/gpu/drm/omapdrm/omap_overlay.c
> +++ b/drivers/gpu/drm/omapdrm/omap_overlay.c
> @@ -67,12 +67,13 @@ omap_plane_find_free_overlay(struct drm_device *dev, struct drm_plane *hwoverlay
>    * next global overlay_map to be enabled when atomic transaction is valid.
>    */
>   int omap_overlay_assign(struct drm_atomic_state *s, struct drm_plane *plane,
> -			u32 caps, u32 fourcc, struct omap_hw_overlay **overlay)
> +			u32 caps, u32 fourcc, struct omap_hw_overlay **overlay,
> +			struct omap_hw_overlay **r_overlay)
>   {
>   	/* Get the global state of the current atomic transaction */
>   	struct omap_global_state *state = omap_get_global_state(s);
>   	struct drm_plane **overlay_map = state->hwoverlay_to_plane;
> -	struct omap_hw_overlay *ovl;
> +	struct omap_hw_overlay *ovl, *r_ovl;
>   
>   	ovl = omap_plane_find_free_overlay(s->dev, overlay_map, caps, fourcc);
>   	if (!ovl)
> @@ -81,8 +82,26 @@ int omap_overlay_assign(struct drm_atomic_state *s, struct drm_plane *plane,
>   	overlay_map[ovl->idx] = plane;
>   	*overlay = ovl;
>   
> +	if (r_overlay) {
> +		r_ovl = omap_plane_find_free_overlay(s->dev, overlay_map,
> +						     caps, fourcc);
> +		if (!r_ovl) {
> +			overlay_map[r_ovl->idx] = NULL;
> +			*overlay = NULL;
> +			return -ENOMEM;
> +		}
> +
> +		overlay_map[r_ovl->idx] = plane;
> +		*r_overlay = r_ovl;
> +	}
> +
>   	DBG("%s: assign to plane %s caps %x", ovl->name, plane->name, caps);
>   
> +	if (r_overlay) {
> +		DBG("%s: assign to right of plane %s caps %x",
> +		    r_ovl->name, plane->name, caps);
> +	}
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/omapdrm/omap_overlay.h b/drivers/gpu/drm/omapdrm/omap_overlay.h
> index 38ca55e1e2d7..e36a43f35563 100644
> --- a/drivers/gpu/drm/omapdrm/omap_overlay.h
> +++ b/drivers/gpu/drm/omapdrm/omap_overlay.h
> @@ -28,7 +28,8 @@ struct omap_hw_overlay {
>   int omap_hwoverlays_init(struct omap_drm_private *priv);
>   void omap_hwoverlays_destroy(struct omap_drm_private *priv);
>   int omap_overlay_assign(struct drm_atomic_state *s, struct drm_plane *plane,
> -			u32 caps, u32 fourcc, struct omap_hw_overlay **overlay);
> +			u32 caps, u32 fourcc, struct omap_hw_overlay **overlay,
> +			struct omap_hw_overlay **r_overlay);
>   void omap_overlay_release(struct drm_atomic_state *s, struct omap_hw_overlay *overlay);
>   void omap_overlay_update_state(struct omap_drm_private *priv, struct omap_hw_overlay *overlay);
>   #endif /* __OMAPDRM_OVERLAY_H__ */
> diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
> index 5001c8354e4f..15cdff988dbc 100644
> --- a/drivers/gpu/drm/omapdrm/omap_plane.c
> +++ b/drivers/gpu/drm/omapdrm/omap_plane.c
> @@ -24,6 +24,7 @@ struct omap_plane_state {
>   	struct drm_plane_state base;
>   
>   	struct omap_hw_overlay *overlay;
> +	struct omap_hw_overlay *r_overlay;  /* right overlay */
>   };
>   
>   #define to_omap_plane(x) container_of(x, struct omap_plane, base)
> @@ -33,6 +34,13 @@ struct omap_plane {
>   	enum omap_plane_id id;
>   };
>   
> +bool is_omap_plane_dual_overlay(struct drm_plane_state *state)
> +{
> +	struct omap_plane_state *omap_state = to_omap_plane_state(state);
> +
> +	return !!omap_state->r_overlay;
> +}
> +
>   static int omap_plane_prepare_fb(struct drm_plane *plane,
>   				 struct drm_plane_state *new_state)
>   {
> @@ -61,16 +69,21 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
>   									   plane);
>   	struct omap_plane_state *new_omap_state;
>   	struct omap_plane_state *old_omap_state;
> -	struct omap_overlay_info info;
> -	enum omap_plane_id ovl_id;
> +	struct omap_overlay_info info, r_info;
> +	enum omap_plane_id ovl_id, r_ovl_id;
>   	int ret;
> +	bool dual_ovl;
>   
>   	new_omap_state = to_omap_plane_state(new_state);
>   	old_omap_state = to_omap_plane_state(old_state);
>   
> +	dual_ovl = is_omap_plane_dual_overlay(new_state);
> +
>   	/* Cleanup previously held overlay if needed */
>   	if (old_omap_state->overlay)
>   		omap_overlay_update_state(priv, old_omap_state->overlay);
> +	if (old_omap_state->r_overlay)
> +		omap_overlay_update_state(priv, old_omap_state->r_overlay);
>   
>   	if (!new_omap_state->overlay) {
>   		DBG("[PLANE:%d:%s] no overlay attached", plane->base.id, plane->name);
> @@ -93,8 +106,11 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
>   	info.color_encoding = new_state->color_encoding;
>   	info.color_range = new_state->color_range;
>   
> +	r_info = info;
> +
>   	/* update scanout: */
> -	omap_framebuffer_update_scanout(new_state->fb, new_state, &info);
> +	omap_framebuffer_update_scanout(new_state->fb, new_state, &info,
> +					dual_ovl ? &r_info : NULL);
>   
>   	DBG("%s: %dx%d -> %dx%d (%d)",
>   			new_omap_state->overlay->name, info.width, info.height,
> @@ -102,6 +118,23 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
>   	DBG("%d,%d %pad %pad", info.pos_x, info.pos_y,
>   			&info.paddr, &info.p_uv_addr);
>   
> +	if (dual_ovl) {
> +		r_ovl_id = new_omap_state->r_overlay->id;
> +		/*
> +		 * If the current plane uses 2 hw planes the very next
> +		 * zorder is used by the r_overlay so we just use the
> +		 * main overlay zorder + 1
> +		 */
> +		r_info.zorder = info.zorder + 1;
> +
> +		DBG("%s: %dx%d -> %dx%d (%d)",
> +		    new_omap_state->r_overlay->name,
> +		    r_info.width, r_info.height,
> +		    r_info.out_width, r_info.out_height, r_info.screen_width);
> +		DBG("%d,%d %pad %pad", r_info.pos_x, r_info.pos_y,
> +		    &r_info.paddr, &r_info.p_uv_addr);
> +	}
> +
>   	/* and finally, update omapdss: */
>   	ret = dispc_ovl_setup(priv->dispc, ovl_id, &info,
>   			      omap_crtc_timings(new_state->crtc), false,
> @@ -114,6 +147,21 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
>   	}
>   
>   	dispc_ovl_enable(priv->dispc, ovl_id, true);
> +
> +	if (dual_ovl) {
> +		ret = dispc_ovl_setup(priv->dispc, r_ovl_id, &r_info,
> +				      omap_crtc_timings(new_state->crtc), false,
> +				      omap_crtc_channel(new_state->crtc));
> +		if (ret) {
> +			dev_err(plane->dev->dev, "Failed to setup plane right-overlay %s\n",
> +				plane->name);
> +			dispc_ovl_enable(priv->dispc, r_ovl_id, false);
> +			dispc_ovl_enable(priv->dispc, ovl_id, false);
> +			return;
> +		}
> +
> +		dispc_ovl_enable(priv->dispc, r_ovl_id, true);
> +	}
>   }
>   
>   static void omap_plane_atomic_disable(struct drm_plane *plane,
> @@ -139,6 +187,11 @@ static void omap_plane_atomic_disable(struct drm_plane *plane,
>   
>   	omap_overlay_update_state(priv, old_omap_state->overlay);
>   	new_omap_state->overlay = NULL;
> +
> +	if (is_omap_plane_dual_overlay(old_state)) {
> +		omap_overlay_update_state(priv, old_omap_state->r_overlay);
> +		new_omap_state->r_overlay = NULL;
> +	}
>   }
>   
>   #define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
> @@ -154,6 +207,7 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
>   	struct omap_plane_state *omap_state = to_omap_plane_state(new_plane_state);
>   	struct omap_global_state *omap_overlay_global_state;
>   	struct drm_crtc_state *crtc_state;
> +	bool new_r_hw_overlay = false;
>   	bool new_hw_overlay = false;
>   	u32 max_width, max_height;
>   	struct drm_crtc *crtc;
> @@ -196,7 +250,9 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
>   
>   	if (!new_plane_state->visible) {
>   		omap_overlay_release(state, omap_state->overlay);
> +		omap_overlay_release(state, omap_state->r_overlay);
>   		omap_state->overlay = NULL;
> +		omap_state->r_overlay = NULL;
>   		return 0;
>   	}
>   
> @@ -213,8 +269,30 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
>   	if (new_plane_state->src_h > max_height || new_plane_state->crtc_h > height)
>   		return -EINVAL;
>   
> -	if (new_plane_state->src_w > max_width || new_plane_state->crtc_w > width)
> -		return -EINVAL;
> +
> +	if (new_plane_state->src_w > max_width || new_plane_state->crtc_w > width) {
> +		bool is_fourcc_yuv = new_plane_state->fb->format->is_yuv;
> +
> +		if (is_fourcc_yuv && (((new_plane_state->src_w >> 16) / 2 & 1) ||
> +				      new_plane_state->crtc_w / 2 & 1)) {
> +			/*
> +			 * When calculating the split overlay width
> +			 * and it yield an odd value we will need to adjust
> +			 * the indivual width +/- 1. So make sure it fits
> +			 */
> +			if (new_plane_state->src_w <= ((2 * width - 1) << 16) &&
> +			    new_plane_state->crtc_w <= (2 * width - 1))
> +				new_r_hw_overlay = true;
> +			else
> +				return -EINVAL;
> +		} else {
> +			if (new_plane_state->src_w <= (2 * max_width) &&
> +			    new_plane_state->crtc_w <= (2 * width))
> +				new_r_hw_overlay = true;
> +			else
> +				return -EINVAL;
> +		}
> +	}
>   
>   	if (new_plane_state->rotation != DRM_MODE_ROTATE_0 &&
>   	    !omap_framebuffer_supports_rotation(new_plane_state->fb))
> @@ -239,24 +317,44 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
>   			new_hw_overlay = true;
>   	}
>   
> +	/*
> +	 * check if we need two overlays and only have 1 or
> +	 * if we had 2 overlays but will only need 1
> +	 */
> +	if ((new_r_hw_overlay && !omap_state->r_overlay) ||
> +	    (!new_r_hw_overlay && omap_state->r_overlay))
> +		new_hw_overlay = true;

Is this 'new_hw_overlay' variable more like... "reassign_hw_overlays" 
after this patch?

>   	if (new_hw_overlay) {
>   		struct omap_hw_overlay *old_ovl = omap_state->overlay;
> +		struct omap_hw_overlay *old_r_ovl = omap_state->r_overlay;
>   		struct omap_hw_overlay *new_ovl = NULL;
> +		struct omap_hw_overlay *new_r_ovl = NULL;
>   
>   		omap_overlay_release(state, old_ovl);
> +		omap_overlay_release(state, old_r_ovl);
>   
> -		ret = omap_overlay_assign(state, plane, caps, fourcc, &new_ovl);
> +		ret = omap_overlay_assign(state, plane, caps, fourcc, &new_ovl,
> +					  new_r_hw_overlay ? &new_r_ovl : NULL);
>   		if (ret) {
>   			DBG("%s: failed to assign hw_overlay", plane->name);
>   			omap_state->overlay = NULL;
> +			omap_state->r_overlay = NULL;
>   			return ret;
>   		}
>   
>   		omap_state->overlay = new_ovl;
> +		if (new_r_hw_overlay)
> +			omap_state->r_overlay = new_r_ovl;
> +		else
> +			omap_state->r_overlay = NULL;
>   	}
>   
>   	DBG("plane: %s overlay_id: %d", plane->name, omap_state->overlay->id);
>   
> +	if (omap_state->r_overlay)
> +		DBG("plane: %s r_overlay_id: %d", plane->name, omap_state->r_overlay->id);
> +
>   	return 0;
>   }
>   
> @@ -344,6 +442,7 @@ omap_plane_atomic_duplicate_state(struct drm_plane *plane)
>   	__drm_atomic_helper_plane_duplicate_state(plane, &state->base);
>   
>   	state->overlay = current_state->overlay;
> +	state->r_overlay = current_state->r_overlay;
>   
>   	return &state->base;
>   }
> @@ -361,6 +460,15 @@ static void omap_plane_atomic_print_state(struct drm_printer *p,
>   			   omap_state->overlay->id);
>   		drm_printf(p, "\t\tcaps=0x%x\n", omap_state->overlay->caps);
>   	}
> +
> +	drm_printf(p, "\tr_overlay=%s\n", omap_state->r_overlay ?
> +					  omap_state->r_overlay->name : "(null)");
> +	if (omap_state->r_overlay) {
> +		drm_printf(p, "\t\tidx=%d\n", omap_state->r_overlay->idx);
> +		drm_printf(p, "\t\toverlay_id=%d\n",
> +			   omap_state->r_overlay->id);
> +		drm_printf(p, "\t\tcaps=0x%x\n", omap_state->r_overlay->caps);
> +	}
>   }
>   
>   static int omap_plane_atomic_set_property(struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/omapdrm/omap_plane.h b/drivers/gpu/drm/omapdrm/omap_plane.h
> index 0c28fe8ffa20..a9a33e12722a 100644
> --- a/drivers/gpu/drm/omapdrm/omap_plane.h
> +++ b/drivers/gpu/drm/omapdrm/omap_plane.h
> @@ -22,5 +22,6 @@ struct drm_plane *omap_plane_init(struct drm_device *dev,
>   		u32 possible_crtcs);
>   void omap_plane_install_properties(struct drm_plane *plane,
>   		struct drm_mode_object *obj);
> +bool is_omap_plane_dual_overlay(struct drm_plane_state *state);
>   
>   #endif /* __OMAPDRM_PLANE_H__ */
> 

