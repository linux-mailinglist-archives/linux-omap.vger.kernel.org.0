Return-Path: <linux-omap+bounces-3052-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8EEA0782C
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 14:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAA0C18890AF
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 13:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76AB5217F41;
	Thu,  9 Jan 2025 13:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b="SQNeILdH"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5E11FFC4E
	for <linux-omap@vger.kernel.org>; Thu,  9 Jan 2025 13:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736430689; cv=none; b=kpU+P3C0lcJ/RhlX8ejiGdtYgmXhrORfMzvxUxuWdkP7dQvBRX+p5pQjuG3D+6J3yPNDhB6RvJ177vAWyPiqmuFZLywu0hbMiKnEHmjF4DwMxeI/wno5KiiFTzPMu58XJEYcdSw2dGRNE+0nILjnKve6KvgJ7ElSB1Pdsb1OjNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736430689; c=relaxed/simple;
	bh=nPPGU/5i0/4rNcuCnNSlIB/B0EGtcfFTfauQ9U1+gFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aBOi4PtCsj7e1BDC6Y7uvtlrbqEt5mj3tjYWa6ELDz1w+KlAjKZm0xBgi1XPNCg+b6B5icQdoJdXDpiti48wzDCzlsEVYbXU10TOmYLrUt3uVdH88JEh/YJSSJtNT/bpXp9aMdUp0Q7D11ux+zMDBg1r+DxikVBf4kgP8XPS+tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b=SQNeILdH; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4362f61757fso9925705e9.2
        for <linux-omap@vger.kernel.org>; Thu, 09 Jan 2025 05:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1736430684; x=1737035484; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QqXsToV0HiRvEsZnF5hoveg3aYzeGpkKlIECOe2VD8g=;
        b=SQNeILdH1JpkQ4jbPX0rCNfwsW7egxtJqMZYCHxxfnI8JyVE1vT+BCusXDs6S1yrC5
         Iib27BOp0TdkycfknITzCa0IGs2c4k16zuoIa3qmcUjXI4ntu/Cs9wG4ogluHF3V1mZk
         xPIM3wk+Hnybozdz5jRcTd4OkEb7eTeEe9SIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736430684; x=1737035484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QqXsToV0HiRvEsZnF5hoveg3aYzeGpkKlIECOe2VD8g=;
        b=XBWMAd6O2mrlh0iqMVoQUv4sSK8IgPDx12/F1i/IPeyl1PrPnNAQ3jpLF4162jdgW8
         EPPd5PzLWQy13sCKXts9rimueC8OWhFU8+eTpgFwCHqtAn6WSkqsuzvIEZ/Bgzen3JGP
         7kCweuRM1KpL1E+ajE75hHNvVoXDw1IidiWW7N69azOXWeLz+tNrKHnnPOg3Cf6uX6wO
         8zd1znF3n037oSzxxJrXmvw4ZcUuBpTf5DErjZjBViFlLXrpW4gnM0DyaX9OrKuWJILi
         X/xiNgqMTbRED4yMe42Rmur2BUEM09bf6pMwOqemroo3a+JboVE/m31lRBhFIHoLmu8X
         saxA==
X-Forwarded-Encrypted: i=1; AJvYcCXbft4NuFwBOehXIOldW19l1RVwIXP9dsclxsevmxTdfrNOusxDfJ/1AbzCeIkthx2rG85bJWM3bSXI@vger.kernel.org
X-Gm-Message-State: AOJu0YyeOmv5krdaH/I/jBGGnAuMrOclq7OUU5VHPkFt85n1nWbn+Bkr
	zMY32vP0+mgXyuNNUKsG5fnBntR2nSpPQVmS8QnA1mWbv/aLv8csLuf5pdBJcxBqB/UdIkEeE3V
	J
