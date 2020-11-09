Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 468342AB473
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 11:08:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727303AbgKIKIr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 05:08:47 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:40858 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726176AbgKIKIr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 05:08:47 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A9A8ava108395;
        Mon, 9 Nov 2020 04:08:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604916516;
        bh=lrg/Z4k1VK8+rbrdo6DGd+VmPID4GZ+I3Pp2W1YLXGo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=le+smLDMTlnpFM6DPSt5kWBJFARUptZ7/MicVSPYs3mOHpMWGyAtX7lIDjNdS6NlY
         diTdvV37aH6ejQ32alnFOVorXlqUyDFH4xP5FHd3e5tEyo2/MGBaKHFM6zfWjjngVm
         FN42XS2ZZoMbhirBaqejPjCJCK67Qwv8N6AiIWQ4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A9A8aBe074303
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 9 Nov 2020 04:08:36 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 9 Nov
 2020 04:08:36 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 9 Nov 2020 04:08:36 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A9A8YPS032799;
        Mon, 9 Nov 2020 04:08:34 -0600
Subject: Re: [PATCH v3 27/56] drm/omap: dsi: do bus locking in host driver
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-28-tomi.valkeinen@ti.com>
 <20201109095255.GX6029@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <3c9eefd3-99bb-edce-f6ac-2fec3678743b@ti.com>
Date:   Mon, 9 Nov 2020 12:08:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109095255.GX6029@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 09/11/2020 11:52, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Thu, Nov 05, 2020 at 02:03:04PM +0200, Tomi Valkeinen wrote:
>> From: Sebastian Reichel <sebastian.reichel@collabora.com>
>>
>> This moves the bus locking into the host driver and unexports
>> the custom API in preparation for drm_panel support.
>>
>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

<snip>

>>  static int dsicm_update(struct omap_dss_device *dssdev,
>> @@ -739,7 +704,6 @@ static int dsicm_update(struct omap_dss_device *dssdev,
>>  	dev_dbg(&ddata->dsi->dev, "update %d, %d, %d x %d\n", x, y, w, h);
>>  
>>  	mutex_lock(&ddata->lock);
>> -	src->ops->dsi.bus_lock(src);
>>  
>>  	r = dsicm_wake_up(ddata);
>>  	if (r)
>> @@ -761,11 +725,9 @@ static int dsicm_update(struct omap_dss_device *dssdev,
>>  	if (r)
>>  		goto err;
>>  
>> -	/* note: no bus_unlock here. unlock is src framedone_cb */
>> -	mutex_unlock(&ddata->lock);
>> +	/* note: no unlock here. unlock is src framedone_cb */
> 
> This change isn't described in the commit message. Could you explain why
> it's needed ? Locking a mutex in a function and unlocking it elsewhere
> always scares me.

Good catch. I don't know why it is needed. I don't think it is, as the dsi driver handles the bus lock.

Sebastian, what was the reason for this lock?

Note that this goes away in the series, and there's no such lock in the end.

>>  	return 0;
>>  err:
>> -	src->ops->dsi.bus_unlock(src);
>>  	mutex_unlock(&ddata->lock);
>>  	return r;
>>  }
>> @@ -791,7 +753,6 @@ static void dsicm_ulps_work(struct work_struct *work)
>>  	struct panel_drv_data *ddata = container_of(work, struct panel_drv_data,
>>  			ulps_work.work);
>>  	struct omap_dss_device *dssdev = &ddata->dssdev;
>> -	struct omap_dss_device *src = ddata->src;
>>  
>>  	mutex_lock(&ddata->lock);
>>  
>> @@ -800,11 +761,8 @@ static void dsicm_ulps_work(struct work_struct *work)
>>  		return;
>>  	}
>>  
>> -	src->ops->dsi.bus_lock(src);
>> -
>>  	dsicm_enter_ulps(ddata);
>>  
>> -	src->ops->dsi.bus_unlock(src);
>>  	mutex_unlock(&ddata->lock);
>>  }
>>  
>> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
>> index 41431ca34568..d54b743c2b48 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
>> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
>> @@ -476,17 +476,13 @@ static inline u32 dsi_read_reg(struct dsi_data *dsi, const struct dsi_reg idx)
>>  	return __raw_readl(base + idx.idx);
>>  }
>>  
>> -static void dsi_bus_lock(struct omap_dss_device *dssdev)
>> +static void dsi_bus_lock(struct dsi_data *dsi)
>>  {
>> -	struct dsi_data *dsi = to_dsi_data(dssdev);
>> -
>>  	down(&dsi->bus_lock);
> 
> Nothing to be addressed in this patch, but is there a reason to use a
> semaphore instead of a mutex ?

It's been a long time, but I think the reason was that mutex gave a warning after being locked for a
bit longer time, and semaphore didn't. The resource is reserved while a DSI transfer is active, so
it could be almost 2 frames (wait for vsync and then transfer frame). Or reading the frame buffer
back from the panel, which could take a long time (seconds).

There are better ways to implement it (after this series =).

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
