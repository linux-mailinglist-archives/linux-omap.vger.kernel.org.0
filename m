Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAB2D1028B4
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2019 16:56:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbfKSP4Z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Nov 2019 10:56:25 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:43900 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727591AbfKSP4Y (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 Nov 2019 10:56:24 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAJFu0JA023466;
        Tue, 19 Nov 2019 09:56:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574178960;
        bh=PIPhvAPPQ8IxOiUh3DrXJGxdw4Mzkn/7EdMHLFanM4I=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=RVE3KyPExf9DpId8wMB8tVxRegiclIGdnHFY6L3gQQ9NxGIQWvMgACGfO9G2akyCZ
         mRvsOa43NInlbJ4UijeQVLoyYLMsS7W5RgaNHA/ewU2ncc69J/Abmj7wQbOI+T5gO9
         ctNIkhtJqh2WOM90P/19Ib7+wCXuONPJC0QUSvsE=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAJFu03Q046820
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 19 Nov 2019 09:56:00 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 19
 Nov 2019 09:56:00 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 19 Nov 2019 09:56:00 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAJFtv0X069629;
        Tue, 19 Nov 2019 09:55:58 -0600
Subject: Re: [RFCv1 33/42] drm/omap: dsi: use atomic helper for dirtyfb
To:     Tony Lindgren <tony@atomide.com>
CC:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <kernel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
 <20191117024028.2233-34-sebastian.reichel@collabora.com>
 <20191118230535.GG35479@atomide.com>
 <e91c7fc9-18e0-cc22-4617-127fe9be2c1b@ti.com>
 <20191119143243.GH35479@atomide.com>
 <edff7dfa-8b95-48ac-59e0-14553f3c8d39@ti.com>
 <20191119150643.GI35479@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <46aba805-1d3a-2efc-23f6-d957bf6a44c3@ti.com>
Date:   Tue, 19 Nov 2019 17:55:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191119150643.GI35479@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 19/11/2019 17:06, Tony Lindgren wrote:

>> The userspace apps need to do this. If they're using single-buffering, then
>> using the dirtyfb ioctl should do the trick, after the SGX has finished
>> drawing.
> 
> Sounds like that's not happening.
> 
> But why would the userspace app need to know this might be needed for
> a DSI command mode display and that it's not needed for HDMI?

When double-buffering, the userspace doesn't need to care, as the 
page-flip ioctl explicitly tells that the buffer is ready.

When single buffering, either the userspace has to tell that the buffer 
is now ready, or the kernel has to guess based on something. But afaics, 
the latter is always a guess, and may not be a good guess.

The kernel could trigger a delayed update based on, say, page fault if 
drawing with CPU. But how much delayed... And with this scenario, we 
would somehow need to find a way to catch the writes from any IP to the 
buffer, and afaik there's no such thing.

>> It's probably somewhat difficult if EGL is controlling the display, as,
>> afaik, SGX EGL is closed source, and that's probably where it should be
>> done.
>>
>> But adding back the hacky omap gem sync stuff, and then somehow guessing
>> from the sync finish that some display needs to be updated... It just does
>> not sound right to me.
> 
> Right it's ugly. Still sounds like we need something in the kernel
> that knows "this is a DSI command mode LCD and needs to be updated".

I think one option is to refresh the command mode display all the time. 
Either using a timer, or trigger updates based on the previous update 
being finished.

Of course, that's kind of against the whole point of manual update 
display, but then it should effectively behave like a conventional 
always-updating display (except your HW is more expensive and consumes 
more power than a conventional display).

There's this Panel Self Refresh feature in DisplayPort (which I think is 
implemented in drm_self_refresh_helper.c), which has some similarities 
to this case. But if I read it right, that also expects some kind of 
trigger from userspace (any DRM commit) to start the refresh.

Afaik, Weston and X both handle page flips and/or dirtying the fb, so 
they should work. Are there applications that do not work, and cannot be 
made to work, except the few SGX test apps?

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
