Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4061810B333
	for <lists+linux-omap@lfdr.de>; Wed, 27 Nov 2019 17:27:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbfK0Q1D (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Nov 2019 11:27:03 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:36838 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbfK0Q1D (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Nov 2019 11:27:03 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xARGQwU5081153;
        Wed, 27 Nov 2019 10:26:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574872018;
        bh=fHisvBIBAoznP9SStUQGCmWzYciuj3VJ7YuVmgMFYTQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Qg4yINOHO18ashtRNYMbXAG8N2adZG3kC6dmhnLLQf7sX9hMscPEqc3H2FT6T7W8l
         BB6Sw60I7A6vqvTzlJ+YwDaoyWvIhEbPtTbkI2PN0mBhS0Eo928UI4HBZFj0V8f1oI
         jmsTmXQkGzFJ3TfL9SO8Q6lp7ay3ZHwaxN2LLuvI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xARGQwwv020022;
        Wed, 27 Nov 2019 10:26:58 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 27
 Nov 2019 10:26:57 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 27 Nov 2019 10:26:57 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xARGQuJg072362;
        Wed, 27 Nov 2019 10:26:57 -0600
Subject: Re: [PATCH] ARM: dts: omap3: name mdio node properly
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>
References: <20191127153212.22209-1-grygorii.strashko@ti.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <2c2f3c8f-4062-f3ce-e1ce-aa128565b901@ti.com>
Date:   Wed, 27 Nov 2019 18:26:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191127153212.22209-1-grygorii.strashko@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 27/11/2019 17:32, Grygorii Strashko wrote:
> Rename davinci_mdio DT node "ethernet"->"mdio"
> This fixes the following DT schemas check errors:
> am3517-craneboard.dt.yaml: ethernet@5c030000: $nodename:0: 'ethernet@5c030000' does not match '^mdio(@.*)?'
> 
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---

This can be for next material.

>   arch/arm/boot/dts/am3517.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/am3517.dtsi b/arch/arm/boot/dts/am3517.dtsi
> index 76f819f4ba48..84e13778a64a 100644
> --- a/arch/arm/boot/dts/am3517.dtsi
> +++ b/arch/arm/boot/dts/am3517.dtsi
> @@ -74,7 +74,7 @@
>   			clock-names = "ick";
>   		};
>   
> -		davinci_mdio: ethernet@5c030000 {
> +		davinci_mdio: mdio@5c030000 {
>   			compatible = "ti,davinci_mdio";
>   			ti,hwmods = "davinci_mdio";
>   			status = "disabled";
> 

-- 
Best regards,
grygorii
