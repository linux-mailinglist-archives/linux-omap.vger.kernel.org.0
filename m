Return-Path: <linux-omap+bounces-4948-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF97C6B6E9
	for <lists+linux-omap@lfdr.de>; Tue, 18 Nov 2025 20:28:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4DCF94E4119
	for <lists+linux-omap@lfdr.de>; Tue, 18 Nov 2025 19:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EAA02E540B;
	Tue, 18 Nov 2025 19:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TvOPYDBk"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2EF2E173E
	for <linux-omap@vger.kernel.org>; Tue, 18 Nov 2025 19:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763494077; cv=none; b=kYCjKpGlcvYoktT7fptTL8TpCw+G9hbTF1n9EpkmYEpwnoPbnDSqvlHekgIIUIRgiMKRH/d+hh8L4ELhjnPko8QfZDXZUIMjlbmAEa5oGL/AmYR4iWKCq4pC/KRjqdUlqC+fsBobE7UO6g57j9V1KzUm+rjl2d3sYlro/+/+/Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763494077; c=relaxed/simple;
	bh=S0ioR2sIrAXpv29q2x5WdPHoyTiEWckgQi7HP1uVvBw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=X1LDpXrt5UjtGLpXFzh0R4cIBs9YELpEwJ6GLAEiB6TPs1pz30ppv/L+f7muOtc+dtJDnqwMdGf8wSumc66PODdP7pzC0kCQ+nYNbisYop2z+4YT1Q39yeKgP5lXDNM+zZIAZS+ep15TGDyTj4ZY9JyPDc6gn7ecQfkWQY8aZP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=TvOPYDBk; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-299d40b0845so48107185ad.3
        for <linux-omap@vger.kernel.org>; Tue, 18 Nov 2025 11:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1763494075; x=1764098875; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zuGTGce5+ejRcy2UUHdlfkw4cxpc0fpfUZqTyg0JihY=;
        b=TvOPYDBkifL2GDd+hfIiyqWA+0JgBVIrc081E314Pov/6UqerPQogrbBr9gOEqxA5O
         A9d0yeafz2CbyJCRVt7H3sfOQHG0PvNn9ogN6ar2Vgb0DN+povWYbXRwZnjrhr8T7byJ
         RgUGdsFWe8FZJ3PXfmD+j9Pm/QIC66EzXZh+ZJ3FFdfvJkYghfHdkXcXc/vViMXwkEDr
         Cf5ffXpLHFESVcm1y43HUjbnsolUKcWE29Gar550FFN0WLKkmotZUVWpF/vHLgoj5oB/
         f3xo3eavp9moxc89cN97jrfTZ2f31aTTWEeD36vFpkMFhY3pHY64qL0Hg2AF3n6FW2s6
         iHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763494075; x=1764098875;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zuGTGce5+ejRcy2UUHdlfkw4cxpc0fpfUZqTyg0JihY=;
        b=mj/rP5bpISLZZSno5I526cWTv4PtodlpFlPz1G5aTZkqQLqIiCVOV4Y6gEBOaBBWRO
         ZIkkxM18ZBwp9LAEPhQBjAlWgINreMFdQUv6Mg8y32K4oGDTq166Qrl3xpDzyLqv58Kn
         1hoNKVFovA6bLCmnKnZsMnqj07ouwGEveDNCeyNWN6dPaeoTJc1gVdp3H/R0doKA2uzr
         k/mIR9jMUPf0x+E1GqlpdcCgUkt8sO3PjdB9BqsW/i/Tvh9c8ydqYraRzQ5u8uhziDG5
         29GH06GW4lD8ICgnUp6L0/GrOz1DO+x3SdOKYLiE5H77CNq1M9FLUPhrAxB9GwSfqP9o
         b4WA==
X-Forwarded-Encrypted: i=1; AJvYcCVXeI1ra+yAZDZvfFsMBpYwoHYTkn6+UpPwUnI0HntZJoJXtS5XGhI5flA1bq0xD62SXoAMPglGXnu+@vger.kernel.org
X-Gm-Message-State: AOJu0YydGVZc7j43Ivbf++ciqCgEBYB1yjJFqQLMXk8E1KEz3GrgXtJK
	hF/7NyrfuhRu2dfZvtMuwg2SNIDz/ObvMaClueAL4qAinhtb4w4mimGONKRmqBosVuz0PTLojsA
	hiwVyp0s=
X-Gm-Gg: ASbGncu5azrcWZRs1z4fmzqexhLZkgheEUrnRRlwunlJ8uUhNHWB6rMkWfg+CGq2H9A
	b0PqgNKYK2V06PX84jEa90o++PkUBk6298t1y+GSZ5f50Lav26oWjHPNepT6W403duBgSfp2ozT
	Lw6GJ+iuBV2pdo6PDPR7Jozzi1c8FErfatbB46EgaOOVxMKuFBfnNUhww2SNG+HAxjM5et2MbOQ
	jrP9MBBGAVt0TWmm4idCDuwdP6ywcMKlNef235mXQnOq3c3A4/IyVBJMnVPGnkVCrK9ysNhtvg5
	aLYP9rNJlvXVg6f6K8kQfjADg8AKtxNg0YDM75p1DDkxJ3Zrl1efdyw50hIhlSKkWy8h5MeoFZT
	RRK+ZqLgbrK8QSBFLnoWdhLJFdu5k/+E7Zj76OsUrFjAK5fE+psaRrSe2GB66vcfyOjxa+0lHkK
	70s3mQ3zy3
X-Google-Smtp-Source: AGHT+IGZ3c+wfhKHUB5FsGWWCStrD2y40OQWGybbUtr3wa2hWFhXVzhRdqJOVDIYfn5kzvcKCFZSLA==
X-Received: by 2002:a17:903:1a83:b0:24c:c8e7:60b5 with SMTP id d9443c01a7336-2986a6d0be5mr184151895ad.16.1763494075493;
        Tue, 18 Nov 2025 11:27:55 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b106bsm182419515ad.58.2025.11.18.11.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 11:27:55 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Aaro
 Koskinen <aaro.koskinen@iki.fi>, Roger Quadros <rogerq@kernel.org>,
 linux-omap@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] MAINTAINERS: sync omap devicetree maintainers with omap
 platform
In-Reply-To: <20251117195301.05f17649@kemnade.info>
References: <20240915195321.1071967-1-andreas@kemnade.info>
 <7hed5cpwrc.fsf@baylibre.com> <20251117195301.05f17649@kemnade.info>
Date: Tue, 18 Nov 2025 11:27:54 -0800
Message-ID: <7hjyznf8ed.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Andreas,

> On Sat, 21 Sep 2024 13:39:03 -0700
> Kevin Hilman <khilman@baylibre.com> wrote:
>
>> Andreas Kemnade <andreas@kemnade.info> writes:
>> 
>> > Both used to go through Tony's branches, so lets keep things together.
>> > This was missed at the time when Co-Maintainers were added.
>> >
>> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>  
>> 
>> Acked-by: Kevin Hilman <khilman@baylibre.com>
>> 
> this seem to get lost, what about updating/sending another maintainer pull
> request?

Oops, I had already sent PRs for v6.19, including maintainers changes.
So instead, I'll just send this directly to SoC maintainers to apply
directly.  Hopefully it gets in for v6.19.

Kevin

