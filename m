Return-Path: <linux-omap+bounces-3204-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D27FA1AC79
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 23:09:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F3043A5AE7
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 22:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62A51CDFB9;
	Thu, 23 Jan 2025 22:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKMIydx1"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168141C5F3C;
	Thu, 23 Jan 2025 22:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737670188; cv=none; b=ekKKrBmEi8vhJDAHTy1TxkyajQUVe9W2EVvh+MJ1S/NZ5HMP9vQNoLUnIupbb4RT5NnInUQ8wpaAWQ0ylYDDnZ6nK/ZDlYRuSiInhFx+yg9gpQYz6gB90rbUOJHGZL8OddgCi8FWEuu7QTWG2BgTabVSX2uM8s1uhJ73zaZLnok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737670188; c=relaxed/simple;
	bh=of5cL6/+qOoRg9YP5cPEffaBHv1Z5kpbQkudvY2YUSk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=rKrd2xfw4Q0YwceA1PMF5EGy8X1aPBI2tt/RNoKatyzm+GkBmWzyO3sNmkojzFq8s5GC7zBOWb4kXu/ij4VJJvGFvwRCAXA1Kei+WEnLQd8eZDtoQUY7VchaKEdKaKL1jLbAtVL/WNgKXa3QzAplkHp+CL9cfleI/KbAEf9DDcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKMIydx1; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e54bd61e793so2548817276.2;
        Thu, 23 Jan 2025 14:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737670184; x=1738274984; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dj1TvDjeoPrTYwF3xPoDAMnJ1BFBe+7LZouUD9pmMM8=;
        b=ZKMIydx16b1+fMtggcIdDNsOdcckmSchN4/b1o2mbDjuM74L7oYdiyocAoZ5Qz7thX
         FKeAcIs752r+zeEXcR7qSiJvOh5Bf2tjewo0OA+ATmBUIfBhNEuhW31haiCr3kMDfLTX
         F/YWuyBuBozG+0FxHVE/oAYpjBJd2sLLMiPYL2UIcivKgNHbeKMgLYun3LVj0RPRQgd4
         wWHgQ+BKwXtYyGP/Avw/KgvDrX5fotQPeu2kHp8lPzE+t4EpAr7DfkG/Uas213dG2i54
         5aW2SK9h48UJyvEQE9wgG62bYnA8HQteXi4+YFNohiqeZ6LY0uNKyliEd0MF2K4q4P/N
         AVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737670184; x=1738274984;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dj1TvDjeoPrTYwF3xPoDAMnJ1BFBe+7LZouUD9pmMM8=;
        b=IXJrYgusfdPeIVCuT2zi8ip0lJT63ZcQ7dRB8Yjkgf1v85Ka8BW+qLJ0RqFQRFffm+
         coryiCOhQQamUbXHgGp9kH/RyBrKupb2TDOzHA/pGqQ9WPpTJdZnBvljeIJLI9jduZku
         3/S0qBKzS36qdthZbElOWzZfG75oNIIfsct+mAE8gU9b3sXxoTuUuj/v3AqvtUwyrs76
         jcUm0ghIUvrwpFUVCh5lSOsOFgbp4UpgNs+Hxp67cdmvhD2S4daiz0Q65iX7eGZTw5cM
         Xyn4f0ENIOrkCIFVY2mnAyco3rvFluNIDTP4QvPl3OP88qpUUELvRP6m8C96O9csD3h0
         Ubfg==
X-Gm-Message-State: AOJu0YxreiHvUsdRUPA1fYAOSVrm6wCTTuJYAYyq3x/HlCUVvrjfoHhB
	U8FhF2XnYfO5AbBjfGzCnn3EvJHQnHEUhZYSnMfUSNv6Vp/9WV/itGCLdw==
X-Gm-Gg: ASbGncsyS6B5l4STTG5xWhwpUL6tPH8XYYUJ4vMRUL3o0R8BZ3G9WyK/XO5BI9bgA0b
	q+pVIH3FOUInRRYfKC2/w63sSPB15IejWUZGT3t4O4Sl3jE1BOXHJNLRkJIMClFNhG/OdgL13yY
	IqNHIs+lBDBfqOp3iJMA5kzfbs6VM7cW9QWvS6YYGP/Zgwp9ltvXSYYIdZRlVPmXgSOR2Mg0GOD
	K14XdMUUMDs10KEesuWBjurDm1wzhvQbwlq3ubiSRyUV1yIwOKWk6522Y+mvfUQJtjXQvmHTb8e
	NgHxHr0x
X-Google-Smtp-Source: AGHT+IEfzkGQ0veUy80Cm/1qhWlsWovOBfH8N50gDSVNmJcqKnU18hBldbvejwZ1FSJWiq9J6Ywj6A==
X-Received: by 2002:a05:690c:7346:b0:6ef:4a57:fc98 with SMTP id 00721157ae682-6f6eb672336mr221869717b3.16.1737670184314;
        Thu, 23 Jan 2025 14:09:44 -0800 (PST)
Received: from [10.118.1.247] ([204.156.190.21])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f757a2de28sm1282807b3.111.2025.01.23.14.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 14:09:43 -0800 (PST)
Message-ID: <1c5f72c4-3d55-4d62-b690-8c68b76a15d2@gmail.com>
Date: Thu, 23 Jan 2025 16:09:43 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-omap@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
From: David Owens <daowens01@gmail.com>
Subject: sdhci-omap: additional PM issue since 5.16
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

I have a AM574x system and encountered an eMMC regression when upgrading from 5.15 to 6.1.38.  The eMMC is using mmc-hs200 powered at 1.8v.  Reads from /dev/mmcblk1boot0 will return expected data except when a delay of several seconds is inserted between reads.  With a delay between reads, the read will occasionally (~50% of the time) return garbage data.  Using hexdump, I was able to determine that the "bad" data is actually coming from /dev/mmcblk1, not /dev/mmcblk1boot0.  The same thing happens when reading from /dev/mmcblk1boot1.

Much like a previous report in the linux-omap mailing list [1], I too was able to correct the regression by reverting the commit "mmc: sdhci-omap: Allow SDIO card power off and enable aggressive PM" [2].  Unlike the previous report, applying the sdhci-omap patch [3] did not resolve my issue.  Only reverting the original commit allowed for reliable reads from /dev/mmcblk1boot0.  I also don't see the same I/O errors mentioned in the previous posting.  Reads always succeed and return the correct amount of data, its just from the wrong device.

[1] https://lore.kernel.org/all/2e5f1997-564c-44e4-b357-6343e0dae7ab@smile.fr/

[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=3edf588e7fe00e90d1dc7fb9e599861b2c2cf442

[3] https://lore.kernel.org/linux-omap/20240315234444.816978-1-romain.naour@smile.fr/T/#u

Regards,

Dave


