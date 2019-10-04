Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEA58CB693
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2019 10:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbfJDImS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Oct 2019 04:42:18 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:42756 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbfJDImS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Oct 2019 04:42:18 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x948g1lt013759;
        Fri, 4 Oct 2019 03:42:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570178521;
        bh=7GfWdysTbWv4kzHlurdLL/jJt+BcoAZEb2L+lCANjKQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Eo83z6zEo4/5fQjemH9UPOAnk0HJZNEc1ZFz7fTJEDd0g+/ydf0W9ZaNIjMGs+oeR
         nmqbmyrumdUQQwLwAYJl/VhHWEVd8UI0xV2gjTyI5afBtc31Ah9SiBJeKQP9SQEg8Y
         kaJ923DN5LObBPzNIAsEmGjy5P4LFx1C+RWvsD/k=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x948g1eP116713
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 4 Oct 2019 03:42:01 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 4 Oct
 2019 03:42:00 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 4 Oct 2019 03:42:00 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x948fxMO032434;
        Fri, 4 Oct 2019 03:41:59 -0500
Subject: Re: [PATCH] ARM: omap2plus_defconfig: Fix selected panels after
 generic panel changes
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>, Jyri Sarha <jsarha@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20191003165539.50318-1-tony@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <03ca02c1-2816-17cd-03fd-5b72e5d0ec96@ti.com>
Date:   Fri, 4 Oct 2019 11:41:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003165539.50318-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 03/10/2019 19:55, Tony Lindgren wrote:
> The old omapdrm panels got removed for v5.4 in favor of generic panels,
> and the Kconfig options changed. Let's update omap2plus_defconfig
> accordingly so the same panels are still enabled.
> 
> Cc: Jyri Sarha <jsarha@ti.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>   arch/arm/configs/omap2plus_defconfig | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
> --- a/arch/arm/configs/omap2plus_defconfig
> +++ b/arch/arm/configs/omap2plus_defconfig
> @@ -356,14 +356,14 @@ CONFIG_DRM_OMAP_CONNECTOR_HDMI=m
>   CONFIG_DRM_OMAP_CONNECTOR_ANALOG_TV=m
>   CONFIG_DRM_OMAP_PANEL_DPI=m
>   CONFIG_DRM_OMAP_PANEL_DSI_CM=m
> -CONFIG_DRM_OMAP_PANEL_SONY_ACX565AKM=m
> -CONFIG_DRM_OMAP_PANEL_LGPHILIPS_LB035Q02=m
> -CONFIG_DRM_OMAP_PANEL_SHARP_LS037V7DW01=m
> -CONFIG_DRM_OMAP_PANEL_TPO_TD028TTEC1=m
> -CONFIG_DRM_OMAP_PANEL_TPO_TD043MTEA1=m
> -CONFIG_DRM_OMAP_PANEL_NEC_NL8048HL11=m
>   CONFIG_DRM_TILCDC=m
>   CONFIG_DRM_PANEL_SIMPLE=m
> +CONFIG_DRM_PANEL_LG_LB035Q02=m
> +CONFIG_DRM_PANEL_NEC_NL8048HL11=m
> +CONFIG_DRM_PANEL_SHARP_LS037V7DW01=m
> +CONFIG_DRM_PANEL_SONY_ACX565AKM=m
> +CONFIG_DRM_PANEL_TPO_TD028TTEC1=m
> +CONFIG_DRM_PANEL_TPO_TD043MTEA1=m
>   CONFIG_FB=y
>   CONFIG_FIRMWARE_EDID=y
>   CONFIG_FB_MODE_HELPERS=y

Sorry, I didn't remember to update these. Some additions:

These can be dropped, they no longer exist:

CONFIG_DRM_OMAP_ENCODER_TFP410=m
CONFIG_DRM_OMAP_CONNECTOR_DVI=m
CONFIG_DRM_OMAP_PANEL_DPI=m

This can be added to get the DVI output working on many of the boards:

CONFIG_DRM_TI_TFP410=m

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
