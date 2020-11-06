Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFEB72A9806
	for <lists+linux-omap@lfdr.de>; Fri,  6 Nov 2020 16:05:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727395AbgKFPFE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Nov 2020 10:05:04 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:52690 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727020AbgKFPFD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 6 Nov 2020 10:05:03 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A6F4rfp019628;
        Fri, 6 Nov 2020 09:04:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604675093;
        bh=jf86HsFnU6JIjZtdf2WrYxGr0whj/xpzr7Vn5BqWcqg=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=dcWGtlHuCcbQa/HUmf/5X78AgB+o242uO/G7z6SS51tP5bwUrGVPcqx4aFvvQ2dUc
         Tz+0pCKS3+/FjSLc4K+ss4vwLr5cr7iDFtIyrBqzlUPN0rnPLTVTzG62Wy4TG0a+vu
         +WsvFadFo1wa5gFHPg6tpJfCb8dXgqlYQ3S+63BI=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A6F4rDG068077
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 6 Nov 2020 09:04:53 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 6 Nov
 2020 09:04:53 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 6 Nov 2020 09:04:53 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A6F4pm1120342;
        Fri, 6 Nov 2020 09:04:51 -0600
Subject: Re: [PATCH v3 00/56] Convert DSI code to use drm_mipi_dsi and
 drm_panel
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
CC:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <61C04176-4654-4D2D-A55B-31FBB6D2E5AA@goldelico.com>
 <fcbc8488-5861-8e51-0f86-1ed6498083f7@ti.com>
 <579243AA-014A-411B-9014-F5846C9B8137@goldelico.com>
 <ab33baff-dd8c-2ee0-6f89-35aa4df7b9cf@ti.com>
 <837EA533-9946-43B3-B058-69060EC43981@goldelico.com>
 <08589e51-f5e6-2743-57ec-8ac509f97ff0@ti.com>
Message-ID: <1f1afce4-c822-0fbf-1ce3-dda0064b65c6@ti.com>
Date:   Fri, 6 Nov 2020 17:04:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <08589e51-f5e6-2743-57ec-8ac509f97ff0@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 06/11/2020 16:37, Tomi Valkeinen wrote:
> On 05/11/2020 20:56, H. Nikolaus Schaller wrote:
>>
>>> Am 05.11.2020 um 19:28 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
>>>
>>> On 05/11/2020 20:14, H. Nikolaus Schaller wrote:
>>>>
>>>>> Am 05.11.2020 um 18:36 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
>>>>>
>>>>> Hi,
>>>>>
>>>>> On 05/11/2020 19:15, H. Nikolaus Schaller wrote:
>>>>>
>>>>>> Next, I migrated my long waiting mipi_dsi/drm_panel driver conversion for
>>>>>> the panel of the Pyra handheld (omap 5 based) to compile on 5.10-rc2. And
>>>>>> I followed the latest existing panel-orisetech-otm8009a.c which uses a
>>>>>> similar video mode controller and mipi-dsi.
>>>>>>
>>>>>> That one seems to be used by arch/arm/boot/dts/stm32f469-disco.dts.
>>>>>>
>>>>>> Unfortunately my panel driver is not even loaded by drm/omap so I can't
>>>>>> debug. Does this set of drm/omap drivers need a modification of the device
>>>>>> tree? If yes, which one?
>>>>>
>>>>> omapdrm doesn't load the panel drivers. If not even your panel's probe is called, then it hints at
>>>>> DT and/or driver's compatible string issue. The panel's probe should get called even if omapdrm is
>>>>> not loaded at all.
>>>>
>>>> Well, I use the same device tree that loads the old driver...
>>>
>>> Yeah, I was mistaken above. With DSI the panel (may be) a child of the DSI host, so it will affect.
>>>
>>> Can you give pointers to the panel driver source and relevant dts files? BOE BTL507212-W677L?
>>
>> Yes. It is (now) 
>>
>> drivers/gpu/drm/panel/panel-boe-btl507212-w677l.c
>>
>> and
>>
>> arch/arm/boot/dts/omap5-letux-cortex15-common.dtsi (for the basic dsi definitions)
>> arch/arm/boot/dts/pyra-display.dtsi (for the specific display)
>>
>> All this is merged by some arch/arm/boot/dts/omap5-letux-cortex15-v5.3+pyra-v5.2.dts
> 
> I took the driver and make my omap4-sdp dts to use it. It probes for me, but stop after that:
> 
> [  119.346374] omapdss_dss 58000000.dss: supply vdda_video not found, using dummy regulator
> [  119.358398] DSS: OMAP DSS rev 4.0
> [  119.680053] panel-dsi-cm 58004000.encoder.0: failed to get video timing, using defaults
> [  119.695709] panel-dsi-cm 58004000.encoder.0: supply vpnl not found, using dummy regulator
> [  119.711242] panel-dsi-cm 58004000.encoder.0: supply vddi not found, using dummy regulator
> [  119.769470] panel-btl507212-w677l 58005000.encoder.0: w677l_probe
> [  119.779388] panel-btl507212-w677l 58005000.encoder.0: w677l_probe ok
> [  119.846679] omapdss_dss 58000000.dss: bound 58001000.dispc (ops dispc_component_ops [omapdrm])
> [  119.858673] omapdss_dss 58000000.dss: bound 58004000.encoder (ops dsi_component_ops [omapdrm])
> [  119.882629] omapdss_dss 58000000.dss: bound 58005000.encoder (ops dsi_component_ops [omapdrm])
> [  119.902069] omapdss_dss 58000000.dss: bound 58006000.encoder (ops hdmi4_component_ops [omapdrm])
> [  119.962066] dmm 4e000000.dmm: initialized all PAT entries
> [  120.014770] panel-btl507212-w677l 58005000.encoder.0: w677l_get_modes
> 
> I didn't debug yet where it's hanging. So you're not even getting the probe?

Oh, it's stuck in a loop trying to calculate suitable timings. It doesn't find it, as I'm running on
omap4, with just 2 datalanes instead of 4 which the panel needs. Looks like the code could use some
improvement there.

Anyway, possibly on omap5 it goes fine.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