X-Gm-Gg: ASbGncu5PZtFzBw5HmVdRF9ay04Wc9VOf/NlrPAoqo245Y0mbD3sMEA2v+eeBIr7pHI
	nndiv6Aslt1Q7FgthoUSR7NKWHH8VXbqmojTob8uwUWjeVvXKBbYngClqVTaF/ebbyztO94VUVb
	Ixc2kTOahJ7sEqVq1GSBkwL8aULQl+wHVfnfQdX4dHTsu3HjJa4QS5nFQpQvWeEfX0hQtykfQ3U
	CxCht24fGwbAvAUoNDV1cb9JFVqAtGMiNZoS66QxqCDm1/tLsWT8Cgf0KdEx5zbTzQg/h4fpc0I
	KMVY2dSWldnc+ovBUMKjwC4cm2OBHDRnNLVD+3pG98WMPY/40VQERgb7drZ9OEdAdUZWuicavT/
	Sk0lG8QCLRO16SAB7
X-Google-Smtp-Source: AGHT+IGCwLti8xz/uAXqjvFyEfZu8OW3NVEiOzPgOAaQKlMAAsxOUKHoSy2tGbVe3mXX1vMem7j5oQ==
X-Received: by 2002:a05:600c:1d1f:b0:434:f99e:a5b5 with SMTP id 5b1f17b1804b1-436e271cf4amr47062045e9.28.1736430684252;
        Thu, 09 Jan 2025 05:51:24 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f? (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2dc0f69sm55525035e9.13.2025.01.09.05.51.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 05:51:23 -0800 (PST)
Message-ID: <8ff7ca4f-227d-40c5-867d-497e03bef72a@smile.fr>
Date: Thu, 9 Jan 2025 14:51:23 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable
 ACSPCIE output for PCIe1
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, kristo@kernel.org, vigneshr@ti.com, nm@ti.com, afd@ti.com,
 Romain Naour <romain.naour@skf.com>
References: <20250109102627.1366753-1-romain.naour@smile.fr>
 <20250109102627.1366753-2-romain.naour@smile.fr>
 <eu5xmihnffmqas2x2ioleuzzvyfbffl5eqlwuqfe4mh6qa2rzy@7mmuxsbkmz4o>
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <eu5xmihnffmqas2x2ioleuzzvyfbffl5eqlwuqfe4mh6qa2rzy@7mmuxsbkmz4o>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Siddharth, All,

Le 09/01/2025 à 12:49, Siddharth Vadapalli a écrit :
> On Thu, Jan 09, 2025 at 11:26:27AM +0100, Romain Naour wrote:
> 
> Hello Romain,
> 
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
>> With this patch, we can remove "HACK: Sierra: Drive clock out" patch
>> applied on vendor kernel for BeagleBone AI-64:
>> https://openbeagle.org/beagleboard/linux/-/commit/ad65d7ef675966cdbc5d75f2bd545fad1914ba9b
> 
> [trimmed]
> 
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
>> index af3d730154ac..32a232a90100 100644
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
>> +		acspcie0_proxy_ctrl: syscon@18090 {
>> +			compatible = "ti,j721e-acspcie-proxy-ctrl", "syscon";
>> +			reg = <0x18090 0x4>;
> 
> 0x_0011_8090 is probably *not* the "PROXY" register i.e. it could be
> locked with the help of "CTRLMMR_LOCK0_KICK0" and "CTRLMMR_LOCK0_KICK1"
> registers, in which case the CTRL_MMR region needs to be unlocked to write
> to that register. On J784S4, that happens to be true, which is why the
> proxy register 0x_0011_a090 was used at [0]. Please test with 0x_0011_a090
> which is the "PROXY" register on J721E as well, i.e. it can be written to
> unconditionally.
> 
> [0]:
> https://lore.kernel.org/r/20240930111505.3101047-1-s-vadapalli@ti.com/

Thanks for the review!

Actually the Proxy0 vs Proxy1 choice is not really clear for me. We have two
proxy to reach the same register:

  CTRLMMR_ACSPCIE0_CTRL Register (Proxy0 Offset = 18090h; Proxy1 Offset = 1A090h)

From my testing both addresses works (maybe since my SoC is a general purpose one).

When and why Proxy1 must be used?

Otherwise I'm fine to use  0x_0011_a090.

Best regards,
Romain


> 
> [trimmed]
> 
> Regards,
> Siddharth.


