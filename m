Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4997429F86
	for <lists+linux-omap@lfdr.de>; Tue, 12 Oct 2021 10:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234784AbhJLIQI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Oct 2021 04:16:08 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51166 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234745AbhJLIQG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Oct 2021 04:16:06 -0400
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0850DF1;
        Tue, 12 Oct 2021 10:14:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634026443;
        bh=OsxZbQcwz1dtkRw/hcxIOr4+ACIDIZMxyBqiI9xMdBc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=agJyJ2+fUWzHCWIGvGGJa7JOWuwKVm2Tg/93XIp41HxFydtMPen19bMqOW2Z48qNA
         gn0jhD+8BtcLrn8l90ChqvjaNs+NubhQLBeI8p3dB1hwImpLbkFGGCj2DDyLYQjLS3
         BVJr+pAdrcgrucR7QqshyDZFv8xJganq172JljWI=
Subject: Re: [PATCH v5 4/8] drm/omap: omap_plane: subclass drm_plane_state
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Benoit Parrot <bparrot@ti.com>
References: <20210923070701.145377-1-narmstrong@baylibre.com>
 <20210923070701.145377-5-narmstrong@baylibre.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <b9bb0e4b-26b8-72f0-937b-1a08145352d8@ideasonboard.com>
Date:   Tue, 12 Oct 2021 11:13:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923070701.145377-5-narmstrong@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 23/09/2021 10:06, Neil Armstrong wrote:
> From: Benoit Parrot <bparrot@ti.com>
> 
> In preparation to add omap plane state specific extensions we need to
> subclass drm_plane_state and add the relevant helpers.
> 
> The addition of specific extension will be done separately.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>   drivers/gpu/drm/omapdrm/omap_plane.c | 38 +++++++++++++++++++++++++---
>   1 file changed, 35 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
> index 0df5381cc015..bda794b4c915 100644
> --- a/drivers/gpu/drm/omapdrm/omap_plane.c
> +++ b/drivers/gpu/drm/omapdrm/omap_plane.c
> @@ -16,6 +16,13 @@
>    * plane funcs
>    */
>   
> +#define to_omap_plane_state(x) container_of(x, struct omap_plane_state, base)
> +
> +struct omap_plane_state {
> +	/* Must be first. */
> +	struct drm_plane_state base;
> +};
> +
>   #define to_omap_plane(x) container_of(x, struct omap_plane, base)
>   
>   struct omap_plane {
> @@ -207,11 +214,17 @@ void omap_plane_install_properties(struct drm_plane *plane,
>   static void omap_plane_reset(struct drm_plane *plane)
>   {
>   	struct omap_plane *omap_plane = to_omap_plane(plane);
> +	struct omap_plane_state *omap_state;
>   
> -	drm_atomic_helper_plane_reset(plane);
> -	if (!plane->state)
> +	if (plane->state)
> +		drm_atomic_helper_plane_destroy_state(plane, plane->state);
> +
> +	omap_state = kzalloc(sizeof(*omap_state), GFP_KERNEL);
> +	if (!omap_state)
>   		return;
>   
> +	__drm_atomic_helper_plane_reset(plane, &omap_state->base);
> +
>   	/*
>   	 * Set the zpos default depending on whether we are a primary or overlay
>   	 * plane.
> @@ -222,6 +235,25 @@ static void omap_plane_reset(struct drm_plane *plane)
>   	plane->state->color_range = DRM_COLOR_YCBCR_FULL_RANGE;
>   }
>   
> +static struct drm_plane_state *
> +omap_plane_atomic_duplicate_state(struct drm_plane *plane)
> +{
> +	struct omap_plane_state *state;
> +	struct omap_plane_state *copy;
> +
> +	if (WARN_ON(!plane->state))
> +		return NULL;
> +
> +	state = to_omap_plane_state(plane->state);
> +	copy = kmemdup(state, sizeof(*state), GFP_KERNEL);
> +	if (!copy)
> +		return NULL;
> +
> +	__drm_atomic_helper_plane_duplicate_state(plane, &copy->base);
> +
> +	return &copy->base;
> +}
> +

omap_crtc.c has similar, but slightly different, functions. I think it 
would be good to use the same style in omap_plane, or, if the approach 
above is better, change omap_crtc to match the style here.

  Tomi
