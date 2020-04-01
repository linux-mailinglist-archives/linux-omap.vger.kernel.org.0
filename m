Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E019019AAFE
	for <lists+linux-omap@lfdr.de>; Wed,  1 Apr 2020 13:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732234AbgDALnT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 Apr 2020 07:43:19 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:37694 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732205AbgDALnT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 1 Apr 2020 07:43:19 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 031Bh8kn094999;
        Wed, 1 Apr 2020 06:43:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585741388;
        bh=SnzHlBHXR9fQtbILp3Hc/83R7QzMDB7i2qGvGzjI03s=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=WD0GplFP/jNkeNnH0jxGSNB1VVGU0/i+BXRqs3qLhlbegfomss0I4mFKCqbYjsmN/
         Fp7e8ySsgT0rg7npadjK23mrw73KKXxlzKo8tYXAmXEDkgRiJJABKhr5IbisZ4kTLg
         FlMgccyR3QZZzAJYAUHhW2mBvMGqSbBZABfychfo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 031Bh8rK053121
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 1 Apr 2020 06:43:08 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 1 Apr
 2020 06:43:07 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 1 Apr 2020 06:43:07 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 031Bh4ld011145;
        Wed, 1 Apr 2020 06:43:05 -0500
Subject: Re: [PATCHv2 10/56] drm/omap: dsi: drop virtual channel logic
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, <linux-omap@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <kernel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-11-sebastian.reichel@collabora.com>
 <20200225150117.GI4764@pendragon.ideasonboard.com>
 <b3742008-1ac9-cf4d-62b2-b4afd904f2f9@ti.com>
 <20200401113333.GB4876@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <18e5c1a3-3d12-af6a-5b93-f08ccab96831@ti.com>
Date:   Wed, 1 Apr 2020 14:43:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200401113333.GB4876@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 01/04/2020 14:33, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Wed, Apr 01, 2020 at 02:30:25PM +0300, Tomi Valkeinen wrote:
>> On 25/02/2020 17:01, Laurent Pinchart wrote:
>>> On Tue, Feb 25, 2020 at 12:20:40AM +0100, Sebastian Reichel wrote:
>>>> This drops the virtual channel logic. Afterwards DSI clients
>>>> request their channel number and get the virtual channel with
>>>> the same number or -EBUSY if already in use.
>>>
>>> I wonder why this level of indirection was used, allocating "virtual
>>> VCs". A single virtual indirection should be enough :-) I may be missing
>>> some context though, I'll defer that to Tomi, but for me,
>>
>> I haven't reviewed the code yet, and it's been a long time since I wrote this code. But maybe this
>> explains at least some:
>>
>> (I hope I remember this right)
>>
>> DSI packets have virtual channel IDs (VCID). That's number 0-3 that needs to be in the packets.
>>
>> DSI IP has virtual channel "blocks" (VC), with associated registers. So 4 VC register blocks. These
>> are not related to DSI virtual channel IDs in any way.
>>
>> To do DSI transactions, you choose a VC, and program it. A VC can send data via video pipeline, or
>> transmit and receive data messages created with CPU. And in both cases, you need to include the VCID
>> in the transmissions, of course.
>>
>> So, I think a normal use case could be a single panel, with VCID 0. To send video data and control
>> messages, you would use VC0 and VC1. VC0 would be configured for video data, and VC1 would be
>> configured for control messages.
>>
>> And if I recall right, currently you first request a free VC from the IP with request_vc(). Then you
>> use set_vc_id(channel, id) to set the VCID, used when doing transactions with that VC.
>>
>> So the virtual channel naming is pretty confusing in the DSI IP, in my opinion.
> 
> I wasn't aware of those details, thank you for the explanation. It's
> quite confusing indeed, let's try to document the architecture in a
> comment block at the beginning of the dsi.c file for later reference.

But also, I think there's much room for cleanups and improvements. I don't think we have ever really 
supported multiple DSI peripherals, even in theory. So just one peripheral, with VCID always 0.

Even if we need two VCs to manage that single peripheral (I think that's often the case, we want one 
VC for video, one for control), we could fully hide that detail into the driver. This won't work 
with more than 2 DSI peripherals, but I think we can just say the driver supports a single 
peripheral, and that's it.

But with a quick browsing of this patch, I don't think it does it right, as it looks to me that the 
patch makes VCID == VC.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
