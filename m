Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAC70158C4C
	for <lists+linux-omap@lfdr.de>; Tue, 11 Feb 2020 11:01:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728090AbgBKKBn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Feb 2020 05:01:43 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:42994 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728083AbgBKKBn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Feb 2020 05:01:43 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01BA1YBq032540;
        Tue, 11 Feb 2020 04:01:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1581415294;
        bh=+ZcF4yo1eln9KhwQy1Qd6OUQAx//vdRlxtfqM27rgaU=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=sUIBpp2WaQwT6eNvNRlhL4gP6jnNvR8/vq23Q0q84jJwFfnuAEe8u8YpqIdceX2X8
         Bq0xIvCpURcVRDx5Qah8Xi9gE+IBZ+3PL4C/yGY2LVxE8LL+0JHht42DeVRuaAWcIR
         IdSy+AmSU0CrFYUJaZZXWCCVWZIrLWP6mO0iqnLY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01BA1YZG119993;
        Tue, 11 Feb 2020 04:01:34 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 11
 Feb 2020 04:01:33 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 11 Feb 2020 04:01:33 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01BA1VLH127621;
        Tue, 11 Feb 2020 04:01:32 -0600
Subject: Re: [PATCH 2/3] ARM: dts: am437x-gp/epos-evm: drop unused panel
 timings
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
CC:     <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jyri Sarha <jsarha@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
 <20191114093950.4101-3-tomi.valkeinen@ti.com>
 <20191202130459.GH4929@pendragon.ideasonboard.com>
 <20191211165331.GC43123@atomide.com>
 <45dae8f7-2f5e-6948-5a05-dc8a09ace1fa@ti.com>
 <20191212203550.GB4892@pendragon.ideasonboard.com>
 <add3d8af-6977-68e6-fb77-2fa748c4714a@ti.com>
Message-ID: <b39e52f1-3e73-5f26-6206-0956cf482631@ti.com>
Date:   Tue, 11 Feb 2020 12:01:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <add3d8af-6977-68e6-fb77-2fa748c4714a@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 13/01/2020 14:01, Tomi Valkeinen wrote:
> On 12/12/2019 22:35, Laurent Pinchart wrote:
>> Hi Tomi,
>>
>> On Thu, Dec 12, 2019 at 11:37:51AM +0200, Tomi Valkeinen wrote:
>>> On 11/12/2019 18:53, Tony Lindgren wrote:
>>>> * Laurent Pinchart <laurent.pinchart@ideasonboard.com> [191202 13:05]:
>>>>> Hi Tomi,
>>>>>
>>>>> Thank you for the patch.
>>>>>
>>>>> On Thu, Nov 14, 2019 at 11:39:49AM +0200, Tomi Valkeinen wrote:
>>>>>> panel-simple now handled panel osd070t1718-19ts, and we no longer need
>>>>>> the panel timings in the DT file. So remove them.
>>>>>
>>>>> Should you in that case drop the panel-dpi compatible string too, as the
>>>>> panel-dpi bindings require panel timings in DT ?
>>>>
>>>> Yeah sounds like if panel-dpi is no longer usable for this device it
>>>> should be dropped from the compatible list.
>>>
>>> Ok, I agree.
>>>
>>> Looking at the dts files, panel-dpi is used in a bunch of boards. But
>>> we even have 3 dts files with panel-dpi, without the detailed panel
>>> model in compatible...
>>>
>>> Fixing those will break the compatibility with old dtbs and new
>>> kernel, unless we add timings-from-dt to a panel driver that handles
>>> panel-dpi.
>>
>> I know, and I don't have a perfect answer for this :-( I don't see a
>> third option, it's either breaking DT backward compatibility or adding
>> timings parsing to a panel driver (either a new panel-dpi driver or to
>> panel-simple). What's your preferred option ?
> 
> Hmm, I just realized that changing these will break omapfb. It relies on panel-dpi and timings from 
> DT...

If no one objects, I think we should just drop the timings from the .dts, and say that these boards 
are no longer supported with omapfb. I don't think there's much point in trying to keep omapfb 
working fine for boards that are fully supported by omapdrm.

Hopefully soon (in five years? =) we can say that omapdrm supports all the boards, and we can 
deprecate omapfb.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
