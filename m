Return-Path: <linux-omap+bounces-3630-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C16AA629D
	for <lists+linux-omap@lfdr.de>; Thu,  1 May 2025 20:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 457481BA6C6D
	for <lists+linux-omap@lfdr.de>; Thu,  1 May 2025 18:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB74821D59F;
	Thu,  1 May 2025 18:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IrVvNX/k"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C36711185
	for <linux-omap@vger.kernel.org>; Thu,  1 May 2025 18:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746122854; cv=none; b=IeJKr9FUwl7Ta2219ReU6CNyCFXIfB2oDXyjSbvjXz3hP9MW+GMhM4wjFbUMEW4Ocf0xdDgPtvswYxHAn4r8PHxM0R1vu2htZkn0YE/7DwETTTcqUECP64a6IbKEb36oAQ74tKFLRi1RuDHYiAube7fzXWAJ7t/KsQU/Chcb9QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746122854; c=relaxed/simple;
	bh=cfD/RG1nqonp5HSq706CfKo53addIQONk/XfzDpalKc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KyF1kJozKI1zbVqHqoANhugQTLy567PyQbPVeSrJmDVRR6yW46bzkTCMjaSlfQMfDj8jZRDsNUsFuVwlkaolVsxXVObiXjqFbdQZBRgwd+5z/9WMKUD+V1+Q2HYcI2xG3JZINTEX8jx8XNG1GPAwOjaNEvKAH5g0xkt+Pbj3QXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=IrVvNX/k; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736b98acaadso1299356b3a.1
        for <linux-omap@vger.kernel.org>; Thu, 01 May 2025 11:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746122850; x=1746727650; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MA9IB0TgXwBIg6iQoygkPiM8CyTsS1AiD4wjEUMTnE0=;
        b=IrVvNX/k4VMt+S7bQbCytJDnhsymxH1XK3VHRtv7H8gW5sKGX55FdhRAUgAfSummYX
         FHWF3NB9DmKVXD7G3OtZd6rRjGZmqgwYsWJqKBKsT41j2on26wzi0wzAFBRJtIh950Op
         iKEOayquoqF95j8uK/tzzwzIbJkph1Zv+FOitG6oXkXAnBG99sgkU1CE8QHDHuQpcTgG
         Rziee7P456zaSTB06ypoy6fGSBEx+ontv33Nm8VaxRJtx/GG4CEdc+9KkqwoQ2N+roqO
         wIrrk57/1sIgvj6gw9yjunhStRXVb5dYWrMrOrn4uCEhCva6OPwudjyYZ3Fye3R04o58
         t0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746122850; x=1746727650;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MA9IB0TgXwBIg6iQoygkPiM8CyTsS1AiD4wjEUMTnE0=;
        b=jijGNxM/wBQPfjJWCHJAtgusVP61YGYg2eEbpOPMYltiJTxN8ge1BCZGEkw8X9gi1e
         bnEdVioLxm8wBqssZhtXU09FsareuQKnrsEgnyPFCvS5P/kua/mq/NLc3QQfLKDV7OJn
         dznfhaXZKBueCO2e5wWctYsPlgdr1S0xwhBHy9RxF3Kgmg2GIs7bQ1TJ/noLqxWZp0KX
         ME6jxCS6K0vO1gCIpYxXlCSwlkSxrGPdHT0TYvgYhCEbeCJ7TW0pOyFFagWmfSKqM/FK
         goFw9L+wwWg3mcKI9lui7b4rr9a6fqCKIKegWr7HfDHcih+fLOViZL4vhGUumlz49g/b
         2LdQ==
X-Gm-Message-State: AOJu0YzySam2UZc5aEjT+2X9kTsPiFjPOOGg2fe3BMnYP/e24ej8hYbr
	IaXYc0hUXbksySqjCOsJ9Soy+F8gSObSqBYi1wIbfEab6+aqL660Ja12lH83ijs=
X-Gm-Gg: ASbGncstc9CVEROmwb8bDjCu4ot89vwrplGVFWIR/xGgi0ewfCNLckxLCWzYcBlIaW5
	bpR3mBlVhKO9+bjquQHE0GCd8mt55BdzYjO5/ZArhry25cq08dzTf3sWlYmKtgZQQK1J5gBoYwP
	VVMwxEJsYVqYKbRTslgUk9usKZtn4dh4xPT4wwGgN6/NDeGBZ95mbbCrEkb2KfyHrFmmQwarBor
	vd/823QoYBbYD7RNy3yHc9Kw4CHWrTMNrkC3W0RZMnkgnMIVT/2gm7CD6jkQXfAplhpLfdHtEBh
	W7/NZu9FwN2gZzuPYfKshJ8xbRGogFjgoo6SRbo6L7bhkGsv/Q==
X-Google-Smtp-Source: AGHT+IHP4cHxVsLGhMBQWQI4lFpjX8iI45HyU66E1+y7kzhkuzVfTblbiAA4NX5wfFQPCcaacvAndg==
X-Received: by 2002:a05:6a20:158f:b0:1f5:8a1d:38f3 with SMTP id adf61e73a8af0-20a87642f60mr11619964637.2.1746122850604;
        Thu, 01 May 2025 11:07:30 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1f9d642d45sm1025512a12.62.2025.05.01.11.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 11:07:29 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Parvathi Pudi <parvathi@couthit.com>, aaro.koskinen@iki.fi,
 andreas@kemnade.info, rogerq@kernel.org, tony@atomide.com
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, nm@ti.com,
 pratheesh@ti.com, prajith@ti.com, vigneshr@ti.com, danishanwar@ti.com,
 praneeth@ti.com, srk@ti.com, rogerq@ti.com, afd@ti.com,
 krishna@couthit.com, pmohan@couthit.com, mohan@couthit.com,
 parvathi@couthit.com, basharath@couthit.com
Subject: Re: [PATCH v1 1/1] bus: ti-sysc: PRUSS OCP configuration
In-Reply-To: <20250407072134.1044797-2-parvathi@couthit.com>
References: <20250407072134.1044797-1-parvathi@couthit.com>
 <20250407072134.1044797-2-parvathi@couthit.com>
Date: Thu, 01 May 2025 11:07:29 -0700
Message-ID: <7htt64urvi.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Parvathi Pudi <parvathi@couthit.com> writes:

> Updates OCP master port configuration to enable memory access outside
> of the PRU-ICSS subsystem.
>
> This set of changes configures PRUSS_SYSCFG.STANDBY_INIT bit to enable
> the OCP master ports during resume sequence and disables the OCP master
> ports during suspend sequence (applicable only on SoCs using OCP
> interconnect like the OMAP family).
>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> ---
>  drivers/bus/ti-sysc.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> index f67b927ae4ca..51caae611acf 100644
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -2036,6 +2036,19 @@ static void sysc_module_disable_quirk_pruss(struct sysc *ddata)
>  	sysc_write(ddata, ddata->offsets[SYSC_SYSCONFIG], reg);
>  }
>  
> +static void sysc_module_enable_quirk_pruss(struct sysc *ddata)
> +{
> +	u32 reg;
> +
> +	reg = sysc_read(ddata, ddata->offsets[SYSC_SYSCONFIG]);
> +	/* Clearing the SYSC_PRUSS_STANDBY_INIT bit - Updates OCP master
> +	 * port configuration to enable memory access outside of the
> +	 * PRU-ICSS subsystem.
> +	 */

minor nit: incorrect multi-line comment style (first /* should be on
line of its own)

But I fixed this up locally before applying.

Kevin

