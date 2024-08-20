Return-Path: <linux-omap+bounces-1961-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D900C958E90
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 21:24:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7087BB21B7C
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2024 19:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D3F1586C7;
	Tue, 20 Aug 2024 19:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1Kj6WRMy"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D3419478
	for <linux-omap@vger.kernel.org>; Tue, 20 Aug 2024 19:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724181838; cv=none; b=MBfBsouApY3iIfO7Nq4khFlgCOSZM/AsFRsnTbfLb++L1sjRTCMR7Af5nAZpuriOGq/72pi80/9gm+8SzYuZVGbKovEBttLoqehkEzaPjN0JJi1ufe4w6p0nWaiM2JtlCr2bRY9+5+8j+gNzvEX4RaYsilVHuZEgj6rjmcgcLYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724181838; c=relaxed/simple;
	bh=UCKgMG+XkE0DiJdGOv+PmDioS1QdDyYIDdtgpJJe8Xs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BlqDH3moJgKtAxZuL/KjiO2o7PDmLdDK4T2TxO9roPBJcbk7HoJdFYUhSefR76iuzqLgWjG9EzEwIKMQ0iNpgwSVKyMRXBsIhmWSHjhVAB7rHJzxz8kyka3bMGDy4DoN0DdCA9rxGoXGOZibAc7FZZoRjbEBJLo+TQthauDxiYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1Kj6WRMy; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-202089e57d8so292315ad.0
        for <linux-omap@vger.kernel.org>; Tue, 20 Aug 2024 12:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1724181835; x=1724786635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgKl+Q4z63yi92xwbRSxpuu3dLivOddt6rZZNwzTx74=;
        b=1Kj6WRMyj47Jhr3dLpZOVY+URb4oOyvQGWHXj0PqJhVM0/OnKvrPUJmQUVQCrg3CuE
         5qNdlZEMRutzOmoaZz9ZkM/eAit7yRiq3aKV1jCYUaFKi+yryZaB8NJEVUnHU3OwFCuO
         cDjF8YxZl1N32lsnhQVRPDLPoEfRnzn7heeJB3D8dONZCkyKjNB4iCjh0U2sICiciOWi
         7Es/bT9LiQ62ZUVAQd6B4UsCYJutAKoTwzgMyRTcmJh2w1EVar68BCV70rJ3BHAwU9VM
         WVMLhi5Q/k4Bhx3F74M9u3LurQDHqSLppBxLYvVeQSkMztH2tEwq3KndULF7L2cIbnOj
         cODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724181835; x=1724786635;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgKl+Q4z63yi92xwbRSxpuu3dLivOddt6rZZNwzTx74=;
        b=ZSVfwYrIDiy1zcz3cswjG/s0GN9A3/AWZINCtrualDhAe2RvyInJQCSQsj4O71SgYU
         CalOFh3QxR3m6DXAOKPZtyTC3WfAkVP8/aB1sUOVDEl/Ff8Y5Iv62hW21ToTxPJY3gkD
         cC0b6gtvIZ6ZqbYQ6yTVN7sLhOd+EWUHX7PEdrG0eLgKP5Fd15BC9Ud8/5RdywNtmogq
         LsQA/tl6vKYSBvHHe4m/oqX+cIbzlZDwzo4XQQA96xQOEdkpvZabYX3L2xlyMuY5GxFb
         Lh58QnFqXAbaxOj6VRGV+1LYPTLwtSeEjlcvLg+8Acgfy9KDCoPlG99Gif0I+0JRIOqj
         CQCg==
X-Gm-Message-State: AOJu0YwXQiBBadwyoU0LYx4/mjhOmkZB+D+NnGIk5k3GI6mxTzmi+ZFF
	d/eeTHObyzhd2jMOh/WPJm7GclaGqSdvl2IZRytIk8vcZbDSQ2b+9GoPnIILxyU=
X-Google-Smtp-Source: AGHT+IGkzfZbN+ZgdCsMVV4OE7xNdvqUuWUJNV8N2My2uV3aREdOJ3bjmu3Tvm/5drrQMEztJUVXHw==
X-Received: by 2002:a17:902:e746:b0:1fe:d72d:13e1 with SMTP id d9443c01a7336-2025f1c550dmr64291245ad.30.1724181834771;
        Tue, 20 Aug 2024 12:23:54 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f031c5e1sm81824765ad.94.2024.08.20.12.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 12:23:53 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: khilman@kernel.org, aaro.koskinen@iki.fi, jmkrzyszt@gmail.com, 
 tony@atomide.com, linux@armlinux.org.uk, 
 Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20240813071125.1044697-1-cuigaosheng1@huawei.com>
References: <20240813071125.1044697-1-cuigaosheng1@huawei.com>
Subject: Re: [PATCH -next] ARM: OMAP1: Remove unused declarations in
 arch/arm/mach-omap1/pm.h
Message-Id: <172418183331.700638.8940224878410795483.b4-ty@baylibre.com>
Date: Tue, 20 Aug 2024 12:23:53 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Tue, 13 Aug 2024 15:11:25 +0800, Gaosheng Cui wrote:
> The omap1510_idle_loop_suspend/_sz() and omap1610_idle_loop_suspend/_sz()
> has been removed since commit feb72f3b313e ("ARM: OMAP1: Remove
> omap_sram_idle()"), so remove them.
> 
> 

Applied, thanks!

[1/1] ARM: OMAP1: Remove unused declarations in arch/arm/mach-omap1/pm.h
      commit: 1934b0c82e980df4c9503315bed4e178905cc1d8

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


