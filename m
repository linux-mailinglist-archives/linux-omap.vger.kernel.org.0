Return-Path: <linux-omap+bounces-1054-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ED588FB7E
	for <lists+linux-omap@lfdr.de>; Thu, 28 Mar 2024 10:30:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 959761F2A880
	for <lists+linux-omap@lfdr.de>; Thu, 28 Mar 2024 09:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCB054745;
	Thu, 28 Mar 2024 09:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l/ke1REg"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CD35102E
	for <linux-omap@vger.kernel.org>; Thu, 28 Mar 2024 09:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711618244; cv=none; b=IyAsmzwj8bFARac7agQDW6btC8zelaCO56IR5KHBacPoGV7ssp1F06ON8SztN/ILHGpwgOCL1FLjkMSwppURir53TDU1xGJ9Y+sZYhSH23JALPFOYRUsY+3kQF0QVzf/bXLCo9+q5sTHt7hLn/xnmPV+RJrxq4hhhsBf8EzeWHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711618244; c=relaxed/simple;
	bh=qNEk2QTMWT7pE7NcGsScoyYwZsN/HGsrUwmknZUKB1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p/MG7G5xlgQqi0PLjzj0PPo4BxvtD1r7/ZX0y33B2g3ntoNIlQG48o5Sn8mO/cZLkJ/OrjvLNkitN4clM6cPKiqBY1r29/lLuh3YJw/qs/5yVSK2q82v+VHZ23Rsk6U5h9WP1OVPLP5ven4IL9rU46qzYW+8KB/voDhpRlAlU3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l/ke1REg; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41488f9708fso5031285e9.3
        for <linux-omap@vger.kernel.org>; Thu, 28 Mar 2024 02:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711618241; x=1712223041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5zLV5Gl5gwlKCsD3kw1kz6Pu3G+4FAslKmMOi1/R37E=;
        b=l/ke1REgAws6ipwQieMBLZSTRTf33UIiiVKE9asfMZsJ/yLh1Jj+14CfidUFcG56ty
         InwAn9ffSMEON5yNGkmMRQ2CCKtUUq0F/WZYKbi6cBs7SKm+gHIER2Nc4xv8RmTUpCL9
         il8ar9cn5qQHqCH3fSoxInG2ZrYyrihyK4cuq9jz58rgVjkLv+tLeumvhJDI8PziBVZ+
         DT8b4J2FXAc8/YAFYZ5OJ0CyOZmPSb69uFtZMA0drv0qdHJPgBwU8IC26uLDT4yBKgzw
         TJ/YEY8eEs062yyspb5nt7TIXrsWRcp33xYBBqYxebpkHvhCmlVSESjmspWyqNs7fJzJ
         djfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711618241; x=1712223041;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zLV5Gl5gwlKCsD3kw1kz6Pu3G+4FAslKmMOi1/R37E=;
        b=hyDeXNGsOxsVJzv08j5kuzwYSK0b6dhaoSsHu/aJtUMJmX3Xb9FS131/dt+GYXdwVj
         KTVsj/O5VI5wBxbaCY/V65tf3rG6bgsnWnHR2VGFGrldvG9ViGFsLVB3HEW1PW2mh+na
         FgBgo2a9qfC68htHnBT2RmM1ohThT/xDnkb0vqFsGqjN1TI+104kLp4JMPs/z5Z5Qczn
         X6PYfW7K09YktW/iNg1SRyOaBR1vAKvE6CozmEtfSPzpDK0ynM4WnshWa8aZ/S9IMTiP
         2wBnbpjUgtITGw1VmhE6ywM9YraTkqvv1cPpGa8zXMpI3CwozZgVg831NM/sl4pIyfl0
         PZYg==
X-Forwarded-Encrypted: i=1; AJvYcCX52IceJb+eTi+HZqUxvheEkFxqS9FfTzxu+No1swGjhUqGk1ts/SvkaIEHQBuMOVKeWKgURBNGpLWTspjr9cQirzpXJ/nlSQPlcQ==
X-Gm-Message-State: AOJu0YyCga2vEdm2h+bpFhfMHnm0jIxXxkZg5/uidb8mZuygCzeAgcjI
	XlVqCGvsSqPp0mhW3BOrDwtI0p9nq6on3HM055hBVRUEt3Ece22E7lrq0UcfSs8=
X-Google-Smtp-Source: AGHT+IHVYxVYtdSjcJTl74MiA1N51ClccEj2TIRNuYqY07qAFOHuTGo/Y4+g/ZSDV5llROp9pOfsXw==
X-Received: by 2002:a05:600c:4fd2:b0:412:c858:fdfb with SMTP id o18-20020a05600c4fd200b00412c858fdfbmr1743633wmq.17.1711618241659;
        Thu, 28 Mar 2024 02:30:41 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.148])
        by smtp.gmail.com with ESMTPSA id bi25-20020a05600c3d9900b00415481edde3sm726781wmb.9.2024.03.28.02.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 02:30:41 -0700 (PDT)
Message-ID: <c310acda-c41b-4b67-9b26-18db3397031e@linaro.org>
Date: Thu, 28 Mar 2024 10:30:39 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] ARM: dts: omap4: fix hsi-port node name
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240327-hsi-dt-binding-v2-0-110fab4c32ae@collabora.com>
 <20240327-hsi-dt-binding-v2-4-110fab4c32ae@collabora.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240327-hsi-dt-binding-v2-4-110fab4c32ae@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/03/2024 20:11, Sebastian Reichel wrote:
> The DT binding specifies, that the node names for the HSI ports should
> be just 'port@<address>' instead of 'hsi-port@<address>'.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm/boot/dts/ti/omap/omap4-l4.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


