Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2AB1327AD
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2020 14:32:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728115AbgAGNcI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jan 2020 08:32:08 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:45666 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728077AbgAGNcI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Jan 2020 08:32:08 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 007DVmOY077824;
        Tue, 7 Jan 2020 07:31:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578403908;
        bh=siV49V3/axhH0J3K/CGRNeFz4H+fcQnmk833M21ccpY=;
        h=Subject:From:To:References:Date:In-Reply-To;
        b=LIvrQeDOpvLtcyyBYPLR5TqvZL8d/coButpuZlXqFI0/Dx3fLrFkaBdb45RBIdk/W
         VMZP7vjGFYMnYi4AhRwfKb1FJ1E4aVk5XA114F4Gzwsyn47fuVOAsElpw7d0tnw2Ud
         AoC2LafKdJpQHnWOE+k00P+01AFJFRhGKAF7quxY=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 007DVm7L056766
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 7 Jan 2020 07:31:48 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 7 Jan
 2020 07:31:47 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 7 Jan 2020 07:31:47 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 007DVjse056381;
        Tue, 7 Jan 2020 07:31:45 -0600
Subject: Re: [PATCH] drm/omap: gem: Fix tearing with BO_TILED
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Tony Lindgren <tony@atomide.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-omap@vger.kernel.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Matthijs van Duin <matthijsvanduin@gmail.com>
References: <20191221005711.47314-1-tony@atomide.com>
 <20191221164141.GI35479@atomide.com> <20200104050950.GA11429@chinchilla>
 <20200104055011.GA5885@atomide.com> <20200105203704.GD5885@atomide.com>
 <6526b54b-a3c3-2873-2164-f9b96f11ad68@ti.com>
Message-ID: <f6ce0a06-91c9-93dd-7b9e-91aeb2dd35fb@ti.com>
Date:   Tue, 7 Jan 2020 15:31:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <6526b54b-a3c3-2873-2164-f9b96f11ad68@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 07/01/2020 15:30, Tomi Valkeinen wrote:
> On 05/01/2020 22:37, Tony Lindgren wrote:
>> Hi,
>>
>> * Tony Lindgren <tony@atomide.com> [200104 05:51]:
>>>
>>> Just changing the alingment fixes the issue. Looks like the minimum
>>> alignment we currently allow is 128, I think 512 was the minimum
>>> that worked for me, so maybe the right fix would be to just change
>>> the minimum to 512 with no specific need to use 4096 for now.
>>
>> So Matthijs and I chatted about this a bit on irc, and here's what
>> we concluded so far:
>>
>> 1. We have at least three different alignment needs for tiler
>>
>> - Linux use of tiler aligned to 128 bytes
>>
>> - SGX use of tiler aligned to 4096 bytes (or 512 bytes?)
>>
>> - Fast userspace mapping aligned to 4096 bytes
>>
>> 2. The alignment need may need to be configured by the tiler consumer
>>     in #1 above
>>
>> 3. The alignment need for SGX seems to be based on SGX MMU page size
>>
>> 4. The issue I'm seeing with stellarium on droid4 may be a stride
>>     issue as about one out of 3 or 4 frames is OK and aligning to
>>     512 also fixes the issue maybe because it happens to make
>>     multiple frames align to 4096
>>
>> So let's wait on this patch until we have more info and know how
>> the different alignments should be handled.
> 
> I don't know if these are related to the issue you have, and it's been a while since I looked at 
> TILER, but two thoughts after looking at the thread:
> 
> - If the usergart is not used, the width of each line has to be expanded to be page size aligned, 
> right? Do the patches from Matthijs do this?

And immediately after pressing "send", I realized that aligning the start of the buffers to page 
size already accomplishes this...

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
