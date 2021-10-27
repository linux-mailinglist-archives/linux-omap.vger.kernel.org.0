Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9403643C986
	for <lists+linux-omap@lfdr.de>; Wed, 27 Oct 2021 14:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237408AbhJ0MZo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Oct 2021 08:25:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50656 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237338AbhJ0MZo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Oct 2021 08:25:44 -0400
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA757596;
        Wed, 27 Oct 2021 14:23:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1635337397;
        bh=hCZZIb3Qa/BAfprE/laYYbaPgiuXMjNAdkKr4MBcg7o=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=EB3PlZ85+7L516uH4UvnfMTx6F3w7ItkSnHL8tZ3iuaChsls/PMj5SblEtn1EO7UX
         vcv7QYRWDGMbHEcWH5tpgWvqm7OrsZa6dyFvuqG33TZSKKLHnLXFtRGE7zNF/hSXtW
         1D8jKorXdp1PRglilTDXP3vNOdFzCMuCAyRwkziY=
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Benoit Parrot <bparrot@ti.com>
References: <20211018142842.2511200-1-narmstrong@baylibre.com>
 <20211018142842.2511200-9-narmstrong@baylibre.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v6 8/9] drm/omap: add plane_atomic_print_state support
Message-ID: <70a29d4d-eaab-5162-58b7-df9d9d3e7a9b@ideasonboard.com>
Date:   Wed, 27 Oct 2021 15:23:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211018142842.2511200-9-narmstrong@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 18/10/2021 17:28, Neil Armstrong wrote:
> From: Benoit Parrot <bparrot@ti.com>
> 
> Now that we added specific item to our subclassed drm_plane_state
> we can add omap_plane_atomic_print_state() helper to dump out our own
> driver specific plane state.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>   drivers/gpu/drm/omapdrm/omap_plane.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
> index ce5ed45401fb..5001c8354e4f 100644
> --- a/drivers/gpu/drm/omapdrm/omap_plane.c
> +++ b/drivers/gpu/drm/omapdrm/omap_plane.c
> @@ -348,6 +348,21 @@ omap_plane_atomic_duplicate_state(struct drm_plane *plane)
>   	return &state->base;
>   }
>   
> +static void omap_plane_atomic_print_state(struct drm_printer *p,
> +					  const struct drm_plane_state *state)
> +{
> +	struct omap_plane_state *omap_state = to_omap_plane_state(state);
> +
> +	drm_printf(p, "\toverlay=%s\n", omap_state->overlay ?
> +					omap_state->overlay->name : "(null)");
> +	if (omap_state->overlay) {
> +		drm_printf(p, "\t\tidx=%d\n", omap_state->overlay->idx);
> +		drm_printf(p, "\t\toverlay_id=%d\n",
> +			   omap_state->overlay->id);
> +		drm_printf(p, "\t\tcaps=0x%x\n", omap_state->overlay->caps);
> +	}
> +}

This prints:

         overlay=gfx
                 idx=0
                 overlay_id=0
                 caps=0x3e

I'm not sure if some of these details are needed. The name ("gfx") and 
overlay_id refer to the same thing, and while idx is in theory a 
different value, in practice it's always the same as overlay_id. And 
even if it was a different number, I think idx is kind of irrelevant, 
isn't it?

caps can be figured out from the name of the overlay, but perhaps it 
doesn't hurt to print them here. Then again, if none of the other debug 
prints show the cap values (e.g. "requires cap 0x4), maybe printing the 
caps value is not really useful here.

Maybe this could be just a single line, say:

overlay=gfx

or if caps is useful:

overlay=gfx (caps=0x3e)

What do you think?

  Tomi
