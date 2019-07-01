Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEDF95B5A7
	for <lists+linux-omap@lfdr.de>; Mon,  1 Jul 2019 09:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbfGAHSS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 1 Jul 2019 03:18:18 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:59364 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727173AbfGAHSR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 1 Jul 2019 03:18:17 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x617IDrO129639;
        Mon, 1 Jul 2019 02:18:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561965493;
        bh=Nv5KisWxr8/4sDqobDC5gvgLQVtpK9+rEGp1Ceklb4k=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=hK1YKtBJOOG9r/nTuHXT/PrjEp6OTPStJU+sg/qoZR1hmcwc6xZX2Ezjxa5C5aGvl
         EhMjAQCCBlp6scMa3DBAOo7MizwBdCUnC3XrfEGWVFtnOZ7uy1/8oSKwCnpgv/xSnP
         TOyDYdXYN5lnbE1Bpfuz7L6k3+GfB58e8+6enIE4=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x617IDZ0023114
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 1 Jul 2019 02:18:13 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 1 Jul
 2019 02:18:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 1 Jul 2019 02:18:11 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x617IA99127317;
        Mon, 1 Jul 2019 02:18:10 -0500
Subject: Re: [PATCH 0/5] Minor ti-sysc cleanups
To:     Suman Anna <s-anna@ti.com>, Tony Lindgren <tony@atomide.com>
CC:     Tero Kristo <t-kristo@ti.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20190625233315.22301-1-s-anna@ti.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <f4b63a80-560e-377c-0e4e-5b8711990747@ti.com>
Date:   Mon, 1 Jul 2019 10:18:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190625233315.22301-1-s-anna@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 26/06/2019 02:33, Suman Anna wrote:
> Hi Tony,
> 
> The following series includes minor cleanup patches against the ti-sysc
> code. Patches are based on top of all your 5.3 staged branches. Feel free
> to pick them up for either 5.3 (if it is not too late) or 5.4 merge window. 
> 
> The first 4 patches are non-coding changes, and the last patch is a minor
> fixup cleaning up the code flow on failure error paths in sysc_probe()
> function. I have boot tested on the limited boards that I have - AM335x
> BeagleBone Black, AM437x IDK, AM57xx GP EVM, OMAP4 PandaBoard and OMAP5
> uEVM.
> 
> regards
> Suman
> 
> Suman Anna (5):
>   MAINTAINERS: Add ti-sysc files under the OMAP2+ entry
>   dt-bindings: ti-sysc: Add SPDX license identifier
>   bus: ti-sysc: Switch to SPDX license identifier
>   bus: ti-sysc: Add missing kerneldoc comments
>   bus: ti-sysc: Simplify cleanup upon failures in sysc_probe()

For all patches.

Acked-by: Roger Quadros <rogerq@ti.com>

> 
>  MAINTAINERS                           |  2 ++
>  drivers/bus/ti-sysc.c                 | 31 +++++++++++++--------------
>  include/dt-bindings/bus/ti-sysc.h     |  1 +
>  include/linux/platform_data/ti-sysc.h |  7 ++++--
>  4 files changed, 23 insertions(+), 18 deletions(-)
> 

-- 
cheers,
-roger

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
