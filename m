Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E31371D7068
	for <lists+linux-omap@lfdr.de>; Mon, 18 May 2020 07:35:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbgERFf0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 May 2020 01:35:26 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:52450 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbgERFf0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 May 2020 01:35:26 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04I5ZO0G026728;
        Mon, 18 May 2020 00:35:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589780124;
        bh=qJh+u4HJfgz4gV+cdYH5RlY8bjmFeUAi5Vc8N+QeL0M=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Nm/hf7KeeUQgOcoBLtLRKij6nWAb/tj7XvO1rCRUuaKKIzilRs8Gmv/7mpY2axLCS
         b741ceBeFmdcmu883fsL6Yl2BBhSzSb4RZqs5HXLrafDM7NcT8tZiwoVOiSNZnh9vA
         aV+9AzjYI9sBDiczNBwZljByR7YraPsDAPUU9BMQ=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04I5ZNIB096509;
        Mon, 18 May 2020 00:35:24 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 18
 May 2020 00:35:23 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 18 May 2020 00:35:23 -0500
Received: from [10.24.69.198] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04I5ZH16065415;
        Mon, 18 May 2020 00:35:19 -0500
Subject: Re: AM3517 MUSB and CPPI
To:     Adam Ford <aford173@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
CC:     Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>,
        "Liu, Bin" <b-liu@ti.com>
References: <CAHCN7x+PAsFBhKyUUdbW2_diZ9PX=-Keb=UtXbkUVv1Mp1eujQ@mail.gmail.com>
From:   Sekhar Nori <nsekhar@ti.com>
Message-ID: <fedbed5e-8365-85ab-9b81-2ec25ffa64b4@ti.com>
Date:   Mon, 18 May 2020 11:05:17 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAHCN7x+PAsFBhKyUUdbW2_diZ9PX=-Keb=UtXbkUVv1Mp1eujQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

+ Bin who maintains MUSB controller support

On 5/18/20 8:17 AM, Adam Ford wrote:
> From what I can tell, the MUSB controller on the AM3517 hasn't worked
> in a very long time.
> 
> I have been going through the TRM for the AM3517, and I am convinced
> the device tree for the OTG port is wrong, but I am struggling to fix
> it.
> 
> From what I can see the USB OTG Port support the CPPI 4.1 DMA
> controller, but the CPPI 4.1 only appears to support the
> DA850/OMAP-L138 and the AM335x family.
> 
> It appears as if the AM35xx is a bit closer in behavior to the AM335x
> than the L138, but I was hoping either Tony, Tero or someone from TI
> might have a suggestion.
> 
> The compatible flag need to be something like "compatible =
> "ti,am35xx-musb" and not omap3, because OMAP3 doesn't support the CPPI
> 4.1 DMA controller and the AM3517 does.
> 
> Secondly, we need to update a couple of the tables in the cppi driver
> to support the am3517, and lastly, the device tree node needs to
> support the CPPI driver.
> 
> It looks like the DA850/L138 makes the CPPI driver a sub-node of the
> OTG port, while the am335x has it as a separate node from the USB
> controller.
> 
> From what I can tell on the AM3517, the CPPI DMA node should be a
> sub-node of the OTG.
> 
> What I am struggling with now is the register offsets for controller,
> scheduler and queue manager.
> On both DA850 the 335x, there is an explicit table entry showing the
> offset of DMAREVID, which tells the DMA revision ID.  I cannot find a
> corresponding register for the AM3517, yet the AM3517
> 
> FWICT, the scheduler is offset 0x2000 with respect to the OTG
> controller, and the Queue Manager register is at 0ffset 0x4000, both
> with respect to the OTG base address.  Unfortunately, I am not finding
> the offset for the CDMA controller itself.
> 
> Can someone tell me what it should be?  I am guessing it would be near
> the 0x1000 offset, but it's a pure guess.
> 
> adam
> 

