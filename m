Return-Path: <linux-omap+bounces-1790-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9DB93DEA8
	for <lists+linux-omap@lfdr.de>; Sat, 27 Jul 2024 12:11:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12B01283B21
	for <lists+linux-omap@lfdr.de>; Sat, 27 Jul 2024 10:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2494AED1;
	Sat, 27 Jul 2024 10:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jXJ4nb1l"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD49F8F6D;
	Sat, 27 Jul 2024 10:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722075052; cv=none; b=ijGxaDF5ise+9r20FJT4ioOtCEizP2xacI/8NERtuGvyngcf8ik8m73hhc3meEANKBpfEOIrSsuolaMhOujxZwFPgDOqGt52i+cCGBwUt1pARwp1VwAfh86RkeNymjYv5iM65UW25jg9uZKhO/2oOeFmd09IJBAWMmW+KyrE5wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722075052; c=relaxed/simple;
	bh=8BnOQTDpVSjt1UxIIy+Q+zej6BEce9p4SgqmrBP7Iok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P8+sl0P2ypPmcei0aVcZcHNSXDriIncEzSzkkbkZq28tV1U3nV9H/ltAid15s0yv6PCzxm1bE25p7gyx3TMO0tj6YXBldos4DXH00INliJqRhFZ/Xx9+hlSbGTBaCHj3QXuqWb547WMUqnWOfSdD8meOyBHHA+Dy3NysuZP6JrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jXJ4nb1l; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a7aa086b077so221399566b.0;
        Sat, 27 Jul 2024 03:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722075049; x=1722679849; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RAoTx2YOWG0TUxQhVBnkcscLbtSokAZXgREd031KPoQ=;
        b=jXJ4nb1lJy4K1rDrw2NBAGZN7FQABtrvPHSztQHY5X94fJk7KHqEdP710IJBSmYFDw
         lrVsNKE+WKksJ7m/PT8UX0x/cZYLDIs7ZPXXOAceAHv4rwV83392Q0+ZM0FVhzOPX1Pi
         GT83GoeGvrCUBMr9r0PVsFOIvvbaIMd5Qcghg7x54LPvfuO+XoMIDvMF8KvUNT8BROFM
         Ds+pnz5pow9t+bQAIlQhtbGA8ahZYSL5wKXZjULLp8wKW86PGkogpvjBaULl71W3XlTi
         CV0YfjEafKKkmwNKs+zTJ8JQJ1esfcKrVE3ycaaW9m4iJHKio3r+gd0rIpTGHPZANpFx
         5N4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722075049; x=1722679849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RAoTx2YOWG0TUxQhVBnkcscLbtSokAZXgREd031KPoQ=;
        b=CbZn7oDL8wQmgdxzP1Wby92CvjIu57dEJCzQa4kCVLB7ZE24Zt4KPqj1UdPObFbeH7
         MD5uVb3qxXH60sGRrpTqA3pYwzbOkEpso903Evvh80Dae5zuIeOhUdXfHd3Hz3cp82Zt
         mG+cTABJc/NrneJjiSBLJKNRhXoUD7jSuklgnX4cNjp1AOSeohG+u4yBAhB1asZpHglN
         zP5fnKa7RGG20GOkpJsc+x4U7nse8WFDlVSrO63pyfSyLB02YY8AOZxt1qxO9Skxb2Bw
         pulbWsUZY2R8odTbtjtDfPPaG2YSp/LwsSgY9bUtkT5RTZb8DexXYRXdIAvXeh4iJUg8
         FG/g==
X-Forwarded-Encrypted: i=1; AJvYcCVMeqX7Z1x3AXpNWeT6D6/Kq9crKN8tu22lMlas6NlXlZFVIpcpCbHYCIoG3YLCyuiuMAz6R4gBxfAZBzvhmdZ8PkEwvHjIb+iTiw==
X-Gm-Message-State: AOJu0YxjQbNyOHN341W2ynRJIqlKUz0libmT9/nr35pkGpuVDh1QuDrI
	Pp2xtL5WdH3wEyghVr6zvq1d6RCNkKuIvLffXZcynOP9qnPcMuKcJTxUqA==
