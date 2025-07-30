Return-Path: <linux-omap+bounces-4156-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 724E5B1593A
	for <lists+linux-omap@lfdr.de>; Wed, 30 Jul 2025 09:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9675A3BFFBC
	for <lists+linux-omap@lfdr.de>; Wed, 30 Jul 2025 07:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B241F1317;
	Wed, 30 Jul 2025 07:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hY93S4fM"
X-Original-To: linux-omap@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2D9E55B
	for <linux-omap@vger.kernel.org>; Wed, 30 Jul 2025 07:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753859058; cv=none; b=JcQvNpRAhyDP31Z3pqoV6Lc7tlaqkqC8hJvlFG5LN1Rey7ZUE3dAy+LmNimWdbpAhTQ5NFFkfTmP/eodoAWb+qym6mVCbj90XBeEiMyl4WKzVPpvfOSp/JMnYD/noZ//TF35weS99bAME1g5Wlv7/6UrmiEi7hfvnpdYQoy7ioI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753859058; c=relaxed/simple;
	bh=ejF5a+NRIOf1oWrPc8RSvxPJC407uoRHPB/IPhVhqf8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=g7uPV/sGls4wgBAlFRkRMPNMp7GWSqATAk2W5a6iBCqXIyhYmmUA1p7HYLFSRyX+fVS+WdKZ4SguC1itT9ix2+4A0rBuweuCPiN6G+naYw4MChSSL5FBB+a9qhe2/W4QBXWV6EJfwNftQFTtFjXJb1aqNwtkZIXDeFXb9cpmSKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hY93S4fM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753859056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7EgCjCwSAoWT6dP7WChm7aBhbHSl4JFbz/gKARLGAAw=;
	b=hY93S4fM23q+8Mx0TJVA5VVJc/+ONAJ2J+pwPeEpow1Lu9fU9QkofoiJ8pY/QwWbBXPm6j
	LK1rCYLYAQcPwGuf+Sro91FR8MGVDdHs6kkpbMulszEn0G4vclFP4uYEz1bOUsuH0WpV3U
	Pf+Lyr7OTOjglF5fMz+Xj6YRrdp0mOE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-UE8EB4LQP7equ7Is6Hr3Pw-1; Wed, 30 Jul 2025 03:04:14 -0400
X-MC-Unique: UE8EB4LQP7equ7Is6Hr3Pw-1
X-Mimecast-MFC-AGG-ID: UE8EB4LQP7equ7Is6Hr3Pw_1753859053
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f7f1b932so3756445f8f.2
        for <linux-omap@vger.kernel.org>; Wed, 30 Jul 2025 00:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753859053; x=1754463853;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7EgCjCwSAoWT6dP7WChm7aBhbHSl4JFbz/gKARLGAAw=;
        b=HV2RPfr39KDJAV+zg6D7iMMK67b456Qc4ZWEUj2/QOamaw5pWkyOX+c+7HSmUAXXBW
         flJfCRkYPA02BJ/p+sfBLcWcHvpq535Zp5QYsBt072SInGBGS7++QKsqxqjs355CZM0G
         2RosjBvofxhriI/Zxg/W2ODT26vHtE9aeEzUQQnxFDym93m6CNFNb26LSPdmn0lrLyF5
         aQgB7644L3QFJBrtQ6ycTl5qK3/sj77OuW9rAp8YsoYwqmGrgxk/l2+42osMNw6ul+RM
         I33w/b3HzHulrVWVvwVsLrsPEmnL7gLZ1rFDeTqcxuqowscxnkStBhVBmV6N0986TDh7
         z8Og==
