Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A46643C80E
	for <lists+linux-omap@lfdr.de>; Wed, 27 Oct 2021 12:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236399AbhJ0Kwd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Oct 2021 06:52:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236103AbhJ0Kwd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Oct 2021 06:52:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8E15C061570;
        Wed, 27 Oct 2021 03:50:07 -0700 (PDT)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 75548596;
        Wed, 27 Oct 2021 12:50:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1635331803;
        bh=aDpMfGkY/pVbewju2AuvzED9MYgdhbzFcPl/WwUDvjE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=pzf4vD1kSgwnc51Vkhp8FvzNLNBMg2G//VeSsWf+x5krxUO+36z2wcpy1Pj9GkQPb
         9hITUfTMWHyD6e+7vpGPTZGB36/zdXyQrYcwyNSOaRt9LHt2eOF4FjBPiurvQpU1ao
         ko7naKvI9Z2o7ZVhNmSrH4Bu8DAA1WbyMyf6Bo3c=
Subject: Re: [PATCH v6 4/9] drm/omap: introduce omap_hw_overlay
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Benoit Parrot <bparrot@ti.com>
References: <20211018142842.2511200-1-narmstrong@baylibre.com>
 <20211018142842.2511200-5-narmstrong@baylibre.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <e2b8e8c4-a2d3-532c-7ee8-5b609bb4cb5f@ideasonboard.com>
Date:   Wed, 27 Oct 2021 13:50:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211018142842.2511200-5-narmstrong@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 18/10/2021 17:28, Neil Armstrong wrote:
> From: Benoit Parrot <bparrot@ti.com>
> 
> Split out the hardware overlay specifics from omap_plane.
> To start, the hw overlays are statically assigned to planes.
> 
> The goal is to eventually assign hw overlays dynamically to planes
> during plane->atomic_check() based on requested caps (scaling, YUV,
> etc). And then perform hw overlay re-assignment if required.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>   drivers/gpu/drm/omapdrm/Makefile       |  1 +
>   drivers/gpu/drm/omapdrm/omap_drv.c     |  9 ++-
>   drivers/gpu/drm/omapdrm/omap_drv.h     |  4 ++
>   drivers/gpu/drm/omapdrm/omap_overlay.c | 84 ++++++++++++++++++++++++++
>   drivers/gpu/drm/omapdrm/omap_overlay.h | 30 +++++++++
>   drivers/gpu/drm/omapdrm/omap_plane.c   | 54 +++++++----------
>   6 files changed, 148 insertions(+), 34 deletions(-)
>   create mode 100644 drivers/gpu/drm/omapdrm/omap_overlay.c
>   create mode 100644 drivers/gpu/drm/omapdrm/omap_overlay.h

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi
