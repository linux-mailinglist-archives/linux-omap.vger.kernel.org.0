Return-Path: <linux-omap+bounces-2735-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FD09DA4A4
	for <lists+linux-omap@lfdr.de>; Wed, 27 Nov 2024 10:17:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37F0AB259E3
	for <lists+linux-omap@lfdr.de>; Wed, 27 Nov 2024 09:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01FD4191F81;
	Wed, 27 Nov 2024 09:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b="QS1Ga9rs"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE41047F69
	for <linux-omap@vger.kernel.org>; Wed, 27 Nov 2024 09:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732699053; cv=none; b=J5Tkf31kIHI33GoumgOUXCznvY0bRgEvtTjJ+xAJzHq8MxE1gH8pN3a9cuFPEp2RG+ESOrYJHutKfd3WEiwGjgkZhPEGuXXVPnOpvPz5Fur5Kf863+vIhY+xgyVQs6DFggULZI6bxlami5ECjNo2EawrrQItqDoBzP3FY9tj46k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732699053; c=relaxed/simple;
	bh=SnVhtZ1p4yeEVYL2tFjMBwc85AXYWLdsD6exlupbTuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eWhIxO9l7NL5ojM+UQEsfXsCgTOVGoWa1HPmCJuOAZWN/aheFJxKI8muFv7qx1MNKHhVlNNMyaHsm082zr78hw6kegAxh2VI+H7QzrkIFCQbyOkg/x1k94Fent9c0yMo25ZbFTOA9GXo/peEaz/380vdOW8IrSu9zdc2YrQJ5tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b=QS1Ga9rs; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38248b810ffso4933964f8f.0
        for <linux-omap@vger.kernel.org>; Wed, 27 Nov 2024 01:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1732699049; x=1733303849; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GAFheFVkotLm3wy7t+46i/2OSexrdWJFGKeEH7J88WI=;
        b=QS1Ga9rs5VKMgOFNRL/DnihZIsAIkwO/u7P6iiSvmXNjoFUMGet4uITerRtVsCjTbf
         ze6lIKpYoZ47ugyISmaKhcegN3EmRSTDbz0U69zt7rMp70fbz3cFFcii+/9xc+ZWZZWr
         PbPZeg4/CWd8q3bdy2ZVLaH1T7lPwFnwGVNc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732699049; x=1733303849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GAFheFVkotLm3wy7t+46i/2OSexrdWJFGKeEH7J88WI=;
        b=aJMISrp9/wi31srWxrtAbE61kjPb8ANSopxPIHJ0CmbwSQ8MoqC0kkZ2KjopLJPF4L
         AvgXgqCtnRqqhf/W0M7WWbua1vTM+O3SOSwHWFUYonDRmrFNy6MGTr2EJiGXzOtCobM/
         v7QYSA/kGG3cKF807vk6R2/kuHgbY1zlozB5TwW+K7e6AOPZT44lvCB0Mye5Ux7bg8iu
         RAAceEkJVJaXECpvMohy9tPl6V2MjF/LDrmIzLBnYrWBzPttD2byvMn3b3MVbCAiHlgG
         lVoeszutIycDITMPRQwxNpZRltMdGjMA42OdUQBhpjKa1Vobacb41G+EduBqxMtvDsGH
         repA==
X-Forwarded-Encrypted: i=1; AJvYcCWZMcGngVZla2CEfxXury9UwsyEimty2Dw9BWeLqvtG/obWSsVmWdWbZp+PpaGz24XXvNrxysT0PL3g@vger.kernel.org
X-Gm-Message-State: AOJu0YwDSqckHyWvPVffsoFxntwzZo7Z0Gm3OSDjLZloKsjupi33tEXL
	TLqZ2IP22ps2XmPkNkuO3eYjtVuNMwojKGqMOVeimlLkGKHYgga3aQCKr/eRKEQ=
X-Gm-Gg: ASbGnctnv+Q4fPJSfCjp61COW9pEpV6/QY2DaK0pnlKlDwCSEb/WO3huktnuS6qXIB5
	u7vXqiADUkSFXqcJIc+GDlJfezH51is9Sw05p5oQHBD8wPmjRMcIfBRWMkd2iikq3yBRXvJ0sUr
	CrHQhuou9wSc6h3VHaqqVajqTeXziOxYTWOhnltpuhglfn4Pwi954VIPyoL2myS7rFCYd5o/H9c
	VEY9JpRnsKTBEjltXdnDg/Ck+VJ1N8wwmr21CEHFr8EO3mVxqhtO2Fb/ml0NACGg3yV0Hbb/hyW
	ZTAXlOguvPbhB+mXWNb6kKFl+FEINZ6PgXct/w==