X-Forwarded-Encrypted: i=1; AJvYcCUcxjZoqV93lQ4wN6nG8KbU6K4Qc4AnxAw+OGFEEx0/mJN7S5K/8fhIcx8n8kDb7EthXQAW0s5NIwRq@vger.kernel.org
X-Gm-Message-State: AOJu0Yxiramc8wTmXgVz/MBg6K/x9IIs6PW38YQxaw9GhW9nqNcdtTD/
	id+dXRtc8vuQCb6qGlS+5xG4ZVjUmpxPT3JazO4kD/gBJY3RlV50DfBlXQINiz85Q6kxVWMaOJK
	fPujp5zzi0sM6y3zalKrosyhG3DZ1dQuY+AusOdiNVnSlhKurBGTrOdxAZf7+5NA=
X-Gm-Gg: ASbGncvrkCrHjqKVKKWvf3oJF4G7c8wZ+t8e3j30Mfl4y3o3taXWDpZIAUvLhvhaa24
	+96pwnOgdxb5tCOpXnlHPYZLf7BbQ0zpTkpLKNVB62QF/fIFIu/eiDBZ5GHMIVkqK5wSPKOF+SA
	YzNDsR9ctP6euhzvZhfblNPQihEpruOr64lVc/9+GhXW/uGmJyW753RenwAg5VtcLlVBj0izcZI
	4dQcPFegS+4Fu1V0MXU1+Dhg8DvRjU0t0je8fkpZJGmTmtys9+9AGM3drAj/r+FgWjTEbob83hJ
	jJCl9D24TtOhfa20Xnuf3NHe+MmNuFmtBZPSs6r1joKN00y4nQhWeMJ6Dd6NHPd7kdNf9dP3wlv
	LFlw=
X-Received: by 2002:a05:6000:178c:b0:3a3:7baf:f06a with SMTP id ffacd0b85a97d-3b794ffdafbmr1455224f8f.37.1753859052951;
        Wed, 30 Jul 2025 00:04:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNUbYGDL0unBoGUvLAcwoshm16lk2z/rlSxU4KYNEG/RVgWXaLcOgnhaU/dRAgxynEmknJng==
X-Received: by 2002:a05:6000:178c:b0:3a3:7baf:f06a with SMTP id ffacd0b85a97d-3b794ffdafbmr1455181f8f.37.1753859052432;
        Wed, 30 Jul 2025 00:04:12 -0700 (PDT)
Received: from [192.168.0.6] (ltea-047-064-115-093.pools.arcor-ip.net. [47.64.115.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78b78f5edsm7115817f8f.28.2025.07.30.00.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 00:04:11 -0700 (PDT)
Message-ID: <532f5e18-8613-454c-8497-8c224360ebbf@redhat.com>
Date: Wed, 30 Jul 2025 09:04:09 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 uapi headers
From: Thomas Huth <thuth@redhat.com>
To: linux-arm-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-samsung-soc@vger.kernel.org,
 imx@lists.linux.dev, linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20250703173859.246664-1-thuth@redhat.com>
Content-Language: en-US
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250703173859.246664-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2025 19.38, Thomas Huth wrote:
> The kernel Makefiles define the __ASSEMBLY__ macro to provide
> a way to use headers in both, assembler and C source code.
> However, all the supported versions of the GCC and Clang compilers
> also define the macro __ASSEMBLER__ automatically already when compiling
> assembly code, so some kernel headers are using __ASSEMBLER__ instead.
> With regards to userspace code, this seems also to be constant source
> of confusion, see for example these links here:
> 
>   https://lore.kernel.org/kvm/20250222014526.2302653-1-seanjc@google.com/
>   https://stackoverflow.com/questions/28924355/gcc-assembler-preprocessor-not-compatible-with-standard-headers
>   https://forums.raspberrypi.com/viewtopic.php?p=1652944#p1653834
>   https://github.com/riscv-software-src/opensbi/issues/199
> 
> To avoid confusion in the future, it would make sense to standardize
> on the macro that gets defined by the compiler, so this patch series
> changes all occurances of __ASSEMBLY__ into __ASSEMBLER__.
> 
> I split the patches per architecture to ease the review, and I also
> split the uapi headers from the normal ones in case we decide that
> uapi needs to be treated differently from the normal headers here.

Friendly ping! The patches should still apply cleanly, I think.

  Thomas



