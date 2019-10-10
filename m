Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B05D0D20F1
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 08:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbfJJGra (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Oct 2019 02:47:30 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:54836 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbfJJGra (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Oct 2019 02:47:30 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9A6lOu2076120;
        Thu, 10 Oct 2019 01:47:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570690044;
        bh=2NGrdRhVIoqIsmWEZIYwhT9Oqhp/c16vKGI/TuQoJAk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=MHjM9V635XgecZ6pTSWcyFvBfSrZfsO3ksWR3bnCyHHYSIVYfbzXbqML+Tht7hJYj
         Dnv0aYwVVQEs6iIs03/AlZV+n0Y+jGKudkZMRUIYs2K+3fUBn81YxRe3UnTIvivSPz
         yt5zjLJdxbqD4qtdWeckthFxr8AHJvzhV1dFBsmA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9A6lOeF121766
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 10 Oct 2019 01:47:24 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 01:47:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 01:47:23 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9A6lM6R097714;
        Thu, 10 Oct 2019 01:47:22 -0500
Subject: Re: [PATCHv2 7/7] drm/omap: hdmi4: fix use of uninitialized var
To:     Tony Lindgren <tony@atomide.com>
CC:     <dri-devel@lists.freedesktop.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jyri Sarha <jsarha@ti.com>, <linux-omap@vger.kernel.org>
References: <20190930103840.18970-1-tomi.valkeinen@ti.com>
 <20190930103840.18970-8-tomi.valkeinen@ti.com>
 <20191008141335.GB5610@atomide.com>
 <ffb498fb-5041-d3e9-2702-879f3d389adf@ti.com>
 <20191008142153.GD5610@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <59381248-5ded-7ea9-40a6-cbfb58a3c5b1@ti.com>
Date:   Thu, 10 Oct 2019 09:47:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191008142153.GD5610@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 08/10/2019 17:21, Tony Lindgren wrote:
> * Tomi Valkeinen <tomi.valkeinen@ti.com> [191008 14:17]:
>> On 08/10/2019 17:13, Tony Lindgren wrote:
>>> * Tomi Valkeinen <tomi.valkeinen@ti.com> [190930 10:38]:
>>>> If use_mclk is false, mclk_mode is written to a register without
>>>> initialization. This doesn't cause any ill effects as the written value
>>>> is not used when use_mclk is false.
>>>>
>>>> To fix this, write use_mclk only when use_mclk is true.
>>>
>>> Hey nice catch. Based on a quick test looks like this fixes an
>>> issue where power consumption stays higher after using HDMI.
>>>
>>> Would be nice to have merged in the v5.4-rc series:
>>>
>>> Tested-by: Tony Lindgren <tony@atomide.com>
>>
>> Really? Ok, well, then it was a good random find =).
> 
> Yeah so it seems :) Earlier I thought there's still some
> clkctrl setting wrong after using HDMI, but did not see
> anything diffing the clkctrl registers before and after
> and gave up.
> 
>> I did already push this to drm-misc-next, as I thought it does not have any
>> real effect. I'll check if it's ok to push to drm-misc-fixes too, with Cc
>> stable.
> 
> OK great thanks.

Pushing this to fixes too would cause conflicts, so we shouldn't push 
without good reason. How much power saving you see?

I think this can still be sent to stable later, after it has been merged 
to mainline.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
