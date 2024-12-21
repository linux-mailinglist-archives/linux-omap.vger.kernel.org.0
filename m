Return-Path: <linux-omap+bounces-2876-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4547A9FA06B
	for <lists+linux-omap@lfdr.de>; Sat, 21 Dec 2024 12:17:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E71B1686F6
	for <lists+linux-omap@lfdr.de>; Sat, 21 Dec 2024 11:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B302E1F37C5;
	Sat, 21 Dec 2024 11:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tS7B+7ao"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A338D1F37A1
	for <linux-omap@vger.kernel.org>; Sat, 21 Dec 2024 11:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734779838; cv=none; b=NT8xncOC09L/4BAKEuYjbLeviHi7Dyiqe6ATtOCDXNMIlptsz8lAf9iajySFrxBGb0rcLWImLNZ1IS8OHF5SWliy0BN4LH3iDI2RZilba4xxCYDBNyb6v+eHKDxDoiHIPuJfO+el/NnJFZQGKa0B9Q3kYHdSIEIVzjXG4nC/i/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734779838; c=relaxed/simple;
	bh=G8GJdO5n3/0fPpcWJpIfNuyasHivROKITjpIp/CoHSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pnFBvRJ1z5hZCLkY3H9IR52TsVBqm5ucqn+k9E/LeJlnnosAExCUSsNPHiirln3AJ+3Ch5fhYOo/u7eqPEInddmIaET421YI6BB2BG2MLSySr61H4CH3oLkKO0wOcSuSo6hIKm0gufHb/IRE8we8zmRA+lOgcd73XPWPHV6vwe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tS7B+7ao; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-725d9f57d90so2087372b3a.1
        for <linux-omap@vger.kernel.org>; Sat, 21 Dec 2024 03:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734779835; x=1735384635; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MUwi0cqWQPVLFktl7L0hzqf3cqViWihp2T6NPO7hxEA=;
        b=tS7B+7aoIfrQNFn22grYLFzRIXnb4wtLc6Ru4JrXbNtIIowORYnizDZ8/j5mSng9cp
         z3iWQLMbUBOGwjoLz/3gFEP3YUwgUpCUQPES0DzR2mV1+47hEC14AvLpez9I88sxg1gx
         bod/5+49yI8S83KQD+92/PoeCYN6J6kqclaiLCX4KWE7lbi/z0yl9FJ5zNq0SQs7iyLC
         wkWT+sFu7ziJwLebUpCa74IlZC3p55RX+4GbN8EzxMERx2MP+eLoHRNXdQ6DP1SHwS8J
         rxYo7MfbT1C67SSRPYcfNAWZ4bk9cJrasUoO1WLIT3lJFGC+D7VMwHO1N79D/r32D/sV
         NYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734779835; x=1735384635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUwi0cqWQPVLFktl7L0hzqf3cqViWihp2T6NPO7hxEA=;
        b=BD0nuxFvtTsw9eUowUErn5CixYmT3URp80e6mcEbA+nJCl/FRI12warakfj9stJEpj
         eHNTIhGr/UtUMyPgIYIbeJEn6r/4/QEICYeOvRSRKDbSdsj22cmV2af6zjIBv7suXEFX
         888TRAnsYSCqJu6c5R/6fBkr+fcB83ryJR9ZLPRSHZygaqnyS6nHOt7mEhPZLzzml3E0
         eYOFljiOIljzPYTRo3AseYaH9+HuoH0VwSbJnoXjIT6fD+K+AhDNhH0OdLgOTbM3h/Qi
         cSv0j//KAWCsx5faIkJyZOEeeH7WiJyxOK3HDOopoq9iJQA7UXoxO7H8i5KtTAy5HDfu
         um7g==
X-Forwarded-Encrypted: i=1; AJvYcCW6FNOacRUhschZi9AQDxI4llW65z2KEABw00v7G1H82DF9jb4OYkPJm4QqjEX/w9R7UcabFD3Wadig@vger.kernel.org
X-Gm-Message-State: AOJu0YzWwJ0TUTb69tlAOMY8Z8fEZ9Ud1uXw3J8mCpC3PAAvV2aX2H+v
	xlVs9BwlhMaqdqON5xsrqQkzZ+Yt5fX3HQ8gl/eiBkLFSf4pNzxjDwWuQiabMNc=
X-Gm-Gg: ASbGnctuX1CDKBtsJJX3NH7tBOYxnUKGOBrLw3GkbI0gfCwBYbmV8rHSWo5mS7xfLt6
	lO1Hnne/6vtJPEVfndK3zvYrJ1U2RPN76w/2Lz4KQPL6Sc+it1c8zFDcBZ4Ou9kyY1kB/KJkO5Q
	8HqJR5tTtJ+7zVavv9t1zT04FB5Wfqx+B+yUJHHRFixZhmz29Be1XcHRnfXv193ZQhcvrk2fZ5T
	tpaHx98Z/cSeRi2e83c7Kt9AjU88O5h69u4AEi4pl+0zIP+/u/O7EWhm0hyCyCCCsbr+E5gRrmU
	0m4z3T2eZuljj3Kt
