Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9554CDBCA
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 08:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727256AbfJGGNj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 02:13:39 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:54918 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbfJGGNj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Oct 2019 02:13:39 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x976DQ4f064153;
        Mon, 7 Oct 2019 01:13:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570428806;
        bh=sGCWRnpUHNtSpha8n3OkkeFYJDB/yK1x0XFHBz/Hs4Q=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=JpOZs2avjMIEaFZoTGiLI+3ZOfCSYbsAosFzugT8hOiUoEevHo/FoiNkviXjrzEj1
         m4bGZ8JWb2dhTXIalsfpZvfEWByVUGBP/eeCN7qIXBgz6sMa/yZQz78qFsy+IEdwv8
         h50Yzwdg1VC/LQmI/XwdodNYO4jvBqr7QhnXI/Ic=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x976DQ5Z114175
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Oct 2019 01:13:26 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 01:13:23 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 01:13:25 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x976DOKo040325;
        Mon, 7 Oct 2019 01:13:24 -0500
Subject: Re: [PATCH] ARM: omap2plus_defconfig: Fix selected panels after
 generic panel changes
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Jyri Sarha <jsarha@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20191003165539.50318-1-tony@atomide.com>
 <03ca02c1-2816-17cd-03fd-5b72e5d0ec96@ti.com>
 <20191004155426.GM5610@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <21f98050-4eb1-e709-387f-164fb420deaf@ti.com>
Date:   Mon, 7 Oct 2019 09:13:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191004155426.GM5610@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 04/10/2019 18:54, Tony Lindgren wrote:
> * Tomi Valkeinen <tomi.valkeinen@ti.com> [191004 08:42]:
>> On 03/10/2019 19:55, Tony Lindgren wrote:
>>> The old omapdrm panels got removed for v5.4 in favor of generic panels,
>>> and the Kconfig options changed. Let's update omap2plus_defconfig
>>> accordingly so the same panels are still enabled.
>>>
>>> Cc: Jyri Sarha <jsarha@ti.com>
>>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
>>> Signed-off-by: Tony Lindgren <tony@atomide.com>
>>> ---
>>>    arch/arm/configs/omap2plus_defconfig | 12 ++++++------
>>>    1 file changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
>>> --- a/arch/arm/configs/omap2plus_defconfig
>>> +++ b/arch/arm/configs/omap2plus_defconfig
>>> @@ -356,14 +356,14 @@ CONFIG_DRM_OMAP_CONNECTOR_HDMI=m
>>>    CONFIG_DRM_OMAP_CONNECTOR_ANALOG_TV=m
>>>    CONFIG_DRM_OMAP_PANEL_DPI=m
>>>    CONFIG_DRM_OMAP_PANEL_DSI_CM=m
>>> -CONFIG_DRM_OMAP_PANEL_SONY_ACX565AKM=m
>>> -CONFIG_DRM_OMAP_PANEL_LGPHILIPS_LB035Q02=m
>>> -CONFIG_DRM_OMAP_PANEL_SHARP_LS037V7DW01=m
>>> -CONFIG_DRM_OMAP_PANEL_TPO_TD028TTEC1=m
>>> -CONFIG_DRM_OMAP_PANEL_TPO_TD043MTEA1=m
>>> -CONFIG_DRM_OMAP_PANEL_NEC_NL8048HL11=m
>>>    CONFIG_DRM_TILCDC=m
>>>    CONFIG_DRM_PANEL_SIMPLE=m
>>> +CONFIG_DRM_PANEL_LG_LB035Q02=m
>>> +CONFIG_DRM_PANEL_NEC_NL8048HL11=m
>>> +CONFIG_DRM_PANEL_SHARP_LS037V7DW01=m
>>> +CONFIG_DRM_PANEL_SONY_ACX565AKM=m
>>> +CONFIG_DRM_PANEL_TPO_TD028TTEC1=m
>>> +CONFIG_DRM_PANEL_TPO_TD043MTEA1=m
>>>    CONFIG_FB=y
>>>    CONFIG_FIRMWARE_EDID=y
>>>    CONFIG_FB_MODE_HELPERS=y
>>
>> Sorry, I didn't remember to update these. Some additions:
>>
>> These can be dropped, they no longer exist:
>>
>> CONFIG_DRM_OMAP_ENCODER_TFP410=m
>> CONFIG_DRM_OMAP_CONNECTOR_DVI=m
>> CONFIG_DRM_OMAP_PANEL_DPI=m
>>
>> This can be added to get the DVI output working on many of the boards:
>>
>> CONFIG_DRM_TI_TFP410=m
> 
> We have patches already posted for these by Adam and me so we
> should be good to go with just $subject patch missing now.

Ok.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
