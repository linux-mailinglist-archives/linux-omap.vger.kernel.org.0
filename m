Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0EC32CA14D
	for <lists+linux-omap@lfdr.de>; Tue,  1 Dec 2020 12:30:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730555AbgLAL1s (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Dec 2020 06:27:48 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58376 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730539AbgLAL1r (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Dec 2020 06:27:47 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B1BQoVq045050;
        Tue, 1 Dec 2020 05:26:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606822010;
        bh=ABnibVJ+yXnfG66U+FvRmfn+dwQelMYhopS+Tq2oBWo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=E3YRxvO/eMCR5DNceXB2n37vW1Ms5GqQcWGvuQ0b4Nd5aCEnc4DK8lDhL/S9pWRDL
         u4Ko73E/44/R8U1TcGkGZ0o5TBmtxMiw0Q+kRARIMe1biSsQByqCa97Ps7REW2FuDC
         ufAWdylu491Jn1fQE3HIsDlJMIwyghzVhd9oAfMI=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B1BQodj074074
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Dec 2020 05:26:50 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Dec
 2020 05:26:49 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Dec 2020 05:26:49 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B1BQlPd029102;
        Tue, 1 Dec 2020 05:26:48 -0600
Subject: Re: [PATCH v4 68/80] drm/panel: panel-dsi-cm: remove extra 'if'
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-69-tomi.valkeinen@ti.com>
 <20201201002243.GM25713@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <30470155-e99b-e2fd-f793-95fc11e051ed@ti.com>
Date:   Tue, 1 Dec 2020 13:26:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201002243.GM25713@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 01/12/2020 02:22, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Nov 24, 2020 at 02:45:26PM +0200, Tomi Valkeinen wrote:
>> We have a useless 'if' in the dsicm_bl_update_status(), a left over from
>> the conversion to DRM model. Drop the if.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> ---
>>  drivers/gpu/drm/panel/panel-dsi-cm.c | 10 ++++------
>>  1 file changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
>> index 1e7f73340736..c17ed728c695 100644
>> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
>> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
>> @@ -194,7 +194,7 @@ static int dsicm_set_update_window(struct panel_drv_data *ddata)
>>  static int dsicm_bl_update_status(struct backlight_device *dev)
>>  {
>>  	struct panel_drv_data *ddata = dev_get_drvdata(&dev->dev);
>> -	int r = 0;
>> +	int r;
>>  	int level;
>>  
>>  	if (dev->props.fb_blank == FB_BLANK_UNBLANK &&
>> @@ -207,11 +207,9 @@ static int dsicm_bl_update_status(struct backlight_device *dev)
>>  
>>  	mutex_lock(&ddata->lock);
>>  
>> -	if (ddata->enabled) {
>> -		if (!r)
>> -			r = dsicm_dcs_write_1(
>> -				ddata, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, level);
>> -	}
>> +	if (ddata->enabled)
>> +		r = dsicm_dcs_write_1(ddata, MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
>> +				      level);
> 
> If !ddata->enabled, won't r be uninitialized ?

Yes. I wonder how I missed that... I'll keep the "r = 0" initialization.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
