Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D25617723B
	for <lists+linux-omap@lfdr.de>; Tue,  3 Mar 2020 10:19:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727604AbgCCJTI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Mar 2020 04:19:08 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:41518 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbgCCJTI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 Mar 2020 04:19:08 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0239Irjt116537;
        Tue, 3 Mar 2020 03:18:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1583227133;
        bh=QIoU5X0rCsPLgh6f6hX/m3Rq6EJWCP9dyqJ6Kiv4p2E=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=vAo/Y/csINLFU/q9QAPYTZ2JEwIeZJ4Y8IizD4GSMIueqqQDl4N0j5diJFBSGWrXK
         fOev58YKdHMS+vgGx81vAH77X+fLrdnIW+0tBpV8PdLeVf4Uc1yOgIvHrD9ROoVnRb
         PFA4ZnXCbJ6pFCABixP8qLsnZ5QlZd35ioPRr5B4=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0239IrMv043566
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 3 Mar 2020 03:18:53 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 3 Mar
 2020 03:18:52 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 3 Mar 2020 03:18:52 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0239Ilcc029377;
        Tue, 3 Mar 2020 03:18:49 -0600
Subject: Re: [PATCH 1/3] drm/omap: Prepare DSS for probing without legacy
 platform data
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <dri-devel@lists.freedesktop.org>, Jyri Sarha <jsarha@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200224191230.30972-1-tony@atomide.com>
 <20200224191230.30972-2-tony@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <d5ce999e-3b26-334e-fc62-adee4753a3ed@ti.com>
Date:   Tue, 3 Mar 2020 11:18:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224191230.30972-2-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 24/02/2020 21:12, Tony Lindgren wrote:
> In order to probe display subsystem (DSS) components with ti-sysc
> interconnect target module without legacy platform data and using
> devicetree, we need to update dss probing a bit.
> 
> In the device tree, we will be defining the data also for the interconnect
> target modules as DSS really is a private interconnect. There is some
> information about that in 4460 TRM in "Figure 10-3. DSS Integration" for
> example where it mentions "32-bit interconnect (SLX)".
> 
> The changes we need to make are:
> 
> 1. Parse also device tree subnodes for the compatible property fixup
> 
> 2. Update the component code to consider device tree subnodes
> 
> Cc: dri-devel@lists.freedesktop.org
> Cc: Jyri Sarha <jsarha@ti.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
> 
> This is needed for dropping DSS platform data that I'll be posting
> seprately. If this looks OK, can you guys please test and ack?
> 
> ---
>   drivers/gpu/drm/omapdrm/dss/dss.c             | 25 ++++++++++++++++---
>   .../gpu/drm/omapdrm/dss/omapdss-boot-init.c   | 25 +++++++++++++------
>   2 files changed, 39 insertions(+), 11 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

This doesn't conflict with drm-next (with Laurent's recent patches), so it should be fine for you to 
have this in your branch.

And not a biggie, but I wonder if the changes to these two files should be in separate patches, due 
to omapdss-boot-init going away. Well, probably doesn't matter.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