X-Google-Smtp-Source: AGHT+IHMfWTM2iJ94uv0iDMqL2dLO7VcGnFqdboNj1Fdq2fH3veFKQ+TuqEWJS1JJOImhanrQYAJIw==
X-Received: by 2002:a5d:47cb:0:b0:382:22c6:7bcb with SMTP id ffacd0b85a97d-385c6eb4c32mr1924315f8f.3.1732699049143;
        Wed, 27 Nov 2024 01:17:29 -0800 (PST)
Received: from [10.5.90.17] (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd04ef5sm15685520f8f.111.2024.11.27.01.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 01:17:28 -0800 (PST)
Message-ID: <32e81174-8a17-4f29-b338-0dbd0d7e498b@smile.fr>
Date: Wed, 27 Nov 2024 10:17:28 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-j721e-beagleboneai64: Enable ACSPCIE
 output for PCIe1
To: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, kristo@kernel.org,
 vigneshr@ti.com, nm@ti.com, Romain Naour <romain.naour@skf.com>
References: <20241126173307.4054601-1-romain.naour@smile.fr>
 <5e2d2174-44a7-4143-8562-4dcdb5ad6c94@kernel.org>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <5e2d2174-44a7-4143-8562-4dcdb5ad6c94@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Le 26/11/2024 à 20:04, Krzysztof Kozlowski a écrit :
> On 26/11/2024 18:33, Romain Naour wrote:
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
>> Signed-off-by: Romain Naour <romain.naour@skf.com>
>> ---
>> With this patch, we can remove "HACK: Sierra: Drive clock out" patch
>> applied on vendor kernel for BeagleBone AI-64:
>> https://openbeagle.org/beagleboard/linux/-/commit/ad65d7ef675966cdbc5d75f2bd545fad1914ba9b
>> ---
>>  arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts |  4 ++++
>>  arch/arm64/boot/dts/ti/k3-j721e-main.dtsi          | 10 ++++++++--
>>  2 files changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
>> index fb899c99753e..681e3af7ce6e 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
>> @@ -859,6 +859,10 @@ &pcie1_rc {
>>  	num-lanes = <2>;
>>  	max-link-speed = <3>;
>>  	reset-gpios = <&main_gpio0 22 GPIO_ACTIVE_HIGH>;
>> +	/* There is no on-board or external reference clock generators,
> 
> Please use generic style comments, not netdev.

Fixed.

> 
>> +	 * use refclk from the ACSPCIE module's PAD IO Buffers.
>> +	 */
>> +	ti,syscon-acspcie-proxy-ctrl = <&acspcie0_proxy_ctrl 0x3>;
>>  };
>>  
>>  &ufs_wrapper {
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> index 0da785be80ff..9f47e7672922 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> @@ -5,6 +5,7 @@
>>   * Copyright (C) 2016-2024 Texas Instruments Incorporated - https://www.ti.com/
>>   */
>>  #include <dt-bindings/phy/phy.h>
>> +#include <dt-bindings/phy/phy-cadence.h>
>>  #include <dt-bindings/phy/phy-ti.h>
>>  #include <dt-bindings/mux/mux.h>
>>  
>> @@ -82,6 +83,11 @@ ehrpwm_tbclk: clock-controller@4140 {
>>  			reg = <0x4140 0x18>;
>>  			#clock-cells = <1>;
>>  		};
>> +
>> +		acspcie0_proxy_ctrl: acspcie0-ctrl@18090 {
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

I updated to: "acspcie0_proxy_ctrl: acspcie-ctrl@18090"

> 
> 
>> +			compatible = "ti,j784s4-acspcie-proxy-ctrl", "syscon";
> 
> I am not familiar with naming, so is this j784s4 or j721e or K3 SoC?
> Compatible should be SoC specific.

Me neither.

"ti,j784s4-acspcie-proxy-ctrl" compatible is the only one available in the
syscon devicetree binding. Should we add a new "ti,j721e-acspcie-proxy-ctrl"?

This patch is adapted from a recent commit on the TI's kernel for the j784s4 Soc:
https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=ti-rt-linux-6.6.y&id=bb4442cd523d6e34c5db43fd78c9f579d6937f6a

There is another example with "ti,j784s4-pcie-ctrl" compatible used from
k3-j722s-main.dtsi:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi?h=v6.12.1#n240

Though?

Best regards,
Romain

> 
> Best regards,
> Krzysztof


