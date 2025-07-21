Return-Path: <linux-omap+bounces-4100-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 885E0B0CE2D
	for <lists+linux-omap@lfdr.de>; Tue, 22 Jul 2025 01:30:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 558E617CE7E
	for <lists+linux-omap@lfdr.de>; Mon, 21 Jul 2025 23:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3CE924676C;
	Mon, 21 Jul 2025 23:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YwYR1WqB"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A4B242D66;
	Mon, 21 Jul 2025 23:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753140609; cv=none; b=H6f8eAh5PKjp6rOQk5r1RvBoQ+KUHNtZ7QweYWacDylPtIpV2ajUpr81FP0v09wFyBFYI/ig0FtLelrQGdEAIlGy/wMgCI4tiID4OpcGSZWJRJPI/LfWc2aMUT16SS6lNU0sb7V5hzW7nOQVOFk64UvS2xEvezMVdJc8Wx5PeZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753140609; c=relaxed/simple;
	bh=1mVA3qtj+7u8uWG2B2BI4HIgM+5nWsnf7DvW3Tydo6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JyPGmFMqfeR+B+8oUlUpy2YIwI3+gPppzhzxI0+1MXaPu0xv5VLidhVLva1Dp9rwV7ZPdINlYhBliiOQWy/IFoKUY5Z/5LKwZG9d5I5lHV0rGWelm6JW6Tr4YTp1IkrfvHgzz/USdh6xv6qowmcqO09273f5EEkwKZN/Ht8zvOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YwYR1WqB; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56LNTxW8906802;
	Mon, 21 Jul 2025 18:29:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753140599;
	bh=QnOl9TFwV0HLisJeRRGeF8hqb3epTorUi0ml3BcDmwU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YwYR1WqBTuaHj0m5MkGEFl/yoPsaWRvGTcf7OgU1oYUJ1DT6OaK17ru8IUYEDwNDk
	 P2R7zwz4cP5O/BzKmOuJ5/LqK4ZNaZeK4s5MCEFETkKUiL/p6F1rAo38yDiDqKn2o6
	 WWQb1DX5sQI3B73kh/XjPYIBqD+ib249dp/frwNs=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56LNTxA51206817
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 21 Jul 2025 18:29:59 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 21
 Jul 2025 18:29:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 21 Jul 2025 18:29:58 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56LNTwCE087669;
	Mon, 21 Jul 2025 18:29:58 -0500
Message-ID: <15de4a9b-c81e-4eb2-9a3a-faf8b6571ad1@ti.com>
Date: Mon, 21 Jul 2025 18:29:58 -0500
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: am33xx-l4: fix UART compatible
To: Bruno Thomsen <bruno.thomsen@gmail.com>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20250721173741.6369-1-bruno.thomsen@gmail.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250721173741.6369-1-bruno.thomsen@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Bruno,

On 7/21/25 12:37 PM, Bruno Thomsen wrote:
> Fixes the following dtschema check warning:
> 
> serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
> 	['ti,am3352-uart', 'ti,omap3-uart'] is too long
> 	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
> 	'ti,am654-uart' was expected
> 	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
> 
> Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>

Thanks for the patch, I think you forgot to add Kevin Hilman to this
email, but other than that LGTM.

Reviewed-by: Judith Mendez <jm@ti.com>

> ---
>   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
> index d6a143abae5f..cef24aafed1a 100644
> --- a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
> @@ -200,7 +200,7 @@ SYSC_OMAP2_SOFTRESET |
>   			ranges = <0x0 0x9000 0x1000>;
>   
>   			uart0: serial@0 {
> -				compatible = "ti,am3352-uart", "ti,omap3-uart";
> +				compatible = "ti,am3352-uart";
>   				clock-frequency = <48000000>;
>   				reg = <0x0 0x1000>;
>   				interrupts = <72>;
> @@ -1108,7 +1108,7 @@ SYSC_OMAP2_SOFTRESET |
>   			ranges = <0x0 0x22000 0x1000>;
>   
>   			uart1: serial@0 {
> -				compatible = "ti,am3352-uart", "ti,omap3-uart";
> +				compatible = "ti,am3352-uart";
>   				clock-frequency = <48000000>;
>   				reg = <0x0 0x1000>;
>   				interrupts = <73>;
> @@ -1139,7 +1139,7 @@ SYSC_OMAP2_SOFTRESET |
>   			ranges = <0x0 0x24000 0x1000>;
>   
>   			uart2: serial@0 {
> -				compatible = "ti,am3352-uart", "ti,omap3-uart";
> +				compatible = "ti,am3352-uart";
>   				clock-frequency = <48000000>;
>   				reg = <0x0 0x1000>;
>   				interrupts = <74>;
> @@ -1770,7 +1770,7 @@ SYSC_OMAP2_SOFTRESET |
>   			ranges = <0x0 0xa6000 0x1000>;
>   
>   			uart3: serial@0 {
> -				compatible = "ti,am3352-uart", "ti,omap3-uart";
> +				compatible = "ti,am3352-uart";
>   				clock-frequency = <48000000>;
>   				reg = <0x0 0x1000>;
>   				interrupts = <44>;
> @@ -1799,7 +1799,7 @@ SYSC_OMAP2_SOFTRESET |
>   			ranges = <0x0 0xa8000 0x1000>;
>   
>   			uart4: serial@0 {
> -				compatible = "ti,am3352-uart", "ti,omap3-uart";
> +				compatible = "ti,am3352-uart";
>   				clock-frequency = <48000000>;
>   				reg = <0x0 0x1000>;
>   				interrupts = <45>;
> @@ -1828,7 +1828,7 @@ SYSC_OMAP2_SOFTRESET |
>   			ranges = <0x0 0xaa000 0x1000>;
>   
>   			uart5: serial@0 {
> -				compatible = "ti,am3352-uart", "ti,omap3-uart";
> +				compatible = "ti,am3352-uart";
>   				clock-frequency = <48000000>;
>   				reg = <0x0 0x1000>;
>   				interrupts = <46>;
> 
> base-commit: 89be9a83ccf1f88522317ce02f854f30d6115c41


