Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06457C8BC6
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2019 16:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727160AbfJBOso (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Oct 2019 10:48:44 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:39640 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbfJBOsn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 2 Oct 2019 10:48:43 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92EmdiY050438;
        Wed, 2 Oct 2019 09:48:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570027719;
        bh=JiffS4ZfsZeTjYUTRmO0KXVyJua2BpQysZ+4TqjyF1A=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=A38PTkh4pMW6ZPa2U6TdfqvlF4nOs2kq4dMsYePi3CUyyME1MJUqaqNZ+oE9xRkjE
         EDvlZupc135Ftsm2fLufRhmrJntlb/832RzTsLzmull8q7Zu9syc0YYG6VGaf+ABpL
         xMznG/2UnLUJT3PGXSO/pp9IP33tljFHQ1fuC5OA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92Emduf032530;
        Wed, 2 Oct 2019 09:48:39 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 09:48:38 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 09:48:38 -0500
Received: from [10.250.98.116] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92Emb8Z077626;
        Wed, 2 Oct 2019 09:48:37 -0500
Subject: Re: [PATCH] ARM: dts: am335x-sancloud-bbe: Fix PHY mode for ethernet
To:     Jeroen Hofstee <jhofstee@victronenergy.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
CC:     Koen Kooi <koen@dominion.thruhere.net>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20191002095416.19603-1-jhofstee@victronenergy.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <d027ef07-807d-6a7b-2939-b67be4542469@ti.com>
Date:   Wed, 2 Oct 2019 17:48:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002095416.19603-1-jhofstee@victronenergy.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 02/10/2019 12:54, Jeroen Hofstee wrote:
> cd28d1d6e52e: ("net: phy: at803x: Disable phy delay for RGMII mode") broke
> the ethernet networking on the beaglebone enhanced.

Above commit is incorrect (by itself) and there are few more commits on top of
it, so pls. update reference to commit(s)

bb0ce4c1517d net: phy: at803x: stop switching phy delay config needlessly
6d4cd041f0af net: phy: at803x: disable delay only for RGMII mode


> 
> The board relied on the bug in the at803x driver to always enable the rx
> delay. So change the phy-mode to rgmii-id so it is enabled again.
> 
> Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
> cc: Koen Kooi <koen@dominion.thruhere.net>
> ---
>   arch/arm/boot/dts/am335x-sancloud-bbe.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/am335x-sancloud-bbe.dts b/arch/arm/boot/dts/am335x-sancloud-bbe.dts
> index 8678e6e35493..e5fdb7abb0d5 100644
> --- a/arch/arm/boot/dts/am335x-sancloud-bbe.dts
> +++ b/arch/arm/boot/dts/am335x-sancloud-bbe.dts
> @@ -108,7 +108,7 @@
>   
>   &cpsw_emac0 {
>   	phy-handle = <&ethphy0>;
> -	phy-mode = "rgmii-txid";
> +	phy-mode = "rgmii-id";
>   };
>   
>   &i2c0 {
> 

-- 
Best regards,
grygorii
