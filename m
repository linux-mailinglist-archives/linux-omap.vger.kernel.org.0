Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1299D1F9395
	for <lists+linux-omap@lfdr.de>; Mon, 15 Jun 2020 11:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728813AbgFOJfF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 15 Jun 2020 05:35:05 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:47812 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728411AbgFOJfF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 15 Jun 2020 05:35:05 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05F9Z1JB028757;
        Mon, 15 Jun 2020 04:35:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592213701;
        bh=Hh5bDu46FKnWsaHiQaJZRC4oLqQ1UDQANlpuKX2a/5o=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=StdSSRTQz4BpTRXgzU8AeSab+0iKkdFFbbdwTa5XiImeXTp7uWuE7tUOqkVdFZH8B
         6Ga35UtBnaLk4JaqHaueBXkbYN+qC9CP90lapVHSV4I2zf/B7ERPLXrJJgb7KYZa0S
         5ubthkLEBqywCtj5a1+DS8Bu/qTnkrbw/WmGqXdE=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05F9Z1To027648;
        Mon, 15 Jun 2020 04:35:01 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 15
 Jun 2020 04:35:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 15 Jun 2020 04:35:01 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05F9Yw9p130834;
        Mon, 15 Jun 2020 04:34:59 -0500
Subject: Re: [PATCH] ARM: dts: am5729: beaglebone-ai: fix rgmii phy-mode
To:     Drew Fustini <drew@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Vinod Koul <vkoul@kernel.org>
References: <20200611220951.GA3355634@x1>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <10637da2-8751-3c6f-cf1e-f0a53cca292d@ti.com>
Date:   Mon, 15 Jun 2020 12:34:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611220951.GA3355634@x1>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 12/06/2020 01:09, Drew Fustini wrote:
> Since commit cd28d1d6e52e ("net: phy: at803x: Disable phy delay for
> RGMII mode") the networking is broken on the BeagleBone AI which has
> the AR8035 PHY for Gigabit Ethernet [0].  The fix is to switch from
> phy-mode = "rgmii" to phy-mode = "rgmii-rxid".
> 
> Note: Grygorii Strashko made a similar phy-mode fix in 820f8a870f65 for
> other AM5729 boards.

commit ref is incorrect
> 
> [0] https://github.com/beagleboard/beaglebone-ai/blob/master/BeagleBone-AI_sch.pdf
> 
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Fixes: cd28d1d6e52e ("net: phy: at803x: Disable phy delay for RGMII mode")

Pls change fixed tag to
520557d4854b ARM: dts: am5729: beaglebone-ai: adding device tree
as this board DTB was merged only in 5.8.

> Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
>   arch/arm/boot/dts/am5729-beagleboneai.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/am5729-beagleboneai.dts b/arch/arm/boot/dts/am5729-beagleboneai.dts
> index 9877d7709d41..4c51c6b05e64 100644
> --- a/arch/arm/boot/dts/am5729-beagleboneai.dts
> +++ b/arch/arm/boot/dts/am5729-beagleboneai.dts
> @@ -505,7 +505,7 @@ &mac {
>   
>   &cpsw_emac0 {
>   	phy-handle = <&phy0>;
> -	phy-mode = "rgmii";
> +	phy-mode = "rgmii-rxid";
>   };
>   
>   &ocp {
> 

Thanks, pls fix above and you can add my
Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

-- 
Best regards,
grygorii
