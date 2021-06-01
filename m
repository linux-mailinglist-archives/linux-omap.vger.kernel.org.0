Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 308F23973CF
	for <lists+linux-omap@lfdr.de>; Tue,  1 Jun 2021 15:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233584AbhFANIL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Jun 2021 09:08:11 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58774 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233064AbhFANIL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Jun 2021 09:08:11 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 151D6Q6j106703;
        Tue, 1 Jun 2021 08:06:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622552786;
        bh=o36+UT79yRWG800wqh1ZlLS2Eiyv4O/MRNJbjiTzdfQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=jtTEcljPal68iIHSOe6NJ1bP8c8mZAGmw1YKsGjfyzI+IHKlMi84zRZ82KIu73LPp
         Xr2Z8oW0SKOuQbj4KsfzX7Sv1VPYK8Roajp9hsAKqo5mSob3hnTiCPXQp+j0jHuOjP
         AJEFxbCn38Z8glC2yX/L4yAeqN7g2/qwichS+rMA=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 151D6QbR092010
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Jun 2021 08:06:26 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 1 Jun
 2021 08:06:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 1 Jun 2021 08:06:25 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 151D6M5P122485;
        Tue, 1 Jun 2021 08:06:23 -0500
Subject: Re: [PATCH 2/3] ARM: dts: ti: Fix node name for all ecap dt nodes
To:     Lokesh Vutla <lokeshvutla@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Vignesh R <vigneshr@ti.com>,
        Nishanth Menon <nm@ti.com>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
References: <20210601092457.5039-1-lokeshvutla@ti.com>
 <20210601092457.5039-3-lokeshvutla@ti.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <bdd0e608-a419-b523-cd76-6dbf8c3d20af@ti.com>
Date:   Tue, 1 Jun 2021 16:06:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210601092457.5039-3-lokeshvutla@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 01/06/2021 12:24, Lokesh Vutla wrote:
> dtbs_check produces the following warning for ecap node name:
> ecap@100: $nodename:0: 'ecap@100' does not match '^pwm(@.*|-[0-9a-f])*$'
> 
> Fix this by replacing ecap with pwm in node name
> 
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>   arch/arm/boot/dts/am335x-cm-t335.dts | 2 +-
>   arch/arm/boot/dts/am335x-evm.dts     | 2 +-
>   arch/arm/boot/dts/am335x-evmsk.dts   | 2 +-
>   arch/arm/boot/dts/am33xx-l4.dtsi     | 6 +++---
>   arch/arm/boot/dts/am437x-l4.dtsi     | 6 +++---
>   arch/arm/boot/dts/da850.dtsi         | 6 +++---
>   arch/arm/boot/dts/dra7-l4.dtsi       | 6 +++---
>   7 files changed, 15 insertions(+), 15 deletions(-)
> 

Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

-- 
Best regards,
grygorii