X-Google-Smtp-Source: AGHT+IFn5gCIQzDkdSo0Patyt6O4Gezg9kBZCIP4k0qk9ASKQC7fAer46W7L4yuITdJi4cgIuJu6Uw==
X-Received: by 2002:a17:907:ca86:b0:a7a:a6e1:2c60 with SMTP id a640c23a62f3a-a7d4014c534mr63983066b.61.1722075048743;
        Sat, 27 Jul 2024 03:10:48 -0700 (PDT)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a7acab4dd63sm263063166b.55.2024.07.27.03.10.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jul 2024 03:10:48 -0700 (PDT)
Message-ID: <a08e6a76-6f01-4234-8102-675c32d1171f@gmail.com>
Date: Sat, 27 Jul 2024 12:10:46 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: omap: convert NVMEM content to layout syntax
To: =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240523042750.26238-1-zajec5@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20240523042750.26238-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23.05.2024 06:27, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Use cleaner (and non-deprecated) bindings syntax. See commit
> bd912c991d2e ("dt-bindings: nvmem: layouts: add fixed-layout") for
> details.

Ping? Could I get this PATCH picked up, please?


> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>   .../boot/dts/ti/omap/am335x-bone-common.dtsi  | 64 +++++++++++++------
>   arch/arm/boot/dts/ti/omap/am335x-boneblue.dts | 12 ++--
>   2 files changed, 52 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi b/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
> index 2d0216840ff5..898f862acf3e 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
> @@ -221,10 +221,14 @@ baseboard_eeprom: baseboard_eeprom@50 {
>   		reg = <0x50>;
>   		vcc-supply = <&ldo4_reg>;
>   
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		baseboard_data: baseboard_data@0 {
> -			reg = <0 0x100>;
> +		nvmem-layout {
> +			compatible = "fixed-layout";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			baseboard_data: baseboard_data@0 {
> +				reg = <0 0x100>;
> +			};
>   		};
>   	};
>   };
> @@ -239,40 +243,60 @@ &i2c2 {
>   	cape_eeprom0: cape_eeprom0@54 {
>   		compatible = "atmel,24c256";
>   		reg = <0x54>;
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		cape0_data: cape_data@0 {
> -			reg = <0 0x100>;
> +
> +		nvmem-layout {
> +			compatible = "fixed-layout";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			cape0_data: cape_data@0 {
> +				reg = <0 0x100>;
> +			};
>   		};
>   	};
>   
>   	cape_eeprom1: cape_eeprom1@55 {
>   		compatible = "atmel,24c256";
>   		reg = <0x55>;
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		cape1_data: cape_data@0 {
> -			reg = <0 0x100>;
> +
> +		nvmem-layout {
> +			compatible = "fixed-layout";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			cape1_data: cape_data@0 {
> +				reg = <0 0x100>;
> +			};
>   		};
>   	};
>   
>   	cape_eeprom2: cape_eeprom2@56 {
>   		compatible = "atmel,24c256";
>   		reg = <0x56>;
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		cape2_data: cape_data@0 {
> -			reg = <0 0x100>;
> +
> +		nvmem-layout {
> +			compatible = "fixed-layout";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			cape2_data: cape_data@0 {
> +				reg = <0 0x100>;
> +			};
>   		};
>   	};
>   
>   	cape_eeprom3: cape_eeprom3@57 {
>   		compatible = "atmel,24c256";
>   		reg = <0x57>;
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		cape3_data: cape_data@0 {
> -			reg = <0 0x100>;
> +
> +		nvmem-layout {
> +			compatible = "fixed-layout";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			cape3_data: cape_data@0 {
> +				reg = <0 0x100>;
> +			};
>   		};
>   	};
>   };
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts b/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
> index 801399702547..8878da773d67 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
> @@ -317,10 +317,14 @@ baseboard_eeprom: baseboard_eeprom@50 {
>   		compatible = "atmel,24c256";
>   		reg = <0x50>;
>   
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		baseboard_data: baseboard_data@0 {
> -			reg = <0 0x100>;
> +		nvmem-layout {
> +			compatible = "fixed-layout";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			baseboard_data: baseboard_data@0 {
> +				reg = <0 0x100>;
> +			};
>   		};
>   	};
>   };


