Return-Path: <linux-omap+bounces-2066-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8624B9668AE
	for <lists+linux-omap@lfdr.de>; Fri, 30 Aug 2024 20:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 306B31F20F0E
	for <lists+linux-omap@lfdr.de>; Fri, 30 Aug 2024 18:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0CBC1BB688;
	Fri, 30 Aug 2024 18:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="EWc9wfex"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF3D61FEB
	for <linux-omap@vger.kernel.org>; Fri, 30 Aug 2024 18:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725041157; cv=none; b=hMrrhkim3C6AOKEujMex8Mpu84H2w8tHS9BriqZwepvgrkv+jZwQg1vfw4RAXKPY31KL9NQ/C6kcyTYiyoTUmnZTbTsIWobdEaEZGLUQ5JpLL8PnCBvQQS+ouNIb+akCCIXD9X6Dz4UizU4dvk57sHMWOWNzPaRCr4zH4luweP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725041157; c=relaxed/simple;
	bh=nq4Qfq8lHoZFc+4PMwqww8P9i+z1FAVvBhmm43ZYHEU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HNPt/QelrEaAyBljcTEmMm+MOgX/KKb6EtjjF1QRBF6ZJP2Xh9B6JKldyAeC4qX5+QIwdOWpWT9DiIE9BthdmViu5rlUBypELPST8pl0/ca3Xn4Q6EWWxHGBXnNFIXEX0Jr6Ug3gngjr+WXNYoh6qwB4lU8Qnh2gz4rgkFDB4HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=EWc9wfex; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fee6435a34so16185725ad.0
        for <linux-omap@vger.kernel.org>; Fri, 30 Aug 2024 11:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725041155; x=1725645955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNxxfRKUZKam7lquivsQmLZNrt8P82A6eZTNVlqVZXc=;
        b=EWc9wfexrFa7RZvuLNQt3rM6sFODTpUo+mQ7OCKes4QtxrCbG6d1xFE6Ep/2ADaEiV
         FS2ZsUbjmPuZ1IPM5bpV6Jq5/2fhTb3O7Oo5iXsTrbLJMRSUWht1FMN2YNMidSLHJpxu
         EPizp75BHcy7D+MoYZmcsBmlWN2kP9bajQJcLIfbt1QEApwmE6lqAfrfFkbhOJ/qMAI2
         DwanmbtewuA8+G/aY6dcRxeykf1CEHJPnISxgaFeY3XsCLqAuLlZHPT+Mdy0tTcAobjj
         er/6rCUi+e36GYWS8xz0jLz1KfXP/dstZp0O//iYC3c2mJ+RQR+Ca2VO29lU1guQyCG0
         gGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725041155; x=1725645955;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NNxxfRKUZKam7lquivsQmLZNrt8P82A6eZTNVlqVZXc=;
        b=LyFkmzVYeqe6qJLPnvG7gy8XledPe4zgtP+igG50lk9KOiPYwGCPjwIF7vlO6ATnfq
         CvpAcpsxQu3KwsVGcoR9Cl0SRlwjhjCNA76MQK1C1ugjNvoE2FU1jakCRu0jwonb2nAn
         rukRKkSRonsLxESRa5m/7lmp20bRj6lEhN1le3MBlkBqq4cWTWXcy+Az8iPiCc6XvNu+
         Tcj6AUdYTFR1gXgU/6rYyx0nhQR2QrjDzdhUz6sOpYB2Wx1VT92R0bvp9Xwy2jYIuwsC
         NLXKK0F6RbYS9rlQYXqHvT1dFMoVpLSyLn3I3M+IDAM+usOGnQ9vPBbKJzeCsKMh8rfH
         x3Xg==
X-Forwarded-Encrypted: i=1; AJvYcCV5NTuSZygy1Ko0RYJ8lkh97mprKfCM3exXyHxn+hWpZ+RK5Fcfx/8uJ88i/bvZsFoH0JTuUMIntKNI@vger.kernel.org
X-Gm-Message-State: AOJu0YxiiD6ZYj70bpxxOF5pNvuRTvno7U8yX+1gb7yYhHW5bPi1UrD2
	3KoJeoM9iXzqUxAAkZgB+5ELZM2m1ZYtIT39ZYudnxUZUq5hZO3vPUy5qj0iD0sN9vN7YIwLzi0
	W
X-Google-Smtp-Source: AGHT+IF8qGEsxgZzdNF83sOwxCybB3JWtCJHvy5Au2yTxDGYWFo3nXF5cYew+3I/Ue6rdLGdbkXhdQ==
X-Received: by 2002:a17:902:d48c:b0:201:f0c7:6a00 with SMTP id d9443c01a7336-2050c45e2f5mr87974605ad.53.1725041154736;
        Fri, 30 Aug 2024 11:05:54 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20538532e86sm8324725ad.5.2024.08.30.11.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 11:05:54 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: aaro.koskinen@iki.fi, andreas@kemnade.info, rogerq@kernel.org, 
 tony@atomide.com, Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
In-Reply-To: <20240826035823.4043171-1-cuigaosheng1@huawei.com>
References: <20240826035823.4043171-1-cuigaosheng1@huawei.com>
Subject: Re: [PATCH -next] ARM: OMAP2+: Remove obsoleted declaration for
 gpmc_onenand_init
Message-Id: <172504115413.3374872.17730640308561644924.b4-ty@baylibre.com>
Date: Fri, 30 Aug 2024 11:05:54 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Mon, 26 Aug 2024 11:58:23 +0800, Gaosheng Cui wrote:
> The gpmc_onenand_init() have been removed since
> commit 2514830b8b8c ("ARM: OMAP2+: Remove gpmc-onenand"), and now
> it is useless, so remove it.
> 
> 

Applied, thanks!

[1/1] ARM: OMAP2+: Remove obsoleted declaration for gpmc_onenand_init
      commit: 9aee8262445d185960431e972e2d997e6aba3de0

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


