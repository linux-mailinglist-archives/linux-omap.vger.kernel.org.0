Return-Path: <linux-omap+bounces-5121-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CDFCA4AA0
	for <lists+linux-omap@lfdr.de>; Thu, 04 Dec 2025 18:07:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6785301CD26
	for <lists+linux-omap@lfdr.de>; Thu,  4 Dec 2025 17:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C950D2DE6EF;
	Thu,  4 Dec 2025 16:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OT2e8dQ4"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2007C2D5944
	for <linux-omap@vger.kernel.org>; Thu,  4 Dec 2025 16:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764865642; cv=none; b=K5admzX4lfww6MSPbPWkrql93InyNx2J9OUG1GFEFNaW22jkg0y3cI5gcb4x5kgMwYDIPRPLEssVsjFMm7aVlwyqpIj3Rj0rKaDyUgQKTVvDkyM0PK7iPq9PxOGFhNJacBlVQek8vlBqjZmj0sH3amw3h6OUZWnCdEzuxm6rlJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764865642; c=relaxed/simple;
	bh=RQT8UavqXoESiRh8hNJhO8nqw/En3xmbwwQkL6imarE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=upzImNLKsOzRGF5u/nGY7svo3FsB4TusGiV2+hqc44b2XUC2Rv8hg6o8OahooxU8cukk15nGNqUczhkpX+zPNPrxWp/7KjSBn2gTQBRTVsAKSpheYoaWv9+mTcLOBo2UGCQJQBT7/50lZhQ31M2PlnLc0APqkoW4pQLQdTKYq2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OT2e8dQ4; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477770019e4so11868385e9.3
        for <linux-omap@vger.kernel.org>; Thu, 04 Dec 2025 08:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764865638; x=1765470438; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=88tPUK02ZLrC9M/8Z+z/1Oq9I1aD8192v0FSJkrRNjw=;
        b=OT2e8dQ4w5/yZtSKKweZvrXSmkM/nmrhtCeLhRIYwJ6fJeJm47H6IN+McI16P+Zk43
         IHV3yTbG4vZyznpYpR2/kDLnEz2r9TzkZxBfo+BTDVYreEMSK0J6sUZbaVOXKWq5VN2H
         Lts/quAEKMuhwe6Egih8rKRHLsPjdoDKfhuwyuB0PFf0r4Uiai7PW3sr5upeBEk5QfaT
         8/hYigIiQiQOIH/L8Y9sL3HzVXN3bHetBUSY/VuY3XwxMKthkm8ERcHL8K8s1WrGCWIq
         fn2NHOMCq62nOSz9M0sxt5R75hfOJEJWWGiENFa7ybV0wQU9Y55LrUrzH+T0rBhYTJIC
         1DVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764865638; x=1765470438;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=88tPUK02ZLrC9M/8Z+z/1Oq9I1aD8192v0FSJkrRNjw=;
        b=QNQoda5YIZAU6Nh6wpYBoSUw1Ix61/k5hWO7lk6qbqOmvkvyqiYeJvJFQrXq6QGTyy
         nNXh+CwEe+vr95kcvEFVtJpqi1jUFsowvKPYU+nHN8quHHCrhDtA7Usxr+OozOWSM9FO
         4l5Jr5mJzXS7WfJmqNvJuccnBG2/iiQHXjoUYrWzNNaKeMzbj/h/IUG4OlD0CQYiEyz1
         AEGCZygGdEv21wR2bK/Hi+ncnTJT+b4SGTKf66R/rLYaIuq2zaGLjTqvscwfB+9iGDKF
         gt/XIm6sVCXma82ducwlso2oN8NGOcBb92zQZHLhx0XCh/23VjSGT87SacZn8Uwt9POI
         fwzg==
X-Forwarded-Encrypted: i=1; AJvYcCWMVsWPnalL8tAu6LgVwzww7f3H1OLWWS1t9muzZ+SS8om1wj6EJ9rQmkGz5i3ZiZ5Qgx4cWpCCgOtT@vger.kernel.org
X-Gm-Message-State: AOJu0YwGTNuEhmPn08qe6kQvzOZ7MyaizMQp29uxJeyckzx6emnNCURR
	8tx3ygXUApnz6iJQBKzDPV3fa811wYyniz1EU6Jo4lEv1pkZwuNxyr7c
