Return-Path: <linux-omap+bounces-3271-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90566A29DF3
	for <lists+linux-omap@lfdr.de>; Thu,  6 Feb 2025 01:38:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1535162614
	for <lists+linux-omap@lfdr.de>; Thu,  6 Feb 2025 00:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 779DC13EFE3;
	Thu,  6 Feb 2025 00:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jKsEJsa8"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B15E51C4A
	for <linux-omap@vger.kernel.org>; Thu,  6 Feb 2025 00:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738802238; cv=none; b=ZP2kVvrEi2xzPvaBuKmZCZX1xqZwK2o1PQ0amgzcjxpx+xxlDzzZsaq+zp4VwYr0OxHMLi+3S0WhemJ8pTvCkhy6Nfd31cVSBVTwmZJC5mUDwIv3kuHc38la37gTr4EdqaSzHFO1c7BlS0mUi3ymIZmoz4ngv0a+I+OkMjYewF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738802238; c=relaxed/simple;
	bh=9z/NlbEN8jSOw3hMYSM0ISuObqgiClju3/L+Fh35BN8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RSWLDrv5qzSvcdyCbM1vP6oGjD3RnRGAbkdUYYgJIrggLAFCgtwp4LaGBGCmZFNImdDfoio2u2KFvWo5j1K4CHohQSR63QBXl60Ix7LZd9r444jvXQ3DOmcXw0qU3ySO4HwHfUKNoKJwreJAOApprNB2QV+IFfv1Dn6qD0U111M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jKsEJsa8; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2f9ba87f5d4so396021a91.3
        for <linux-omap@vger.kernel.org>; Wed, 05 Feb 2025 16:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738802235; x=1739407035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7u4XADLr/C5eZ7qkGhMI8Yv7tVqEObjjFDJ5fXQvZww=;
        b=jKsEJsa8wqClIs5/nvZ2UJJGw76I8z4vidajJJ3fIKC4brix+6xGmevJetO3DdTUIh
         B97waMLf9AoXhmARXarGdZXGMIbhRO604mb6qU+s9tfrq7uRTGhcrz/terX4xnwTvu1O
         l48jSnNTcWnTiyu5sQkRIiSQggIWw53dNeM1loEG+IM87/JwqXfDbQpkfzPll3pteK0X
         1644Ab2pUgr6l3MdvyShFHvBH/zqXX3iZMGCZiAgO7geD+jqFob34WOTbvLtYjp1o9x8
         Ee/C+xTX0rKDUzxaakgZoBJQl2M48Km6Eus4fv9/UBSd3/qafHG0+TFfUYb78YNgcWdj
         tdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738802235; x=1739407035;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7u4XADLr/C5eZ7qkGhMI8Yv7tVqEObjjFDJ5fXQvZww=;
        b=anuO8h1qWUvQ8aM4zVzplv9iqP4/hOv42Q7RcikOUqTmeiJBVQzg2R9Mp6SUYhvf2L
         y/KIQmyZdC65a2oJD842el0enJ964UW58rUyuFFBLjm0ncMxYe5njiG3aAX9ckZDUPOp
         gpZrSLa4I8xiT348yYgjZRrWAVGy0XoMnc6+Hov1htBrM2A0yBgnU1hkAyTBFCIrAEE2
         zBIW76bhTvhNuVshdkiraikLxtg+z7aBgyRIAlRc4Oz67vsGDMJIZB49w43kdOrcidig
         dDZ9eq1Ky2es9lGZ1LWntCIzl1WDOg74cnQpcGHvGaRzeUK2ZFkujmF5cGL29YsI4Kqy
         Tk4A==
X-Forwarded-Encrypted: i=1; AJvYcCUjNG0g2KqJFhXrOAMvsN63W/rj1GgGV41wY0DdBNkU13NzQryXgGb0XvsGAsnrKNjhp8HxROamJNgh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1dgoN75N55UYf67vsXrxn8EUmQWP0XenrJJY5ktAz2XOFIr8a
	NCyEQsGSUhk2D4hikmkiwu7mqZur+vP3kDrkAX2vToU/2IVoZWrpuvxA19FzFkU=
X-Gm-Gg: ASbGncvSyTTz8Uee+29/TmV+sCBj7S2WtoiUhJ9QUO690risGD1WC/KQ2e2cqzuqBoO
	SykKyH27kROKO713OfvhmO/4Ny1ffB8AZ5Mfgqof5g8wAo8jnq+D/QOejFzq2vw+uviFZCmQBw0
	xuezWGNue/bWbak1Epb9Mp8jTnvnvKB1+t19JARDTOoUrHagwaQKxhTQ5w9eZlsqJso1+oGyFGm
	2nQDqwYjgEWF5OCd4PtuD9rr2WsaULc0jcx7liYb/k4g0xGyGwIsWOzhfByV22wQxaN+wEPxHE7
	zeNijQs/Wt0e3Q==
X-Google-Smtp-Source: AGHT+IECtRNllbLpK+x9JkKsoGM9WVGfThDVXSbLPfFhNXjo7Zhdyn7+h2ahM/Hfy/0Z08HwPXvJQg==
X-Received: by 2002:a05:6a00:1942:b0:728:9d19:d2ea with SMTP id d2e1a72fcca58-7303513cbe8mr7280503b3a.13.1738802234722;
        Wed, 05 Feb 2025 16:37:14 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048c15bb9sm61111b3a.122.2025.02.05.16.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 16:37:14 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Arnd Bergmann <arnd@kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, 
 Tony Lindgren <tony@atomide.com>, Masahiro Yamada <masahiroy@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250205121151.289535-1-arnd@kernel.org>
References: <20250205121151.289535-1-arnd@kernel.org>
Subject: Re: [PATCH] ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP
Message-Id: <173880223388.2488567.3141490107424057794.b4-ty@baylibre.com>
Date: Wed, 05 Feb 2025 16:37:13 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-94c79


On Wed, 05 Feb 2025 13:11:33 +0100, Arnd Bergmann wrote:
> When GENERIC_IRQ_CHIP is disabled, OMAP1 kernels fail to link:
> 
> arm-linux-gnueabi-ld: arch/arm/mach-omap1/irq.o: in function `omap1_init_irq':
> irq.c:(.init.text+0x1e8): undefined reference to `irq_alloc_generic_chip'
> arm-linux-gnueabi-ld: irq.c:(.init.text+0x228): undefined reference to `irq_setup_generic_chip'
> arm-linux-gnueabi-ld: irq.c:(.init.text+0x2a8): undefined reference to `irq_gc_set_wake'
> arm-linux-gnueabi-ld: irq.c:(.init.text+0x2b0): undefined reference to `irq_gc_mask_set_bit'
> arm-linux-gnueabi-ld: irq.c:(.init.text+0x2b4): undefined reference to `irq_gc_mask_clr_bit'
> 
> [...]

Applied, thanks!

[1/1] ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP
      commit: c2a5f8c4f28ffea8c93d10e509c5a6e61172cdca

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