X-Google-Smtp-Source: AGHT+IETtl39lfiWah7ZB6Wjx81ZG/H3eQ/XeN1Pwp4p0WHw+hzES8qCUaNjmE9BHQM4U1V4zI75bA==
X-Received: by 2002:a05:6a20:7f8a:b0:1e3:e6f3:6372 with SMTP id adf61e73a8af0-1e5e07bc390mr9835251637.27.1734779834852;
        Sat, 21 Dec 2024 03:17:14 -0800 (PST)
Received: from dev-linux (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad815804sm4585320b3a.32.2024.12.21.03.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 03:17:14 -0800 (PST)
Date: Sat, 21 Dec 2024 03:16:26 -0800
From: Sukrut Bellary <sbellary@baylibre.com>
To: Judith Mendez <jm@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bin Liu <b-liu@ti.com>
Subject: Re: [PATCH] ARM: dts: ti: am437x-l4: remove autoidle for UART
Message-ID: <Z2ajiuumq0CeM/u7@dev-linux>
References: <20241220223523.2125278-1-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220223523.2125278-1-jm@ti.com>

On Fri, Dec 20, 2024 at 04:35:23PM -0600, Judith Mendez wrote:
> According to the TRM [0] in 21.5.1.42 UART_SYSC Register,
> the autoidle bit should not be set for UART, so remove the
> appropriate SYSC_OMAP2_AUTOIDLE flag.
> 
> [0] https://www.ti.com/lit/ug/spruhl7i/spruhl7i.pdf
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>  arch/arm/boot/dts/ti/omap/am437x-l4.dtsi | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi b/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi
> index 824b9415ebbe9..fd4634f8c6293 100644
> --- a/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi
> @@ -180,8 +180,7 @@ target-module@9000 {			/* 0x44e09000, ap 16 04.0 */
>  			      <0x9058 0x4>;
>  			reg-names = "rev", "sysc", "syss";
>  			ti,sysc-mask = <(SYSC_OMAP2_ENAWAKEUP |
> -					 SYSC_OMAP2_SOFTRESET |
> -					 SYSC_OMAP2_AUTOIDLE)>;
> +					 SYSC_OMAP2_SOFTRESET)>;
>  			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
>  					<SYSC_IDLE_NO>,
>  					<SYSC_IDLE_SMART>,
> @@ -698,8 +697,7 @@ target-module@22000 {			/* 0x48022000, ap 8 0a.0 */
>  			      <0x22058 0x4>;
>  			reg-names = "rev", "sysc", "syss";
>  			ti,sysc-mask = <(SYSC_OMAP2_ENAWAKEUP |
> -					 SYSC_OMAP2_SOFTRESET |
> -					 SYSC_OMAP2_AUTOIDLE)>;
> +					 SYSC_OMAP2_SOFTRESET)>;
>  			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
>  					<SYSC_IDLE_NO>,
>  					<SYSC_IDLE_SMART>,
> @@ -726,8 +724,7 @@ target-module@24000 {			/* 0x48024000, ap 10 1c.0 */
>  			      <0x24058 0x4>;
>  			reg-names = "rev", "sysc", "syss";
>  			ti,sysc-mask = <(SYSC_OMAP2_ENAWAKEUP |
> -					 SYSC_OMAP2_SOFTRESET |
> -					 SYSC_OMAP2_AUTOIDLE)>;
> +					 SYSC_OMAP2_SOFTRESET)>;
>  			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
>  					<SYSC_IDLE_NO>,
>  					<SYSC_IDLE_SMART>,
> @@ -1385,8 +1382,7 @@ target-module@a6000 {			/* 0x481a6000, ap 40 16.0 */
>  			      <0xa6058 0x4>;
>  			reg-names = "rev", "sysc", "syss";
>  			ti,sysc-mask = <(SYSC_OMAP2_ENAWAKEUP |
> -					 SYSC_OMAP2_SOFTRESET |
> -					 SYSC_OMAP2_AUTOIDLE)>;
> +					 SYSC_OMAP2_SOFTRESET)>;
>  			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
>  					<SYSC_IDLE_NO>,
>  					<SYSC_IDLE_SMART>,
> @@ -1413,8 +1409,7 @@ target-module@a8000 {			/* 0x481a8000, ap 42 20.0 */
>  			      <0xa8058 0x4>;
>  			reg-names = "rev", "sysc", "syss";
>  			ti,sysc-mask = <(SYSC_OMAP2_ENAWAKEUP |
> -					 SYSC_OMAP2_SOFTRESET |
> -					 SYSC_OMAP2_AUTOIDLE)>;
> +					 SYSC_OMAP2_SOFTRESET)>;
>  			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
>  					<SYSC_IDLE_NO>,
>  					<SYSC_IDLE_SMART>,
> @@ -1441,8 +1436,7 @@ target-module@aa000 {			/* 0x481aa000, ap 44 12.0 */
>  			      <0xaa058 0x4>;
>  			reg-names = "rev", "sysc", "syss";
>  			ti,sysc-mask = <(SYSC_OMAP2_ENAWAKEUP |
> -					 SYSC_OMAP2_SOFTRESET |
> -					 SYSC_OMAP2_AUTOIDLE)>;
> +					 SYSC_OMAP2_SOFTRESET)>;
>  			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
>  					<SYSC_IDLE_NO>,
>  					<SYSC_IDLE_SMART>,
> -- 
> 2.47.1
>

Looks good to me.

Reviewed-by: Sukrut Bellary <sbellary@baylibre.com>


