Return-Path: <linux-omap+bounces-3077-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6BDA08A91
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jan 2025 09:41:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A50F17A14D6
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jan 2025 08:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A5F2080F3;
	Fri, 10 Jan 2025 08:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b="MZVG++2k"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F358206F35
	for <linux-omap@vger.kernel.org>; Fri, 10 Jan 2025 08:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736498494; cv=none; b=oMAYJFbs58Ehxwl+XL8FUzc5fzD5FMOZ/nxyISrrQffbJeHg8HtWwUUNdZFl6aJKMIdrPhPwaUKfGKt8OhgGcj8xtCZE+SN+w1t+2MZ9zdFtQwdpT9qCA4uSbNlL00Qwft1+1lwlfxSCe9DBRE0Pj0XyX0Xe4r2VpZeri0D/gYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736498494; c=relaxed/simple;
	bh=0IqeVllaUh7ThBSBQLFk9YO6SPPXXAdKGTa3syPvMHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MkvRX1CYs5u14N5QlsDtpcFpFcxpU64G/YoJmf7+0C4hJBTXEL6Ndr15X5pZChu8gMpNm1CZWMfwJFeoYXq5yEyQg1KA4+T1kIW43aaqsh/u2qb1vJ9kzYaWaz2ZLwe5YWf+qS6QPu0Jsfrno4+Ev9q8XwrZUC7YiDl7S3QWB9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b=MZVG++2k; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436345cc17bso13468295e9.0
        for <linux-omap@vger.kernel.org>; Fri, 10 Jan 2025 00:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1736498490; x=1737103290; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LTAxuGuX2HjIb+J0nINSN6pIxAxGSTuzZRb6v1F8YcU=;
        b=MZVG++2kcVZw6PqaSGKmpWxj5lzj0ussqxNwUV/fdBRmz4uyhV/i5PZThUSNnpyh4Y
         gw0l1nNLSoDjaFi4sG1EDHpp95sFtmPqpZbXEibmkiLxxGKWSjR+p+nlshVxAWqZOul/
         KhRhDmSqSZKMxvIyzUHHygE8L6P+f8GmFTYQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736498490; x=1737103290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LTAxuGuX2HjIb+J0nINSN6pIxAxGSTuzZRb6v1F8YcU=;
        b=XY4G3sJK3pDjhmg5MU9/J8Bk5gBNFnNmvX9y+mVeggUr4WXkYYYcdM+lWitvUM0Jyc
         c+5Sju97oHk4QIgurLUH39IqJHokL8gkSd6olJ4OwrA4lU54/k7J0T9zU6bSFv+ANyqX
         SkGaiYbgv3gY6eI64R0BczsRXgZkaYehRap7DNCwaeF+IYI/MlgxfSBwk4av3pVwmAvy
         txb3WeIq3x8EWY7GBRPGDQ/OfsNBoc14wkyvyHe8CWF0DtUMZPLw67f64Fs0uqbts+vy
         07oXs6n6e+9szaNXIm/0rvwJCBr9kKiSPDIJ9EWNSmY/u/KZd8Wbe8RJBymq+9XBCb+5
         Ai1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUylFtDugbk5G0XXrr6JhyXVNULllMXbzIJCoedISMHt6XWFLBxXMvpRFmydmSI8JV2B2lirTHMTxYA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzug+G5IsIDNqqjakhL1VUCGme5HjK8Vq2wRE3DL1kEOgnXeMF7
	tvr2ruDKjLrsLHEgzFEy9p2lSBimjKqjx+NhZqnYwA88NpQCAnnCyZYWeFvbn8g=
X-Gm-Gg: ASbGncuyQiBmXPysvzAXUDmaO+K/qn3rFyyo34EQemGn77i3JQEljCaksJ3KpBa/XVH
	hkAJPYdbBb1dJrq+KJ/FNHFZKBFf8G/3JWm4oTijniG5Luax7IMBTC/eqRxuluUXmHwHbAssbeb
	eN2K+lsOkC3JyQlzmkOPzX6PpLQGUwb40cEMmodJcuIaGunndrC/+s9wQ0iQKID5ABAB/AHjFFu
	WOl/b25vjC+VGDhr/HcdFPLkcVDk/QeI5iBzUJhBwzno3Q1GoimOs56ROOe2BIAey4ZIWu+dhhl
	0yWgG2azRlHINdnQWQxaMS/3Lr0jxpZoWx0/ftVy3H1iKY22VDqQjd+p2SSK2xH6+dNdc+xrB9J
	C4aOMlmjN7MytajKC
