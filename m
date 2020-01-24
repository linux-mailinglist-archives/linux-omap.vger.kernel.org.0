Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7EF814839C
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jan 2020 12:37:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732274AbgAXLhf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jan 2020 06:37:35 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:49162 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404431AbgAXLc0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Jan 2020 06:32:26 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00OBWNEE042050;
        Fri, 24 Jan 2020 05:32:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579865543;
        bh=UIHuy/MWjXgfz5O1NZVKDjd//Yhws3+i5WP1cnU1b7w=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=DrXgy2oe0n7cJlR1oU4k1x9RB0p5+P4HV4+XXZTgGThy0mQY5kmh2t1y3O4bXkhMB
         TuztgQA7V7l6uXEtUGTlIdWduf3VcHejGlwM3vGkIsD1x44glvpbPRxRJLdnugUIyY
         uN72q3VvmGo9HKDQAEJ00g28Pta1UoHqP/wb8VUs=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00OBWNkM127450
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 24 Jan 2020 05:32:23 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 24
 Jan 2020 05:32:22 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 24 Jan 2020 05:32:22 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00OBWJff098690;
        Fri, 24 Jan 2020 05:32:20 -0600
Subject: Re: [Patch v4 09/10] arm64: dts: k3-am65-main Add CAL node
To:     Benoit Parrot <bparrot@ti.com>, Tony Lindgren <tony@atomide.com>,
        <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20191211140558.10407-1-bparrot@ti.com>
 <20191211140558.10407-10-bparrot@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <dd203eea-f467-07a0-c578-cc6eeb512032@ti.com>
Date:   Fri, 24 Jan 2020 13:32:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191211140558.10407-10-bparrot@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 11/12/2019 16:05, Benoit Parrot wrote:
> Add CAL dtsi node for AM654 device. Including proper power-domains and
> clock properties.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>

Queued this and patch #10 up for 5.6, thanks.

-Tero

> ---
>   arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> index efb24579922c..551adcefcc83 100644
> --- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> @@ -624,4 +624,26 @@
>   		dma-coherent;
>   		interrupts = <GIC_SPI 355 IRQ_TYPE_EDGE_RISING>;
>   	};
> +
> +	cal: cal@6f03000 {
> +		compatible = "ti,am654-cal";
> +		reg = <0x0 0x06f03000 0x0 0x400>,
> +		      <0x0 0x06f03800 0x0 0x40>;
> +		reg-names = "cal_top",
> +			    "cal_rx_core0";
> +		interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
> +		ti,camerrx-control = <&scm_conf 0x40c0>;
> +		clock-names = "fck";
> +		clocks = <&k3_clks 2 0>;
> +		power-domains = <&k3_pds 2 TI_SCI_PD_EXCLUSIVE>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			csi2_0: port@0 {
> +				reg = <0>;
> +			};
> +		};
> +	};
>   };
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
