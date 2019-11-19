Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2CF410178E
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2019 07:02:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbfKSGCR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Nov 2019 01:02:17 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:33780 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730642AbfKSFmf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 Nov 2019 00:42:35 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAJ5gFrF029531;
        Mon, 18 Nov 2019 23:42:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574142136;
        bh=bWtRsR/3TOxHAcS6XxIdxnEimos6cH+h2hRdBhT3N2Y=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=uZZdRHV1J4X6rWKntPyBWK+7mIq+22MIDQn3ch59qSF3uz5NVkCQGcjjuTwcFrXy3
         FAFyJGs4A+kCKMH6+xZLlDWcOl+Q1MfTZe7GZHzpOJcD/I8bGAMFSkCoUkCaCQEITC
         KaEB9FsgquaSvk2J2awolRWTIC3y/ANdAOpd72gY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAJ5gF7t097443
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 18 Nov 2019 23:42:15 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 18
 Nov 2019 23:42:15 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 18 Nov 2019 23:42:15 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAJ5gCdl015366;
        Mon, 18 Nov 2019 23:42:13 -0600
Subject: Re: [RFCv1 33/42] drm/omap: dsi: use atomic helper for dirtyfb
To:     Tony Lindgren <tony@atomide.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
CC:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <kernel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
 <20191117024028.2233-34-sebastian.reichel@collabora.com>
 <20191118230535.GG35479@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <e91c7fc9-18e0-cc22-4617-127fe9be2c1b@ti.com>
Date:   Tue, 19 Nov 2019 07:42:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191118230535.GG35479@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 19/11/2019 01:05, Tony Lindgren wrote:
> * Sebastian Reichel <sebastian.reichel@collabora.com> [191117 07:11]:
>> We can simply use the atomic helper for
>> handling the dirtyfb callback.
> ...
>> --- a/drivers/gpu/drm/omapdrm/omap_crtc.c
>> +++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
>> -void omap_crtc_flush(struct drm_crtc *crtc)
>> +static void omap_crtc_flush(struct drm_crtc *crtc)
>>   {
>>   	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
>> -	struct omap_crtc_state *omap_state = to_omap_crtc_state(crtc->state);
>> -
>> -	if (!omap_state->manually_updated)
>> -		return;
>>   
>>   	if (!delayed_work_pending(&omap_crtc->update_work))
>>   		schedule_delayed_work(&omap_crtc->update_work, 0);
> 
> It would be nice if omap_crtc_flush() would become just some generic
> void function with no need to pass it a crtc. I guess for that it
> should know what panels are in manual command mode to refresh them.
> 
> The reason I'm bringing this up is because it looks like we need
> to also flush DSI command mode panels from omap_gem_op_finish()
> for gles and the gem code probably should not need to know anything
> about crtc, right?

We haven't had omap_gem_op_finish() in the kernel for some years now...

Shouldn't a normal page flip, or if doing single-buffering, using the 
dirtyfb ioctl, do the job?

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
