Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCA612C423
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2019 12:19:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbfE1KT1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 May 2019 06:19:27 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33256 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbfE1KT1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 May 2019 06:19:27 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4SAJ5Ak021461;
        Tue, 28 May 2019 05:19:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559038745;
        bh=zQamKnGEmQhWoSzRt42BHFoPsQGnR1ArVAvOV1yOmwI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=uJg88Y68pZASvJpleiZ4FWK9XAkk599Oue1bBGBOwU6vKG6K6M30HzSptXIHpcEJD
         WfX0Fvhat7IZpYk1ATIpBzYJqihfJWV1cdWsf1qovDLyCyw327yKwnLE7riLJ1sJKM
         X77XxVmYmameXBoWtskWxMg3kCLYGtMTCuAoBHls=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4SAJ5JQ048867
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 28 May 2019 05:19:05 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 05:19:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 05:19:04 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4SAJ24o016075;
        Tue, 28 May 2019 05:19:02 -0500
Subject: Re: [PATCHv6 3/4] drm/omap: add framedone interrupt support
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Tony Lindgren <tony@atomide.com>, Pavel Machek <pavel@ucw.cz>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        <dri-devel@lists.freedesktop.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@collabora.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
 <20190523200756.25314-4-sebastian.reichel@collabora.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <9eb23a5d-438e-7b25-e7cb-8b734a150e43@ti.com>
Date:   Tue, 28 May 2019 13:19:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523200756.25314-4-sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sebastian,

On 23/05/2019 23:07, Sebastian Reichel wrote:

> @@ -302,6 +328,30 @@ void omap_crtc_vblank_irq(struct drm_crtc *crtc)
>   	DBG("%s: apply done", omap_crtc->name);
>   }
>   
> +void omap_crtc_framedone_irq(struct drm_crtc *crtc, uint32_t irqstatus)
> +{
> +	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
> +
> +	if (!omap_crtc->framedone_handler) {
> +		dev_warn(omap_crtc->base.dev->dev, "no framedone handler?");
> +		return;
> +	}

This triggers on normal displays.

FRAMEDONE is an interrupt we get when DISPC's output videoport is being 
turned off. It's raised after the last frame has been finished (i.e. the 
DISPC is truly done with that videoport).

We get it for both conventional displays (when the display is turned 
off) and for DSI command mode (when a single frame has been sent), as in 
both cases the videoport is disabled after the operation. For 
conventional displays, you can think FRAMEDONE as the last vsync.

We also have special handling for FRAMEDONE in omap_crtc_set_enabled(), 
which is used to get the drm driver to wait for FRAMEDONE when disabling 
the display. I wonder if this separate framedone handling might somehow 
conflict with that code. And/or should these be somehow combined.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
