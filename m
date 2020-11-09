Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 689492ABE97
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 15:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730084AbgKIOZa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 09:25:30 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:36100 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730035AbgKIOZa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 09:25:30 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A9EPIQc067321;
        Mon, 9 Nov 2020 08:25:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604931918;
        bh=DQS1axFy+zJL+GmIcwNyhOuwva/Tl/Qsxgv0mCkWaLg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=sKPECRxH6urdAytIe8v6N2rrDUfldhU7Kn8N+3RnmS2QOTZS7SrbIUGX4hcTckEsh
         x1wVer5MS9HGoSQwjV/2gd23IuqznpnreTcWunVXwMIB3wHJntP3/uGZ9ZgWvxcdgn
         nG0WDQIkZ2qyB5cZxOxoBbmPPLU9STAtENVac9Og=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A9EPItV106032
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 9 Nov 2020 08:25:18 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 9 Nov
 2020 08:25:18 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 9 Nov 2020 08:25:18 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A9EPGwY011676;
        Mon, 9 Nov 2020 08:25:16 -0600
Subject: Re: [PATCH v3 27/56] drm/omap: dsi: do bus locking in host driver
To:     Sebastian Reichel <sre@kernel.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-28-tomi.valkeinen@ti.com>
 <20201109095255.GX6029@pendragon.ideasonboard.com>
 <3c9eefd3-99bb-edce-f6ac-2fec3678743b@ti.com>
 <20201109132705.6n7h3ogsrlciw5nf@earth.universe>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <d048e4e5-2a9b-c0bf-6791-30f2ed38fee8@ti.com>
Date:   Mon, 9 Nov 2020 16:25:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109132705.6n7h3ogsrlciw5nf@earth.universe>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 09/11/2020 15:27, Sebastian Reichel wrote:
> Hi,
> 
> On Mon, Nov 09, 2020 at 12:08:33PM +0200, Tomi Valkeinen wrote:
>> On 09/11/2020 11:52, Laurent Pinchart wrote:
>>> Hi Tomi,
>>>
>>> Thank you for the patch.
>>>
>>> On Thu, Nov 05, 2020 at 02:03:04PM +0200, Tomi Valkeinen wrote:
>>>> From: Sebastian Reichel <sebastian.reichel@collabora.com>
>>>>
>>>> This moves the bus locking into the host driver and unexports
>>>> the custom API in preparation for drm_panel support.
>>>>
>>>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>>
>> <snip>
>>
>>>>  static int dsicm_update(struct omap_dss_device *dssdev,
>>>> @@ -739,7 +704,6 @@ static int dsicm_update(struct omap_dss_device *dssdev,
>>>>  	dev_dbg(&ddata->dsi->dev, "update %d, %d, %d x %d\n", x, y, w, h);
>>>>  
>>>>  	mutex_lock(&ddata->lock);
>>>> -	src->ops->dsi.bus_lock(src);
>>>>  
>>>>  	r = dsicm_wake_up(ddata);
>>>>  	if (r)
>>>> @@ -761,11 +725,9 @@ static int dsicm_update(struct omap_dss_device *dssdev,
>>>>  	if (r)
>>>>  		goto err;
>>>>  
>>>> -	/* note: no bus_unlock here. unlock is src framedone_cb */
>>>> -	mutex_unlock(&ddata->lock);
>>>> +	/* note: no unlock here. unlock is src framedone_cb */
>>>
>>> This change isn't described in the commit message. Could you explain why
>>> it's needed ? Locking a mutex in a function and unlocking it elsewhere
>>> always scares me.
>>
>> Good catch. I don't know why it is needed. I don't think it is, as
>> the dsi driver handles the bus lock.
>>
>> Sebastian, what was the reason for this lock?
>>
>> Note that this goes away in the series, and there's no such lock
>> in the end.
> 
> It's not really a change. What this patch basically does is to fold
> src->ops->dsi.bus_lock(src) into mutex_lock(&ddata->lock), so that
> there is only a single locking mechanism. This function previously
> had a matching pair of mutex_lock/unlock for ddata->lock, but the
> bus was not locked paired. So after conversion the lock must not be
> free'd here.

Hmm, but taking the bus_lock is moved into dsi.c (dsi_bus_lock/unlock). Previously the panel called
that directly via the dsi_ops->bus_lock(), but afaics bus_lock is now taken in dsi_update(), which
is called from the panel.

But in addition to that, this patch makes the panel driver keep the ddata->lock during the update,
which is meant to only protect the ddata.

> My understanding is, that this is because the bus must not be used
> until the update has been done.

Yes, and not only about the update, but e.g. prevent sending backlight commands while reading the
framebuffer memory.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
