Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E900011218
	for <lists+linux-omap@lfdr.de>; Thu,  2 May 2019 06:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725613AbfEBEKo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 May 2019 00:10:44 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:36540 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbfEBEKo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 May 2019 00:10:44 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x424ATiF058065;
        Wed, 1 May 2019 23:10:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1556770229;
        bh=WP2eDi6KVchBRDVnVVXz+FHJY7pgOayGruqTvD7qkCI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Ul5FRZvsGkR458edeIfMo7q0aNKnCixOSGWJ29KgiDRQpWFEqbRFL5+hoQbVJ7tb+
         xa9bmfcQd98FHJ5CrSoPLLWrGIOMiC6sOyjQqvt5sC/Pz8QCMMcmGuGR+FbNlvCgIK
         40XkHfJXH/W1NkLSGtiUgO0rchnPfFy198BckwQk=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x424ATfG038853
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 1 May 2019 23:10:29 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 1 May
 2019 23:10:28 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 1 May 2019 23:10:29 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x424AO2u069515;
        Wed, 1 May 2019 23:10:25 -0500
Subject: Re: [PATCH 0/2] Two ti-sysc driver fixes for v5.3 merge window
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
References: <20190501214129.12572-1-tony@atomide.com>
From:   Keerthy <j-keerthy@ti.com>
Message-ID: <3cb61934-0add-38f5-dd37-6fc597e0ed6b@ti.com>
Date:   Thu, 2 May 2019 09:40:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190501214129.12572-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 02/05/19 3:11 AM, Tony Lindgren wrote:
> Hi all,
> 
> Here are few fixes for the am335x d_can boot issue Sebastian reported for
> Beaglebone.

Tested for AM437x-gp-evm RTC+DDR mode and DS0.
Also tried DS0 on Am335x beaglebone black.

For the above:

Tested-by: Keerthy <j-keerthy@ti.com>

> 
> Regards,
> 
> Tony
> 
> 
> Tony Lindgren (2):
>    ARM: dts: Configure osc clock for d_can on am335x
>    bus: ti-sysc: Handle devices with no control registers
> 
>   arch/arm/boot/dts/am33xx-l4.dtsi | 14 ++++++--------
>   arch/arm/boot/dts/am437x-l4.dtsi |  4 ----
>   drivers/bus/ti-sysc.c            | 23 +++++++++++------------
>   3 files changed, 17 insertions(+), 24 deletions(-)
> 