X-Gm-Gg: ASbGnctBnCRMPz4R+BdzhKPEucYgQfGvhD/vk1gkwBNwLCnZbsvvduX/R7r67i0HCGn
	aFR1qIQa4JkhUk++z33bd9zgrQGPUAczLttvmGLA6o/Dx8DQyS5gAo3fMZjDfTFUEeKKf4CWXWh
	im96/j3Beh8lZpTFI4VXyDcsIbdBQXMIikgwItKeARVzmPtTcC8v67vCfqkrxXvk9eWwVjh1roH
	fBkPHTvMH0jI1mNPOzd7J/ci46gTMGHzLVyRG8axEQqEeIHRL9Y8K1tSokABB6gVAgBglN0BVC2
	qFMviMPuxwJtsgzRcQ9Dy2smNUONxAY0498UKD8lfJvCFRSYqzFYbdKNEEgQA/eQhHEyAc0UHKp
	OH9IaKhfhN9sT4RB6h7oLm8HotpRAlVzeb+2tbT2SQvNA1uX59YwgmiCAFIEKpo22BmbSCWwyx5
	OZUtb/3UMmqrGn3QK8YNNgS/AXI1eMBuzrXZTDRxkh4wlpeopCz7kICQ+Rb7yV2OrrxtxnK79nM
	dv4ZvfBCqSGbfug
X-Google-Smtp-Source: AGHT+IEeiFh5JMgnQ8pShAVUYlCPwfqLImrWniLzd/dBupEr9CI1rxYrCJtKX41c/om1WIELKCCDCw==
X-Received: by 2002:a05:600c:1f8e:b0:477:8985:4036 with SMTP id 5b1f17b1804b1-4792f23c727mr34378505e9.1.1764865638123;
        Thu, 04 Dec 2025 08:27:18 -0800 (PST)
Received: from dell.localnet (2a01-114f-4013-18c0-0000-0000-0000-0540.ea.ipv6.supernova.orange.pl. [2a01:114f:4013:18c0::540])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d2226e7sm4044141f8f.27.2025.12.04.08.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 08:27:17 -0800 (PST)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: soc@lists.linux.dev, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH] ARM: omap1: avoid symbol clashes in fiq handler
Date: Thu, 04 Dec 2025 17:27:16 +0100
Message-ID: <6216166.lOV4Wx5bFT@dell>
In-Reply-To: <20251204095355.1032786-1-arnd@kernel.org>
References: <20251204095355.1032786-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5058772.31r3eYUQgx";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart5058772.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH] ARM: omap1: avoid symbol clashes in fiq handler
Date: Thu, 04 Dec 2025 17:27:16 +0100
Message-ID: <6216166.lOV4Wx5bFT@dell>
In-Reply-To: <20251204095355.1032786-1-arnd@kernel.org>
References: <20251204095355.1032786-1-arnd@kernel.org>
MIME-Version: 1.0

On Thursday, 4 December 2025 10:53:47 CET Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The ams-delta-fiq-handler.S file has a number of symbols with fairly
> generic names, including one named 'exit' that causes a compiler warning
> in some configuration options:
> 
> vmlinux.o: error: exit() function name creates ambiguity with -ffunction-sections
> 
> Change all these symbols to use a .L prefix to make them local to
> the fiq handler.

