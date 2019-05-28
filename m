Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58DB92C387
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2019 11:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbfE1JvW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 May 2019 05:51:22 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:45264 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbfE1JvW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 May 2019 05:51:22 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4S9p58l053355;
        Tue, 28 May 2019 04:51:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559037065;
        bh=PQt/Rzo/FGP3unzgA/uX2Tft86m2alMfQ36IpVx/LMk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=vGhSdFa2YECyQm1z0I4zNBHdXJ9D5z/mma4thhaJvkLMF4zaPiAZynl5OEdXSyZht
         YIiF1Dif/7Dqu7JMKNsl8TS6NRa0l/xpDnqtCVTeNuyyySqG3zqzyJcGf0xGGS9MTT
         Z8jsuoAFCjehPvPcBeWMFSGLbwZ25/8kJgqbOEEo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4S9p5Zg111430
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 28 May 2019 04:51:05 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 04:51:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 04:51:04 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4S9p1dU109124;
        Tue, 28 May 2019 04:51:01 -0500
Subject: Re: [PATCHv6 0/4] omapdrm: DSI command mode panel support
To:     Tony Lindgren <tony@atomide.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
CC:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        <dri-devel@lists.freedesktop.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@collabora.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
 <60c45d23-de2f-d94a-c3d7-146a2bee538f@ti.com>
 <20190527112122.GJ5447@atomide.com>
 <e507c415-38de-86fe-9265-4b0aed0d7224@ti.com>
 <20190528093952.GM5447@atomide.com>
From:   Keerthy <j-keerthy@ti.com>
Message-ID: <00eb938e-00be-0601-8a60-9736fa5eeb5c@ti.com>
Date:   Tue, 28 May 2019 15:21:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528093952.GM5447@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 28/05/19 3:09 PM, Tony Lindgren wrote:
> Hi,
> 
> * Tomi Valkeinen <tomi.valkeinen@ti.com> [190528 09:19]:
>> On 27/05/2019 14:21, Tony Lindgren wrote:
>>
>>>> Looks good to me. For some reason I can't boot 5.2-rc2 (on x15) so I haven't
>>>> been able to test yet. I'll pick the series up in any case, and I'll test it
>>>> when I get the kernel booting.
>>>
>>> Great good to have these merged finally :)
>>>
>>> Hmm I wonder if some x15 models are affected by the SoC variant
>>> changes queued in my fixes branch?
>>
>> This is what I see with earlycon, on linux-omap fixes branch. I think this looks
>> similar to what I saw with dra76 _without_ the fixes.
> 
> OK sounds like we need to use some different SoC specific .dtsi file,
> is this maybe x15 rev c?
> 
> You can detect which modules fail based on the module base address
> for revision register seen with the following debug patch. Then
> those need to be tagged with status = "disabled" at the module
> level in the SoC specific dtsi file.


Tomi,

My first suspect would be rtc.

diff --git a/arch/arm/boot/dts/am5728.dtsi b/arch/arm/boot/dts/am5728.dtsi
index 82e5427ef6a9..17b1b1b4db92 100644
--- a/arch/arm/boot/dts/am5728.dtsi
+++ b/arch/arm/boot/dts/am5728.dtsi
@@ -31,3 +31,7 @@
  &atl_tm {
         status = "disabled";
  };
+
+&rtctarget {
+       status = "disabled";
+};

Regards,
Keerthy
> 
> Regards,
> 
> Tony
> 
> 8< --------------
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -2069,6 +2069,8 @@ static int sysc_probe(struct platform_device *pdev)
>   	struct sysc *ddata;
>   	int error;
>   
> +	dev_info(&pdev->dev, "probing device\n");
> +
>   	ddata = devm_kzalloc(&pdev->dev, sizeof(*ddata), GFP_KERNEL);
>   	if (!ddata)
>   		return -ENOMEM;
> 
