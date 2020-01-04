Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC68130153
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2020 08:36:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbgADHg5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 4 Jan 2020 02:36:57 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:40008 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbgADHg5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 4 Jan 2020 02:36:57 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0047afHt091640;
        Sat, 4 Jan 2020 01:36:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578123401;
        bh=xyTtGJBBV5DkwnqH7weJ56jokZyNTPmMYazq+z0R4do=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=NJlvJMliAwWcHzCfQ0pIAgBWjmKCERHobnEwo9y76RVzQmFw4YoAJiRWnRsHytBqD
         s+xySIkthvzRuKFBVTITMCFRj02tHsh57ahCorMdCx822h0yCg0jXDcr7lzlScZ/wk
         HXmW61/uMpUFJD8DUbaUR/3ShHQ55UX+fd6tyNUw=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0047af9m025066
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 4 Jan 2020 01:36:41 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Sat, 4 Jan
 2020 01:36:41 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Sat, 4 Jan 2020 01:36:41 -0600
Received: from [192.168.2.10] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0047adX4077901;
        Sat, 4 Jan 2020 01:36:40 -0600
Subject: Re: [BISECTED, REGRESSION] OMAP3 onenand/DMA broken
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200103081726.GD15023@darkstar.musicnaut.iki.fi>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <7a8f4222-9815-9dd8-e13c-9d2e57cfb1ea@ti.com>
Date:   Sat, 4 Jan 2020 09:38:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200103081726.GD15023@darkstar.musicnaut.iki.fi>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Aaro,

On 1/3/20 10:17 AM, Aaro Koskinen wrote:
> Hi,
> 
> When booting v5.4 (or v5.5-rc4) on N900, the console gets flooded with:
> 
> [    8.335754] omap2-onenand 1000000.onenand: timeout waiting for DMA
> [    8.365753] omap2-onenand 1000000.onenand: timeout waiting for DMA
> [    8.395751] omap2-onenand 1000000.onenand: timeout waiting for DMA
> [    8.425750] omap2-onenand 1000000.onenand: timeout waiting for DMA
> [    8.455749] omap2-onenand 1000000.onenand: timeout waiting for DMA
> [    8.485748] omap2-onenand 1000000.onenand: timeout waiting for DMA
> [    8.515777] omap2-onenand 1000000.onenand: timeout waiting for DMA
> [    8.545776] omap2-onenand 1000000.onenand: timeout waiting for DMA
> [    8.575775] omap2-onenand 1000000.onenand: timeout waiting for DMA
> 
> making the system unusable.
> 
> Bisected to:
> 
> 4689d35c765c696bdf0535486a990038b242a26b is the first bad commit
> commit 4689d35c765c696bdf0535486a990038b242a26b
> Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Date:   Tue Jul 16 11:24:59 2019 +0300
> 
>     dmaengine: ti: omap-dma: Improved memcpy polling support
> 
> The commit does not revert cleanly anymore. Any ideas how to fix this?

I certainly tested the memcpy via dmatest in polled and non polled mode..

I can take a look on Tuesday earliest, but sent a patch (untested) which
should fix the issue:
https://lore.kernel.org/lkml/20200104073453.16077-1-peter.ujfalusi@ti.com/


> 
> A.
> 

- Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
