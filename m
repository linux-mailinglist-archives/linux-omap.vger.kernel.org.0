Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7F591F3F37
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jun 2020 17:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728822AbgFIP0l (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Jun 2020 11:26:41 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:33380 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbgFIP0l (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 9 Jun 2020 11:26:41 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 059FQVk8025874;
        Tue, 9 Jun 2020 10:26:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1591716391;
        bh=b2y0Z9lHjVbTdDJI+gowNTOtYPhQ4/O11hsyYQYGYbw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=NM/Q1KIVU9p5v8dRAq0vTOu/+MLVqokNfJBx6vwOykd4tvFA89FhrVzPt+yCWeQyg
         CpZwyl2+kAGmy0br/XsUocQ/bIUPGGUtWIVM58hwIq+uotM7cZGd6973A+ybtcNadU
         wo/kcgJYYh8xbH604xU4auA6DtPDEi5YLI/PBa54=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 059FQVvA056533
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 9 Jun 2020 10:26:31 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 9 Jun
 2020 10:26:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 9 Jun 2020 10:26:30 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 059FQQVY052033;
        Tue, 9 Jun 2020 10:26:27 -0500
Subject: Re: [PATCH 1/5] drm/omap: Fix suspend resume regression after
 platform data removal
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, "Andrew F . Davis" <afd@ti.com>,
        Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <dri-devel@lists.freedesktop.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200531193941.13179-1-tony@atomide.com>
 <20200531193941.13179-2-tony@atomide.com>
 <16ba1808-5c7f-573d-8dd0-c80cac2f476e@ti.com>
 <20200603140639.GG37466@atomide.com>
 <47e286dd-f87a-4440-5bde-1f7b53e8b672@ti.com>
 <20200609151943.GL37466@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <9ed70121-2a53-d2b3-051a-88eb83e6c53f@ti.com>
Date:   Tue, 9 Jun 2020 18:26:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200609151943.GL37466@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 09/06/2020 18:19, Tony Lindgren wrote:

>> But there's an extra runtime PM reference (dev.power.usage_count) that seems
>> to come out of nowhere. So when omap_drm_suspend is finished, there's still
>> usage_count of 1, and dispc never suspends fully.
> 
> Hmm no idea about that. My guess is that there might be an issue that was
> masked earlier with omap_device calling the child runtime_suspend.

Yes. It's how PM works. It calls pm_runtime_get_noresume() before starting the suspend of a device. 
So I guess omapdrm's suspend has been broken all the time, but it was "fixed" by omap_device.

> Currently I'm only able to rmmod -f omapdrm, not sure if these issues might
> be related.

Hmm, I always use modules, and can unload omapdrm and drm fine. But there's a sequence that must be 
followed. However, the sequence starts with unloading omapdrm... What behavior you see with rmmod?

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
