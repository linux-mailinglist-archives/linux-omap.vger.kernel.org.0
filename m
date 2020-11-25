Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A25A02C3B66
	for <lists+linux-omap@lfdr.de>; Wed, 25 Nov 2020 09:52:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgKYIwq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 25 Nov 2020 03:52:46 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:60324 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726483AbgKYIwq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 25 Nov 2020 03:52:46 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AP8qQtE062427;
        Wed, 25 Nov 2020 02:52:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606294346;
        bh=dwaNtlBaBoofLCQpHFpdJhdKJpXm3CNyv1rodELxAfI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=vcxWXy8BMbTFr5DhBZse9I3ZwwIxn9u7SNhtArOizneVi1JiYtajaqJSWOKh4tqx0
         CBOIUSizICBFIVEayKsWSvvDpOHOt7KXSEtBfOWI1N4yNRMlr/RQp2aZJ6JTnDJdY+
         QGF8gUsNMZoEXOIUuwPydQhnFrICRZh61kxRjeIs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AP8qQ9t065254
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 25 Nov 2020 02:52:26 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 25
 Nov 2020 02:52:26 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 25 Nov 2020 02:52:26 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AP8qOME113858;
        Wed, 25 Nov 2020 02:52:24 -0600
Subject: Re: [PATCH v4 55/80] drm/panel: panel-dsi-cm: use
 MIPI_DCS_GET_ERROR_COUNT_ON_DSI
To:     Sam Ravnborg <sam@ravnborg.org>
CC:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        Tony Lindgren <tony@atomide.com>, <hns@goldelico.com>,
        Sekhar Nori <nsekhar@ti.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-56-tomi.valkeinen@ti.com>
 <20201124161836.GA50534@ravnborg.org>
 <d8453eda-6d8b-23be-103e-6f4f07e1346e@ti.com>
 <20201124163848.GA51881@ravnborg.org>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <36e2f58b-ab28-1430-9680-21b3af92d44a@ti.com>
Date:   Wed, 25 Nov 2020 10:52:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201124163848.GA51881@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 24/11/2020 18:38, Sam Ravnborg wrote:

>>> IMO you should get all the patches at least up including this patch applied.
>>> They are all reviewed/acked. And then you have a much smaller stack of
>>> patches to spam us with.
>>
>> Yes, I think that makes sense. I did not want to merge them earlier, as with the v3, I could not get
>> videomode panels work at all (while cmd mode panels did work). So I was not sure if something is
>> totally silly and broken in the series.
>>
>> Now that I can get video mode panels work with some hacks on top, I'm fine with merging these.
>>
>> But it's too late for 5.11, as we need testing and work on the video mode panels. So targeting 5.12.
> Obviously your call, but I see no reason to wait for working videomode
> panles if what you have now do not introduce any (known) regressions.
> 
> ofc I assume videomode panels is something new and not something that worked
> before.
It gets a bit muddy here. The omap dsi host driver has had videomode support for a long time, but
there has been no upstream videomode panel drivers (omapdrm specific drivers, as omapdrm had its own
panel framework) and no board dts files using it.

I have a board with a custom made DSI videomode panel setup, but it's broken (cable, I think) and
works only randomly. I have an old 4.14 based branch with a hacky panel driver and dts file which
get the panel working. I don't know if videomode works on current upstream, or has it been broken
between 4.14 and current upstream, as the 4.14 panel driver doesn't work without modifications on
current upstream.

In this series we convert the omap dsi host driver to be a proper DRM citizen, removing support for
omapdrm specific panels, so new DRM panel drivers are needed to replace the omapdrm specific ones.

With this series applied, and adding a new panel driver and dts changes, videomode works (Nikolaus
confirmed that his panel works. Mine doesn't, as afaics it needs more finetuned initialization which
may not be possible with the current DRM bridge/panel callbacks. But mine works with some hacks).
But I'm sure in the middle of this series videomode won't work.

So, I think one can argue that this causes regressions in the middle of the series to non-upstream
panel drivers, but at the end of the series, they probably work, presuming you have a new DRM panel
driver for it.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
