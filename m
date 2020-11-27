Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABD8F2C6413
	for <lists+linux-omap@lfdr.de>; Fri, 27 Nov 2020 12:48:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729601AbgK0Lpl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Nov 2020 06:45:41 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:53176 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbgK0Lpk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 Nov 2020 06:45:40 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ARBjP3f092480;
        Fri, 27 Nov 2020 05:45:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606477525;
        bh=g6KNlqoIDvu9JY8ZlxhjEAu/FsaRsM0aCN3qUSkC3vg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=XuRw3A4lfGXTDvCKI5KOX/7jz3wUlJn4Yn1Pg6SnWiowWyH4TAmaOTB955CZ16GDz
         UUUMBd1VNBT9uJ6b1NAu55VMgyIh8wkmf3TDrC7g2/2Ujdgbq9u20kShDthrSGAkUW
         Rz48JXDNXA2pJu5fSF/Zzbt5ZqU30xJzkDyOzv28=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ARBjPCj115056
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 27 Nov 2020 05:45:25 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 27
 Nov 2020 05:45:24 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 27 Nov 2020 05:45:24 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ARBjMaS001898;
        Fri, 27 Nov 2020 05:45:23 -0600
Subject: Re: [REGRESSION] omapdrm/N900 display broken
To:     Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        ML dri-devel <dri-devel@lists.freedesktop.org>
CC:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200728181412.GA49617@darkstar.musicnaut.iki.fi>
 <660b2fe1-343d-b83e-11d2-5a5eb530b83f@ti.com>
 <448c1441-2cac-44ef-95ef-bb28b512297b@ti.com>
 <20200823162625.GC4313@darkstar.musicnaut.iki.fi>
 <ac42f7f9-2ac2-246e-69c1-3d56cea7e59b@ti.com>
 <5072a25d-e885-cdd2-978d-70942406c272@gmail.com>
 <09044fd2-2926-c7b3-826b-52b742e84ff5@ti.com>
 <79ad8816-815c-14d3-ebe1-3c5007c81dd1@gmail.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <1fe9fed7-f619-eb6a-6e31-b9eadbf09bad@ti.com>
Date:   Fri, 27 Nov 2020 13:45:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <79ad8816-815c-14d3-ebe1-3c5007c81dd1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 27/11/2020 01:17, Ivaylo Dimitrov wrote:
> Hi Tomi,
> 
> On 26.11.20 г. 16:11 ч., Tomi Valkeinen wrote:
>> Hi Aaro, Ivaylo,
>>
>> On 24/11/2020 23:03, Ivaylo Dimitrov wrote:
>>
>>> Is there any progress on the issue? I tried 5.9.1 and still nothing displayed.
>>
>> Can you test the attached patch?
>>
> 
> With this patch I don't see oops that Aaro reported, so:
> 
> Tested-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> 
> Seems to fix the particular issue, however, now we get another oops. As this is not upstream kernel
> but one with PVR related patches, I will try again with vanilla 5.9.
> 
> Just in case oops rings any bells (the line in question is
> https://github.com/maemo-leste/droid4-linux/blob/maemo-5.9/drivers/gpu/drm/omapdrm/omap_gem.c#L801)

Do the PVR patches touch omapdrm? The call stack looks like normal boot time probing stuff, not
something happening later (possibly from PVR).

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
