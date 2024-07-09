Return-Path: <linux-omap+bounces-1753-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D25D892BD96
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jul 2024 16:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85D7D1F23C94
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jul 2024 14:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B801B19D88E;
	Tue,  9 Jul 2024 14:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2321WUqY"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455CF159209
	for <linux-omap@vger.kernel.org>; Tue,  9 Jul 2024 14:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720537045; cv=none; b=rtRZFCAGzb2SZd1W09iq3/Uz/pELZ4mWsz65hDhW8bYCQwShcpwXw0qN/vkih04BH2v0JkcjrCNKBruIM4G69t/UIP3xJs3WJYPWs0DUcW8IUrN6qeozwhIwm7k5ubOTWLzBA5tK/57qz574hwRdnkoGmaYbaxI/OowMAeAJXs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720537045; c=relaxed/simple;
	bh=E+2qgiMcws/zEYhU0U8G79czaXKxNLxakJOXX5DlPbk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RZVxAF77Ga7HangqeFYF2VwGVLxK5nhwS/buOt5qIE06+jKHvXn8z36XZZlYg+ykGJikMPMuXuPLQl3jp1mxmISM7km1GpuYVSin45Cbzp4R49pqY+jSWeCYZPKlBsiJKmO0KjjwDJ1fbmZkLykN0jfvbApzDdwuTeDXncnIqmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2321WUqY; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-70b03ffbb3aso4085370b3a.0
        for <linux-omap@vger.kernel.org>; Tue, 09 Jul 2024 07:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720537041; x=1721141841; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=E+2qgiMcws/zEYhU0U8G79czaXKxNLxakJOXX5DlPbk=;
        b=2321WUqYryjRpdRnEk0UIDXG+ut8VbTQ49slrM7iCle7F2w77CXs8ZaWN80ZugrI2k
         qiBN8ePRUbxSYNyddtWRSCubE/x0HRM3+8E3BsALHE4Emdkb7ju8Bt6vAL5HnxSMkWUo
         Am2oWWD5Ka+2SMdYOaUhKNhPkRrlIaVgkOUE9+WbobJBaJrDcH3OyvTBtLWsnV2kKglx
         PlzcCKeWG+fF+yfdWljtj38oPkYlefXWG4FbIwARcj4EuLY5vuVKKq5FrEMOtoDscVaT
         YGvDeDU3oYwAauqi7vY7OcM8oRl8QvyQdknnpgsaVpvhKhlQFvTRMz/f+Pq+MyQrUkgi
         1CUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720537041; x=1721141841;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E+2qgiMcws/zEYhU0U8G79czaXKxNLxakJOXX5DlPbk=;
        b=FDc9WsYekG3tjJ+QdrZOGDu1wNvCDftkWZhQK4w5Rdx3WRgwLmfJQ4IxGf+rbrmIp1
         mX9llJ9T24dFu1NdM1cMDb38AQYPuHuOqEXkcM5tA2sGk8CJ4GheaK5013x11fvVRKMy
         EycrZOknCyYycjSoyP7IhC8on2fc6tQUPsk4nsCPHI/hlI6e5NeJK/voMs0AGUjUYnfK
         ylg7YhStJIAwp5SJ2ArbQQ/LuTs7dNTIjzylWvSeQzyK2raKfuTOOLZZBjSitbxTuA8f
         RuTekF2HqJs/D0Vd+xwqHv+Iz/6QRkbeM2Sv1wSFLmpBPJd80ELcj49LXWdTxoqNf18X
         FfIw==
X-Forwarded-Encrypted: i=1; AJvYcCW8iK3xMxkzSfTtq8YDVwGlNc10LwAiX0uq6cgGPhv2rUzFblSbZui1Fpxr0G5/uGaSPCm/rQZ5u3+GGCMPwrSdNehFeSZOj+QeEQ==
X-Gm-Message-State: AOJu0Yz5N8a5iqK3mHSoeCQoYqxmtubNix3bnejHFUFgre1Ugtf7YMSi
	mZNaj87hfNaxwWKS9jhiNturdHqPSVZn+wYTNvF0t/3TwNH9SwAlERGVQAB5j8M=
X-Google-Smtp-Source: AGHT+IHBxyDTqHot1Bof92flB5B8IF6H+qntDl5XJDuMiMdjy4mEB3IU8Uyghk1nK/AtwiX8ha5uTg==
X-Received: by 2002:a05:6a20:729f:b0:1c2:8eb7:19d1 with SMTP id adf61e73a8af0-1c29821ad27mr3439447637.16.1720537041377;
        Tue, 09 Jul 2024 07:57:21 -0700 (PDT)
Received: from localhost (97-126-77-189.tukw.qwest.net. [97.126.77.189])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a34f9esm17194815ad.114.2024.07.09.07.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 07:57:21 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Roger
 Quadros <rogerq@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Nishanth Menon
 <nm@ti.com>, Olof Johansson <olof@lixom.net>, Russell King
 <linux@armlinux.org.uk>, Vignesh R <vigneshr@ti.com>, Tony Lindgren
 <tony@atomide.com>
Subject: Re: [PATCH] MAINTAINERS: Add more maintainers for omaps
In-Reply-To: <20240709135930.3405-1-tony@atomide.com>
References: <20240709135930.3405-1-tony@atomide.com>
Date: Tue, 09 Jul 2024 07:57:20 -0700
Message-ID: <7hmsmq7gvj.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Tony Lindgren <tony@atomide.com> writes:

> There are many generations of omaps to maintain, and I will be only active
> as a hobbyist with time permitting. Let's add more maintainers to ensure
> continued Linux support.
>
> TI is interested in maintaining the active SoCs such as am3, am4 and
> dra7. And the hobbyists are interested in maintaining some of the older
> devices, mainly based on omap3 and 4 SoCs.
>
> Kevin and Roger have agreed to maintain the active TI parts. Both Kevin
> and Roger have been working on the omap variants for a long time, and
> have a good understanding of the hardware.
>
> Aaro and Andreas have agreed to maintain the community devices. Both Aaro
> and Andreas have long experience on working with the earlier TI SoCs.
>
> While at it, let's also change me to be a reviewer for the omap1, and
> drop the link to my old omap web page.
>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>


