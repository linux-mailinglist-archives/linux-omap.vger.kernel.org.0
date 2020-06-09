Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 634B81F349C
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jun 2020 09:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727082AbgFIHEZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Jun 2020 03:04:25 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:42830 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727076AbgFIHEY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 9 Jun 2020 03:04:24 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0597494t105938;
        Tue, 9 Jun 2020 02:04:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1591686249;
        bh=fVvPM3xAR1d/mI/5VFPWF9ZaRjF/LtwDr0yUg7t492w=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ogjPKNNgmCd0Ex9DVbi+OV1kdGVTdN8OzqjXYMNJbe6ej4+Jdkr66KKa9U2L6i40E
         JfA+SHKdcBwGBRy5wCJCmwv1ylI3V1x28JKTU5ftPEakySJTwq/JQDh3rOa4Vlkvvv
         dTqZ2/M8Kp17h3VmCWCO2KYWrD0l7cgoFZ8BK1ug=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 059748nd106696
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 9 Jun 2020 02:04:08 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 9 Jun
 2020 02:04:07 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 9 Jun 2020 02:04:08 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 059744Ia077724;
        Tue, 9 Jun 2020 02:04:04 -0500
Subject: Re: [PATCH 1/5] drm/omap: Fix suspend resume regression after
 platform data removal
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, "Andrew F . Davis" <afd@ti.com>,
        Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <dri-devel@lists.freedesktop.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200531193941.13179-1-tony@atomide.com>
 <20200531193941.13179-2-tony@atomide.com>
 <16ba1808-5c7f-573d-8dd0-c80cac2f476e@ti.com>
 <20200603140639.GG37466@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <47e286dd-f87a-4440-5bde-1f7b53e8b672@ti.com>
Date:   Tue, 9 Jun 2020 10:04:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200603140639.GG37466@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 03/06/2020 17:06, Tony Lindgren wrote:
> * Tomi Valkeinen <tomi.valkeinen@ti.com> [200603 12:34]:
>> Hi Tony,
>>
>> On 31/05/2020 22:39, Tony Lindgren wrote:
>>> When booting without legacy platform data, we no longer have omap_device
>>> calling PM runtime suspend for us on suspend. This causes the driver
>>> context not be saved as we have no suspend and resume functions defined.
>>>
>>> Let's fix the issue by switching over to use UNIVERSAL_DEV_PM_OPS as it
>>> will call the existing PM runtime suspend functions on suspend.
>>
>> I don't think we can use UNIVERSAL_DEV_PM_OPS, as we can't disable DSS
>> modules in any order, but things have to be shut down in orderly manner.
> 
> OK. I presume you talk about the order of dss child devices here.

Yes, but not only that.

E.g. the dispc driver hasn't been designed to be suspended while active. The only way to properly 
suspend the dispc HW is to first disable the outputs, wait until they've finished with their current 
frame, and only then can things be shut down.

The suspend machinery doesn't handle all that (and it couldn't anyway, due to the dependencies to 
other DSS devices in the pipeline).

>> omapdrm hasn't relied on omap_device calling runtime suspend for us (I
>> didn't know it does that). We have system suspend hooks in omap_drv.c:
> 
> We had omap_device sort of brute forcing things to idle on suspend
> which only really works for interconnect target modules with one
> device in them.
> 
>> SIMPLE_DEV_PM_OPS(omapdrm_pm_ops, omap_drm_suspend, omap_drm_resume)
>>
>> omap_drm_suspend() is supposed to turn off the displays, which then cause
>> dispc_runtime_put (and other runtime_puts) to be called, which result in
>> dispc_runtime_suspend (and other runtime PM suspends).
> 
> OK thanks for explaining, I missed that part.
> 
>> So... For some reason that's no longer happening? I need to try to find a
>> board with which suspend/resume works (without DSS)...
> 
> Yes it seems something has changed. When diffing the dmesg debug output
> on suspend and resume, context save and restore functions are no longer
> called as the PM runtime suspend and resume functions are no longer
> called on suspend and resume.

I now tested with AM4 SK, and I still can't get system suspend/resume work (without DSS). I have no 
clue about how to fix that. But if I use pm_test to prevent total suspend, I can reproduce this (or 
at least looks the same).

And now that I look at this, I have a recollection that I've seen this before. What happens is that 
the system suspend hook (omap_drm_suspend) gets called fine, and it turns off the displays, which 
leads to dispc_runtime_puts etc. All goes fine.

But there's an extra runtime PM reference (dev.power.usage_count) that seems to come out of nowhere. 
So when omap_drm_suspend is finished, there's still usage_count of 1, and dispc never suspends fully.

I think the PM framework does this when starting system suspend process. Maybe this was also 
happening earlier, but omap_device used to do the final suspend (so omapdrm depended on that 
functionality, after all...).

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
