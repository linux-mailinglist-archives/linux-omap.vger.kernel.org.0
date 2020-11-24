Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED1CC2C2CDF
	for <lists+linux-omap@lfdr.de>; Tue, 24 Nov 2020 17:28:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390342AbgKXQ1a (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Nov 2020 11:27:30 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:39546 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390003AbgKXQ1a (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Nov 2020 11:27:30 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOGQoXn120394;
        Tue, 24 Nov 2020 10:26:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606235210;
        bh=Gg58GJZKLI8+087QBrtu0afvE5VeiXIIC5ua2zZ9ExU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=v/XlC2fhe9MU9GmzukJDE7eub9JArZjI+HJ4Ayno2lkTzMpfy88BjaKj0Mgj4Oum4
         rtnOUPp4SCKxOaiHCWX+ihvfq74aucIRqVKM0cJ9pwmJNpZwTF4liqd1Lwcqfo0WxE
         yrHFuPjJ14oACQCxF7FlNF6nqyaZo94ZoFpEdubI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOGQonc130929
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Nov 2020 10:26:50 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 10:26:50 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 10:26:50 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOGQlga030282;
        Tue, 24 Nov 2020 10:26:48 -0600
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
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <d8453eda-6d8b-23be-103e-6f4f07e1346e@ti.com>
Date:   Tue, 24 Nov 2020 18:26:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201124161836.GA50534@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sam,

On 24/11/2020 18:18, Sam Ravnborg wrote:
> Hi Tomi,
> 
> On Tue, Nov 24, 2020 at 02:45:13PM +0200, Tomi Valkeinen wrote:
>> Use the common MIPI_DCS_GET_ERROR_COUNT_ON_DSI define instead of
>> driver's own.
>>
> They are both 5 - OK
> 
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> IMO you should get all the patches at least up including this patch applied.
> They are all reviewed/acked. And then you have a much smaller stack of
> patches to spam us with.

Yes, I think that makes sense. I did not want to merge them earlier, as with the v3, I could not get
videomode panels work at all (while cmd mode panels did work). So I was not sure if something is
totally silly and broken in the series.

Now that I can get video mode panels work with some hacks on top, I'm fine with merging these.

But it's too late for 5.11, as we need testing and work on the video mode panels. So targeting 5.12.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
