Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B3CC5241A4
	for <lists+linux-omap@lfdr.de>; Thu, 12 May 2022 02:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349729AbiELAmA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 May 2022 20:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349727AbiELAl7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 May 2022 20:41:59 -0400
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEF2E52B06
        for <linux-omap@vger.kernel.org>; Wed, 11 May 2022 17:41:54 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24C0fjsM092972;
        Wed, 11 May 2022 19:41:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1652316105;
        bh=uVAoK6kMtrMqKVCyOJrgU2Lp+FYJmg+rDf3XO+igPSs=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=vPtAAkNj5YZ8Xhb+ICsyTV4Q/XeGShxuLkka2IIwv7+mZb5HiHyr508oiu0fNRb2g
         N4elQnMW0h4yzCtjgVKRLYWMEWBJtXRaRViw1mQS1Rk+gwkftjKiXu6DnpzUSVCfYX
         dZQP9bkgQzcE1G4TGajigB+aigpQyHpOXGRvp6Hk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24C0fjbI050146
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 11 May 2022 19:41:45 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 11
 May 2022 19:41:44 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 11 May 2022 19:41:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24C0fimu110654;
        Wed, 11 May 2022 19:41:44 -0500
Date:   Wed, 11 May 2022 19:41:44 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Kevin Hilman <khilman@baylibre.com>
CC:     <linux-omap@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Guillaume La Roque <glaroque@baylibre.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am625-sk: enable ramoops
Message-ID: <20220512004144.zouvn2462jpqkmmw@curliness>
References: <20220511212824.3652309-1-khilman@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220511212824.3652309-1-khilman@baylibre.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 14:28-20220511, Kevin Hilman wrote:
> From: Guillaume La Roque <glaroque@baylibre.com>
> 
> enable ramoops fetures to easily debug some issues

^^ spell check etc..
> 
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am625-sk.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am625-sk.dts b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
> index 0de4113ccd5d..ff22bb7887d0 100644
> --- a/arch/arm64/boot/dts/ti/k3-am625-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
> @@ -53,6 +53,15 @@ wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9db00000 {
>  			reg = <0x00 0x9db00000 0x00 0xc00000>;
>  			no-map;
>  		};
> +
> +		ramoops@e0000000 {
> +			compatible = "ramoops";
> +			reg = <0x0 0xe0000000 0x0 0x00100000>;

Could you use [1] and keep the reservation under 512MB?

./create-mem_map.py -i -b 0xa0000000 -m optee:0x01800000 tf-a:524288 lpm_cntx_save:524288 dm:12582912 mcu_m4fss_dma_memory_region:0x100000 mcu_m4fss_memory_region:0xf00000 ramoops:0x100000

> +			record-size = <0x8000>;
> +			console-size = <0x8000>;
> +			ftrace-size = <0x0>;
> +			pmsg-size = <0x8000>;
> +		};
>  	};
>  
>  	vmain_pd: regulator-0 {
> -- 
> 2.34.0
> 

[1] https://gist.github.com/nmenon/13b135e8ba29531395de205903471b15
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
