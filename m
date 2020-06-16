Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 218EB1FBC31
	for <lists+linux-omap@lfdr.de>; Tue, 16 Jun 2020 18:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729578AbgFPQ5R (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Jun 2020 12:57:17 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:58050 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728861AbgFPQ5R (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 16 Jun 2020 12:57:17 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05GGv4c5039757;
        Tue, 16 Jun 2020 11:57:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592326624;
        bh=5SNJOnx/JOfRnrAoSOCyZsNKVPe0vOboLu2yYA8Qo+g=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=p7Di1GMM11digdmvF0BR+ZWyhf2oS8veOe9hLPwIC443TStcKogKOcDElHepmLxDs
         X80+pB0bLhqVfDFcgPlnHehgK2MOwQXu+aeb9HssxCD4mSb2uyp+eVTNt0w/W6z9bX
         4bsapM7NawXR5nmJoTuYU1Xv2smugOwMEg/P49oI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05GGv44v029523;
        Tue, 16 Jun 2020 11:57:04 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 16
 Jun 2020 11:57:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 16 Jun 2020 11:57:03 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05GGuwQT087296;
        Tue, 16 Jun 2020 11:56:59 -0500
Subject: Re: [PATCH 1/5] drm/omap: Fix suspend resume regression after
 platform data removal
To:     Tony Lindgren <tony@atomide.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
CC:     <linux-omap@vger.kernel.org>, "Andrew F . Davis" <afd@ti.com>,
        Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
 <47e286dd-f87a-4440-5bde-1f7b53e8b672@ti.com>
 <20200609151943.GL37466@atomide.com>
 <9ed70121-2a53-d2b3-051a-88eb83e6c53f@ti.com>
 <d03dd04f-6f2c-25ba-fe1f-d5fc0dfb5c68@ti.com>
 <592501c9-2d94-b266-ae76-e383d3bffa29@ti.com>
 <20200616153042.GZ37466@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <3f2855cc-48b8-ecb8-5d92-beeabe344b26@ti.com>
Date:   Tue, 16 Jun 2020 19:56:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616153042.GZ37466@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 16/06/2020 18:30, Tony Lindgren wrote:
> * Tomi Valkeinen <tomi.valkeinen@ti.com> [200616 13:02]:
>> On 11/06/2020 17:00, Grygorii Strashko wrote:
>>> I think, suspend might be fixed if all devices, which are now child of ti-sysc, will do
>>> pm_runtime_force_xxx() calls at noirq suspend stage by adding:
>>>
>>>       SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>>>                         pm_runtime_force_resume)
>>>
>>> Am I missing smth?
>>
>> Isn't this almost exactly the same my patch does? I just used suspend_late
>> and resume_early. Is noirq phase better than late & early?
> 
> Well up to you as far as I'm concerned. The noirq phase comes with serious
> limitations, for let's say i2c bus usage if needed. Probably also harder
> to debug for suspend and resume.

Unfortunately, you can't use PM runtime force API at .suspend() stage as pm_runtime_get will still work and
there is no sync between suspend and pm_runtime.
The PM runtime force API can be used only during late/noirq as at this time pm_runtime is disabled.

-- 
Best regards,
grygorii
