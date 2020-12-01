Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 664562C93ED
	for <lists+linux-omap@lfdr.de>; Tue,  1 Dec 2020 01:29:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbgLAA2b (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Nov 2020 19:28:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbgLAA2b (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Nov 2020 19:28:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBFFCC0613CF
        for <linux-omap@vger.kernel.org>; Mon, 30 Nov 2020 16:27:50 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 369A245D;
        Tue,  1 Dec 2020 01:27:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606782469;
        bh=syhNt4kCoLazCymjdAxotM6Lqo0Sbi0tVC8ody0LlU8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MqXPzieUkm2MnGj5BMyKeQrnkquFfCMpf703QJCeCZnl5fnNg1mMQK6DxM1l9IWej
         iUB4/vQJAUVY60tlFoB3GzvxxxtmLSfzaarYQP/fT2OyDuSYTjNtRX9T+I3T+NzIis
         F7p8GPTYokz8DgI0XrkgEusqQQJ4dZIQMup9H+l0=
Date:   Tue, 1 Dec 2020 02:27:40 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com
Subject: Re: [PATCH v4 70/80] drm/panel: panel-dsi-cm: drop unneeded includes
Message-ID: <20201201002740.GO25713@pendragon.ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-71-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-71-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Nov 24, 2020 at 02:45:28PM +0200, Tomi Valkeinen wrote:
> Drop unneeded includes.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/panel/panel-dsi-cm.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
> index ec87b785871f..91ed8237a1c2 100644
> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> @@ -9,12 +9,7 @@
>  #include <linux/backlight.h>
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
> -#include <linux/interrupt.h>

This could go to the patch that moves TE handling to the code.

>  #include <linux/jiffies.h>
> -#include <linux/module.h>

I'd keep module.h as you use macros it defines, and we shouldn't depend
in indirect includes.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> -#include <linux/sched/signal.h>
> -#include <linux/slab.h>
> -#include <linux/of_device.h>
>  #include <linux/regulator/consumer.h>
>  
>  #include <drm/drm_connector.h>

-- 
Regards,

Laurent Pinchart