Reviewed-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-omap1/ams-delta-fiq-handler.S | 38 ++++++++++-----------
>  1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm/mach-omap1/ams-delta-fiq-handler.S b/arch/arm/mach-omap1/ams-delta-fiq-handler.S
> index 35c2f9574dbd..5cf6fcca602c 100644
> --- a/arch/arm/mach-omap1/ams-delta-fiq-handler.S
> +++ b/arch/arm/mach-omap1/ams-delta-fiq-handler.S
> @@ -97,7 +97,7 @@ ENTRY(qwerty_fiqin_start)
>  
>  	ldr r13, [r12, #IRQ_ITR_REG_OFFSET]	@ fetch interrupts status
>  	bics r13, r13, r11			@ clear masked - any left?
> -	beq exit				@ none - spurious FIQ? exit
> +	beq .Lexit				@ none - spurious FIQ? exit
>  
>  	ldr r10, [r12, #IRQ_SIR_FIQ_REG_OFFSET]	@ get requested interrupt number
>  
> @@ -105,25 +105,25 @@ ENTRY(qwerty_fiqin_start)
>  	str r8, [r12, #IRQ_CONTROL_REG_OFFSET]
>  
>  	cmp r10, #(INT_GPIO_BANK1 - NR_IRQS_LEGACY)	@ is it GPIO interrupt?
> -	beq gpio				@ yes - process it
> +	beq .Lgpio				@ yes - process it
>  
>  	mov r8, #1
>  	orr r8, r11, r8, lsl r10		@ mask spurious interrupt
>  	str r8, [r12, #IRQ_MIR_REG_OFFSET]
> -exit:
> +.Lexit:
>  	subs	pc, lr, #4			@ return from FIQ
>  	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
>  
>  
>  	@@@@@@@@@@@@@@@@@@@@@@@@@@@
> -gpio:	@ GPIO bank interrupt handler
> +.Lgpio:	@ GPIO bank interrupt handler
>  	ldr r12, omap1510_gpio_base		@ set base pointer to GPIO bank
>  
>  	ldr r11, [r12, #OMAP1510_GPIO_INT_MASK]	@ fetch GPIO interrupts mask
> -restart:
> +.Lrestart:
>  	ldr r13, [r12, #OMAP1510_GPIO_INT_STATUS]	@ fetch status bits
>  	bics r13, r13, r11			@ clear masked - any left?
> -	beq exit				@ no - spurious interrupt? exit
> +	beq .Lexit				@ no - spurious interrupt? exit
>  
>  	orr r11, r11, r13			@ mask all requested interrupts
>  	str r11, [r12, #OMAP1510_GPIO_INT_MASK]
> @@ -131,7 +131,7 @@ restart:
>  	str r13, [r12, #OMAP1510_GPIO_INT_STATUS] @ ack all requested interrupts
>  
>  	ands r10, r13, #KEYBRD_CLK_MASK		@ extract keyboard status - set?
> -	beq hksw				@ no - try next source
> +	beq .Lhksw				@ no - try next source
>  
>  
>  	@@@@@@@@@@@@@@@@@@@@@@
> @@ -145,10 +145,10 @@ restart:
>  
>  	ldr r10, [r9, #BUF_STATE]		@ fetch kbd interface state
>  	cmp r10, #0				@ are we expecting start bit?
> -	bne data				@ no - go to data processing
> +	bne .Ldata				@ no - go to data processing
>  
>  	ands r8, r8, #KEYBRD_DATA_MASK		@ check start bit - detected?
> -	beq hksw				@ no - try next source
> +	beq .Lhksw				@ no - try next source
>  
>  	@ r8 contains KEYBRD_DATA_MASK, use it
>  	str r8, [r9, #BUF_STATE]		@ enter data processing state
> @@ -162,9 +162,9 @@ restart:
>  	mvn r11, #KEYBRD_CLK_MASK		@ prepare all except kbd mask
>  	str r11, [r12, #OMAP1510_GPIO_INT_MASK]	@ store into the mask register
>  
> -	b restart				@ restart
> +	b .Lrestart				@ restart
>  
> -data:	ldr r10, [r9, #BUF_MASK]		@ fetch current input bit mask
> +.Ldata:	ldr r10, [r9, #BUF_MASK]		@ fetch current input bit mask
>  
>  	@ r8 still contains GPIO input bits
>  	ands r8, r8, #KEYBRD_DATA_MASK		@ is keyboard data line low?
> @@ -175,7 +175,7 @@ data:	ldr r10, [r9, #BUF_MASK]		@ fetch current input bit mask
>  	mov r10, r10, lsl #1			@ shift mask left
>  	bics r10, r10, #0x800			@ have we got all the bits?
>  	strne r10, [r9, #BUF_MASK]		@ not yet - store the mask
> -	bne restart				@ and restart
> +	bne .Lrestart				@ and restart
>  
>  	@ r10 already contains 0, reuse it
>  	str r10, [r9, #BUF_STATE]		@ reset state to start
> @@ -189,7 +189,7 @@ data:	ldr r10, [r9, #BUF_MASK]		@ fetch current input bit mask
>  	ldr r10, [r9, #BUF_KEYS_CNT]		@ get saved keystrokes count
>  	ldr r8, [r9, #BUF_BUF_LEN]		@ get buffer size
>  	cmp r10, r8				@ is buffer full?
> -	beq hksw				@ yes - key lost, next source
> +	beq .Lhksw				@ yes - key lost, next source
>  
>  	add r10, r10, #1			@ incremet keystrokes counter
>  	str r10, [r9, #BUF_KEYS_CNT]
> @@ -213,9 +213,9 @@ data:	ldr r10, [r9, #BUF_MASK]		@ fetch current input bit mask
>  	@@@@@@@@@@@@@@@@@@@@@@@@
>  
>  
> -hksw:	@Is hook switch interrupt requested?
> +.Lhksw:	@Is hook switch interrupt requested?
>  	tst r13, #HOOK_SWITCH_MASK 		@ is hook switch status bit set?
> -	beq mdm					@ no - try next source
> +	beq .Lmdm				@ no - try next source
>  
>  
>  	@@@@@@@@@@@@@@@@@@@@@@@@
> @@ -230,9 +230,9 @@ hksw:	@Is hook switch interrupt requested?
>  	@@@@@@@@@@@@@@@@@@@@@@@@
>  
>  
> -mdm:	@Is it a modem interrupt?
> +.Lmdm:	@Is it a modem interrupt?
>  	tst r13, #MODEM_IRQ_MASK 		@ is modem status bit set?
> -	beq irq					@ no - check for next interrupt
> +	beq .Lirq				@ no - check for next interrupt
>  
>  
>  	@@@@@@@@@@@@@@@@@@@@@@@@
> @@ -245,13 +245,13 @@ mdm:	@Is it a modem interrupt?
>  	@@@@@@@@@@@@@@@@@@@@@@@@
>  
>  
> -irq:	@ Place deferred_fiq interrupt request
> +.Lirq:	@ Place deferred_fiq interrupt request
>  	ldr r12, deferred_fiq_ih_base		@ set pointer to IRQ handler
>  	mov r10, #DEFERRED_FIQ_MASK		@ set deferred_fiq bit
>  	str r10, [r12, #IRQ_ISR_REG_OFFSET] 	@ place it in the ISR register
>  
>  	ldr r12, omap1510_gpio_base		@ set pointer back to GPIO bank
> -	b restart				@ check for next GPIO interrupt
> +	b .Lrestart				@ check for next GPIO interrupt
>  	@@@@@@@@@@@@@@@@@@@@@@@@@@@
>  
>  
> 


--nextPart5058772.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEnyr6IsGnTYAeAkHJ2WqSnltsjBoFAmkxtmQACgkQ2WqSnlts
jBrMsQgAnOqLcgqd4VMzVjjHNYxPJsmd+I7OzdOytaNRJ0eqRFAYC36GAVqlkuqB
Dwwv+bh+cCPlES3ozAUr0WJ9fCgfA2Zvi1EHNdIJlyDwZOkpHKMm7BGN9drPBFST
XjUsixxJWQKQBUVFK4aASFoZ3cbrQ2KtOOHjqBQ1coaPw6cWZa8fbwWRDxLXGcDC
ISeJBjlLxHH5BJrUhlJ7iGw9LN1kDGleu/wal2gJfnuGZ6WVApDLujyDWhUsAV0M
IMf7x7yfyyCA9YoSNpZus4+w716T0/fKkVflh7TvqeQGqA1+FH8HRYguVYeRQkUQ
rnnTEfB6obbtIPimzaw1lvcrV9OvLw==
=X4/I
-----END PGP SIGNATURE-----

--nextPart5058772.31r3eYUQgx--




