Return-Path: <linux-omap+bounces-2315-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D194991178
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2024 23:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E45CA284068
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2024 21:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20406143C7E;
	Fri,  4 Oct 2024 21:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kXK1pPkq"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A3212E1CD
	for <linux-omap@vger.kernel.org>; Fri,  4 Oct 2024 21:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728077616; cv=none; b=qWaIcT7DlAVmgMu/HsrZeGAfHN+HC2m7xLuhpWnf/DcHvFwebgQzRLCo6XBFspp7so6qIUCLwqom9v1JTIMVAohgU1tIt6wVJ97sTcqKSb2Dm76qGTnWgYXSsUI6K66BMZXD4jpt6R5nsqPlg3caA6auukPQTi8mMr4/6ZXpQAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728077616; c=relaxed/simple;
	bh=KpNAlnNNQR3ZYwTAsI4VXp7PC9LokjG3OFYlBinwNQw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Q/bsxvo8aF8Pk0ZoWpBCid6KJRfJ8vxtSloIZm9ghV8m8/2iSwV3fRFovMF4ddgF5cexMwFqKukJsnOFfqrjzG9ESePAX8sWltxcFaoET4d8fBVsc93qz/ASFUe9q3wJtnHgZ5vTcQwp18hQnbCK2wvtxyIkqbiStZLvezqPT1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kXK1pPkq; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-718d6ad6050so2259140b3a.0
        for <linux-omap@vger.kernel.org>; Fri, 04 Oct 2024 14:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728077615; x=1728682415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HoYuRewxdam2BJkXXk6YiCo/fRJyTjJYkbtETeaOEpA=;
        b=kXK1pPkqDnrlqD7aW3VMwtjlyqUCeR2Nu4FTe3qHjq7z4+v6iCM4NgG9Axkp7BsxPu
         A/kp1ldrAv6MR0S0oNpQFuDKWXnCORCIuSAd1XzsOGOjNYKISIesjglim+iwY4EJxkC9
         to2SWuLWCve6pO6YDoVABw9eop6asJj7DhpMbom+H/EZdQCzGZoTBtJSamf4RKIVHtSz
         ip5gRU10LqBTU5YU2x3znQ6GhYZ7t02HGyh4wDT3sp+maqBm96kf3o5F2O1QY7PgO2Qi
         HUBvw1dDkb/XFIb75fAFDTdsy57hCUueUypcS7WdBVe4Adjyd60H2WrcrUKdvaxaVrIB
         GS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728077615; x=1728682415;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HoYuRewxdam2BJkXXk6YiCo/fRJyTjJYkbtETeaOEpA=;
        b=U9rUAU5wBFYa/4tjGUhCFU/qX4a+pFjMExE0s3dKgC4ywZ3iPwWDMFrI2ydpAj73TP
         yc/OsBq/ctqPBbTlwun6NlR6xBJGCShJ5B25Zm7LKsG9fdyWS4dk0xtzrR7jgQNvW+Py
         XLfaGYm4wirfCm3L5RIML/REZDectS3ycNLP5mOf432ieO0U1KSTKOYBEkIOQipbev1Z
         ahzhZnuoll8E4eN6/iyveMzfaf8+4CdXqH+DW9QmI0TCkAfAAY0DyT5x/y+h+w+/grDY
         4KZDFx9dK2lrk6MOK7RcaSbvgxQeGU1sVmSd3Y8j2izU+mvFzEAu+hjgzOxxkCGcpkeW
         5kKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpg5jXVqxmLeb81fN1z66fFzaoLmXjiFBN3Y06818ijR3PNK1F1SqrTbdKnTq5FpHyZDj21PglIctW@vger.kernel.org
X-Gm-Message-State: AOJu0YyjGcZbQWIrzbIMI0e85Mfum3g+YaqxzLRbYX3FM5qRFrBzNGRt
	IYbsMEq9TTm/aZ5HpcF/coKrZM9Re6hQWHrZdBTMHX7AF1/51hVQ6Q2gzMH9PYo=
X-Google-Smtp-Source: AGHT+IFKUIRhdQ9l5znjAusOODIMyqip8Esq800APLLqiTkfo42Xc52cIX97i1QDAVolizS/F4U07Q==
X-Received: by 2002:a05:6a00:a91:b0:71d:d2a9:6ebf with SMTP id d2e1a72fcca58-71de23a9290mr7008106b3a.6.1728077614681;
        Fri, 04 Oct 2024 14:33:34 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0cbbab7sm345980b3a.18.2024.10.04.14.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 14:33:34 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Enric Balletbo i Serra <eballetbo@gmail.com>, 
 Javier Martinez Canillas <javier@dowhile0.org>, 
 Roger Quadros <rogerq@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, srk@ti.com, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20240903-gpmc-dtb-v1-0-380952952e34@kernel.org>
References: <20240903-gpmc-dtb-v1-0-380952952e34@kernel.org>
Subject: Re: [PATCH 0/3] ARM: dts: ti: omap: fix dtbs_check warnings for
 ti,gpmc-nand and ti,gpmc-onenend
Message-Id: <172807761391.805138.5382543711248730495.b4-ty@baylibre.com>
Date: Fri, 04 Oct 2024 14:33:33 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cb14d


On Tue, 03 Sep 2024 19:43:43 +0300, Roger Quadros wrote:
> This series fixes dtbs_check warnings on OMAP platforms
> for ti,gpmc-nand and ti,gpmc-onenand.
> 
> The following warnings are fixed
> - "nand@0,0: Unevaluated properties are not allowed ('linux,mtd-name' was unexpected)"
> - "nand@0,0: Unevaluated properties are not allowed ('gpmc,device-nand' was unexpected)"
> - "omap3430-sdp.dtb: onenand@2,0: Unevaluated properties are not allowed ('linux,mtd-name' was unexpected)"
> 
> [...]

Applied, thanks!

[1/3] ARM: dts: ti: drop linux,mtd-name from NAND nodes
      commit: ea453dc2d4d6b7bed89386fe76916252993676ab
[2/3] ARM: dts: ti: omap: am335x-baltos: drop "gpmc,device-nand" from NAND node
      commit: a9c81b1d47baf1a187d240da6e4e6cac2dd668e5
[3/3] ARM: dts: ti: omap3434-sdp: drop linux,mtd-name from onenand node
      commit: 9fe9af0ba275f0109d118ccbd8a438989ca6708a

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