X-Google-Smtp-Source: AGHT+IHdAZINf3kifHqwtZwu3U7P3daEmJ6BNIfnwadkS9VZOq9RloQ0s4HchXw0ErbNx4rkN2q6NA==
X-Received: by 2002:a5d:64eb:0:b0:385:ec89:2f07 with SMTP id ffacd0b85a97d-38a87312d2emr8481678f8f.32.1736498490553;
        Fri, 10 Jan 2025 00:41:30 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f? (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436dd11ddfdsm68561515e9.1.2025.01.10.00.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 00:41:30 -0800 (PST)
Message-ID: <d788bec1-f0e1-4fbd-8d4b-480d811de990@smile.fr>
Date: Fri, 10 Jan 2025 09:41:29 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable
 ACSPCIE output for PCIe1
To: Andrew Davis <afd@ti.com>, devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, kristo@kernel.org,
 vigneshr@ti.com, nm@ti.com, Romain Naour <romain.naour@skf.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>
References: <20250109102627.1366753-1-romain.naour@smile.fr>
 <20250109102627.1366753-2-romain.naour@smile.fr>
 <90f47fae-a493-471d-8fe6-e7df741161be@ti.com>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <90f47fae-a493-471d-8fe6-e7df741161be@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Andrew, All,

Le 09/01/2025 à 16:58, Andrew Davis a écrit :
> On 1/9/25 4:26 AM, Romain Naour wrote:
>> From: Romain Naour <romain.naour@skf.com>
>>
>> Unlike the SK-TDA4VM (k3-j721e-sk) board, there is no clock generator
>> (CDCI6214RGET) on the BeagleBone AI-64 (k3-j721e-beagleboneai64) to
>> provide PCIe refclk signal to PCIe Endponts. So the ACSPCIE module must
>> provide refclk through PCIe_REFCLK pins.
>>
>> Use the new "ti,syscon-acspcie-proxy-ctrl" property to enable ACSPCIE
>> module's PAD IO Buffers.
>>
>> Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
>> Signed-off-by: Romain Naour <romain.naour@skf.com>
>> ---

[...]

>> ---
>>   arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts |  5 +++++
>>   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi          | 10 ++++++++--
>>   2 files changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts b/arch/arm64/
>> boot/dts/ti/k3-j721e-beagleboneai64.dts
>> index fb899c99753e..741ad2ba6fdb 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
>> @@ -859,6 +859,11 @@ &pcie1_rc {
>>       num-lanes = <2>;
>>       max-link-speed = <3>;
>>       reset-gpios = <&main_gpio0 22 GPIO_ACTIVE_HIGH>;
>> +    /*
>> +     * There is no on-board or external reference clock generators,
>> +     * use refclk from the ACSPCIE module's PAD IO Buffers.
>> +     */
>> +    ti,syscon-acspcie-proxy-ctrl = <&acspcie0_proxy_ctrl 0x3>;
>>   };
>>     &ufs_wrapper {
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/
>> ti/k3-j721e-main.dtsi
>> index af3d730154ac..32a232a90100 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> @@ -5,6 +5,7 @@
>>    * Copyright (C) 2016-2024 Texas Instruments Incorporated - https://www.ti.com/
>>    */
>>   #include <dt-bindings/phy/phy.h>
>> +#include <dt-bindings/phy/phy-cadence.h>
>>   #include <dt-bindings/phy/phy-ti.h>
>>   #include <dt-bindings/mux/mux.h>
>>   @@ -82,6 +83,11 @@ ehrpwm_tbclk: clock-controller@4140 {
>>               reg = <0x4140 0x18>;
>>               #clock-cells = <1>;
>>           };
>> +
>> +        acspcie0_proxy_ctrl: syscon@18090 {
>> +            compatible = "ti,j721e-acspcie-proxy-ctrl", "syscon";
>> +            reg = <0x18090 0x4>;
>> +        };
> 
> You'll still need to add to the J721e system controller binding or this
> will throw a DT check warning, something like this:
> 
> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-
> controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-
> controller.yaml
> index 378e9cc5fac2a..3323f3bc976e0 100644
> --- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> +++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> @@ -68,6 +68,12 @@ patternProperties:
>      description:
>        The node corresponding to SoC chip identification.
>  
> +  "^acspcie-ctrl@[0-9a-f]+$":
> +    type: object
> +    $ref: /schemas/mfd/syscon.yaml#
> +    description:
> +      This is the ASPCIe control region.
> +
>  required:
>    - compatible
>    - reg

Thanks!

To fix the warning I had to use "^syscon@[0-9a-f]+$" instead.
During the review, "syscon@" was recommended instead of "acspcie-ctrl@" [1]

  acspcie0_proxy_ctrl: syscon@18090 {

[1]
https://lore.kernel.org/linux-devicetree/5e2d2174-44a7-4143-8562-4dcdb5ad6c94@kernel.org/

Best regards,
Romain


> 
>>       };
>>         main_ehrpwm0: pwm@3000000 {
>> @@ -979,8 +985,8 @@ pcie1_rc: pcie@2910000 {
>>           max-link-speed = <3>;
>>           num-lanes = <2>;
>>           power-domains = <&k3_pds 240 TI_SCI_PD_EXCLUSIVE>;
>> -        clocks = <&k3_clks 240 1>;
>> -        clock-names = "fck";
>> +        clocks = <&k3_clks 240 1>, <&serdes1 CDNS_SIERRA_DERIVED_REFCLK>;
>> +        clock-names = "fck", "pcie_refclk";
>>           #address-cells = <3>;
>>           #size-cells = <2>;
>>           bus-range = <0x0 0xff>;


