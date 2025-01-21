Return-Path: <linux-omap+bounces-3152-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A7AA187DB
	for <lists+linux-omap@lfdr.de>; Tue, 21 Jan 2025 23:50:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C740188B78C
	for <lists+linux-omap@lfdr.de>; Tue, 21 Jan 2025 22:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453AD1F893F;
	Tue, 21 Jan 2025 22:50:45 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812A318AE2
	for <linux-omap@vger.kernel.org>; Tue, 21 Jan 2025 22:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737499845; cv=none; b=UOUjo04nvwcCDx9bNXtCPFwb0ZFvbO82g5ZVedaZd90JApnloS15W7JPSdcOMx6m4ByCIdIAyVG6xzsVn1T/KEyhKEXAsP5kplf73hRD6hjy6sgxaiBUlxat2IHnnk/zf42m9wCgviolLVvegjyQ+4HrgyWaI5L6ayHV+iZ4Aps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737499845; c=relaxed/simple;
	bh=J/09iJn/f8OIFoYmfEGJR1plKN5XM4G4egV7j6tGXdU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BcaBVExKB9bMBBkUnOfPb5ZAgCNlOkE5t+oxxvA2b8a+TMPdVRZCyJoXfczWLvrHvjp0sJ2UQ6/qSEERd1pBfLm5O1isgFY8HRlPdiApwJXwlVJZBj3Y3xvwOGo2QPdx27JeN6Ro3Pm63ngvhHTc5LP8hvh+/a7DSdG7p6Uh36w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2161eb94cceso78208815ad.2
        for <linux-omap@vger.kernel.org>; Tue, 21 Jan 2025 14:50:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737499843; x=1738104643;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eY/bocEY4/ixO9G6Mvr/Z5L8XQkKrCMbNaB8Z7NbGGs=;
        b=FWhrtE4vdKQ60dS8WDnBvIoTleor7ifMQx+FC6PgwdaIqZPN3ydIaYw2HJEc/RRRW3
         1aarejI30Zp256WNZikziQQjWgaK6SRxbCY2uYoP6auDsluIwq6GuaIhOXK4UuI40TrO
         l/CJEbwoam5D8hsONn7jhLDtjb/tiBcRsyq6UCD/2Z9X+zpVmPqang4c8NoC1fk2czyV
         rIGMgN6pFSPZRZIfRxuGfW4X3EoYCJo7S5XBmv14BIa9VEKUHOxx+Sy707N0poOtWHgK
         Y2Yl5ZQtZfA+B6bj7XvPXaqHIWN2N/vL8yUKqe8z9CObbh+HpaaEI/nocnvkfvZMnTGV
         ioTg==
X-Forwarded-Encrypted: i=1; AJvYcCUtzHTp1FeeOTgFe1xwADaHkyO5Ayyu3TIihidoioYAIUYbTYIvky1xQ2FOxHp9ieCO1YoQhG/uJ7Jj@vger.kernel.org
X-Gm-Message-State: AOJu0YxTSSbxHDniC3kmhfGFXQe8Xuqf46FYB9kbpBYZeZEu3r0kQPV1
	0w1zzOu9YSpJHI3MFLJIy45w2t4NE3KktybB8w91EQxHBju/ivD5YCNs9rwwuPw=
X-Gm-Gg: ASbGncsUqb2FNw51EXYT0mbl4eJwYr8BCVmMFIcSGsxgIiLbwacr12bbzAu0vHaaTAD
	S/VYvCQieR92+112reLNmwqvUR0kiJpMAoDQ3LikGFfbNtkF29C1yvkiV4ripFoyvokMcLvQID/
	0oGu4wR27713XPQRi60KD4Vwp+sYpoGVSO3pZ9mFMGdxEqxGq/6uw8vbEF6T/6xyQqLu4WBUKnh
	cNchX4uC0iR8zoPIxJmZkBO7BAuHLiW9IyW1SvvbF04alrUma0mguDytZapyi1b/zGt
X-Google-Smtp-Source: AGHT+IHaaAXCvryBAXeNGBTJxWdGI8mRRoTbDGvpoGAQHpPdsSxC9BsUktepgvmvmzRhBvsfjx8DQQ==
X-Received: by 2002:a05:6a21:998d:b0:1e1:b28e:a148 with SMTP id adf61e73a8af0-1eb2144d513mr25264291637.5.1737499842764;
        Tue, 21 Jan 2025 14:50:42 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dabaa6407sm9649528b3a.163.2025.01.21.14.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 14:50:42 -0800 (PST)
From: Kevin Hilman <khilman@kernel.org>
To: Tom Rini <trini@konsulko.com>, linux-kernel@vger.kernel.org
Cc: Nishanth Menon <nm@ti.com>, Tony Lindgren <tony@atomide.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: omap4-panda-a4: Add missing model and
 compatible properties
In-Reply-To: <20250121200749.4131923-1-trini@konsulko.com>
References: <20250121200749.4131923-1-trini@konsulko.com>
Date: Tue, 21 Jan 2025 14:50:41 -0800
Message-ID: <7hmsfjn5mm.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Tom,

Tom Rini <trini@konsulko.com> writes:

> When moving the model and compatible properties out of the common
> Pandaboard files and in to the specific boards, the omap4-panda-a4
> file wasn't updated as well and so has lacked a model and compatible
> entry ever since.
>
> Fixes: a1a57abaaf82 ("ARM: dts: omap4-panda: Fix model and SoC family details")
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---

Checkpatch tells me:

 WARNING: DT compatible string "ti,omap4-panda-a4" appears un-documented

So I think Documentation/devicetree/bindings/arm/ti/omap.yaml needs an
update too.  (and note the binding update should be a separate patch[1])

> Given how long this has been broken it's entirely plausible no a4
> hardware even exists anymore and so dropping this file instead makes
> sense. I only found this because scripts/make_fit.py crashed on these
> properties being missing.

If keeping it is just this binding update, then I'd say we keep it, but
if it gets any more paninful to maintain, I'm also not going to argue
very hard to keep it.

Kevin

[1] From:  Documentation/devicetree/bindings/submitting-patches.rst

  1) The Documentation/ and include/dt-bindings/ portion of the patch should
     be a separate patch. The preferred subject prefix for binding patches is::

       "dt-bindings: <binding dir>: ..."

> Cc: Nishanth Menon <nm@ti.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: linux-omap@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/arm/boot/dts/ti/omap/omap4-panda-a4.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/ti/omap/omap4-panda-a4.dts b/arch/arm/boot/dts/ti/omap/omap4-panda-a4.dts
> index 8fd076e5d1b0..4b8bfd0188ad 100644
> --- a/arch/arm/boot/dts/ti/omap/omap4-panda-a4.dts
> +++ b/arch/arm/boot/dts/ti/omap/omap4-panda-a4.dts
> @@ -7,6 +7,11 @@
>  #include "omap443x.dtsi"
>  #include "omap4-panda-common.dtsi"
>  
> +/ {
> +	model = "TI OMAP4 PandaBoard (A4)";
> +	compatible = "ti,omap4-panda-a4", "ti,omap4-panda", "ti,omap4430", "ti,omap4";
> +};
> +
>  /* Pandaboard Rev A4+ have external pullups on SCL & SDA */
>  &dss_hdmi_pins {
>  	pinctrl-single,pins = <
> -- 
> 2.43.0

