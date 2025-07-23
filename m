Return-Path: <linux-omap+bounces-4113-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62769B0ED30
	for <lists+linux-omap@lfdr.de>; Wed, 23 Jul 2025 10:28:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 266991C82552
	for <lists+linux-omap@lfdr.de>; Wed, 23 Jul 2025 08:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F461279DDB;
	Wed, 23 Jul 2025 08:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tcNX9ZTf"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED6C19C540
	for <linux-omap@vger.kernel.org>; Wed, 23 Jul 2025 08:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753259302; cv=none; b=lkQfC3m1qeKWMUlXZwAmjwhaOgGVDrH/jCVgHSLT8oxgUof2sJZyjgQz1Oac07Cid6CP6vWbVy8zvaan+3nrEjp3czNq/KG+krNJRjIngqPMnaRri59xnbNsMIuJuW1QYr87TVZKeXZCv8YSWThiQxHOKaGiw1vq549y/j/pRks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753259302; c=relaxed/simple;
	bh=6MvseLLstFmue4ctlegk00xpra/zAxh0ntDD9nuLHKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IgEAxDpcT45d4wGtKuh+FxtXeHh80Jn93K2UpqT00qvL4zZytMf7AR45f6JA+bRD/Xsm6IIoHj9/cbSjdfqbxIbjLJF9ZC0QmrptQCEb5NRmmsXQuzXjUg9rPn60Z+QprdxddAVsNgZM6pUyteKgJDCvzRcyaIz5PoRgt1QJAG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tcNX9ZTf; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a51481a598so3395521f8f.3
        for <linux-omap@vger.kernel.org>; Wed, 23 Jul 2025 01:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753259299; x=1753864099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pc4bHJoJoj3aO2qd55BKMxrmnifl3uVSUSK3UCX05c=;
        b=tcNX9ZTfqfYkN5GgXb1CjxNKTK+8gD213fjHDke4HfRdJCjgm5fiV2+86jidELOU0O
         s/667/KO492whsqH6eNLXnNzqmd/s/QZeLX61yk7UdC0nwr61pWlgbWSl/jc8f0Kcwfj
         muRqcggEN71r0tY24gyJNlhji0UUIw1wkzf02ZodHNaxMEbc/M4MNlpzCC1zXpJ14+Fi
         3NHaYgR8h4TazZeMrNmJIhTqTUuqquRX8ZFBVUTnf2/uZFlzBzvMvQo8Co/YTQCKHxgY
         kM/8jabCm7/Mh2q0C52okNLwxUSK3BBr2TE2kYVq0V5eXwQS+VlHsqZKMU4fnBUJymJ2
         VBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753259299; x=1753864099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pc4bHJoJoj3aO2qd55BKMxrmnifl3uVSUSK3UCX05c=;
        b=nkqlUqXdM+ONyBYBW7tGqzukUzKdQZ90lrMr0WYjOuxKGRaOofFo3hyRC/kBiTTYJ8
         fUQ9gGh7S0EsIu0UNJnVGuNG57Zt2JT/EnvAYTqDIr/H0XfbuV4Ehlok5e9sWVzSt+OX
         y04yWHZwKK/F6g7wwpG2DkhvjxD/qrELddpesCRTlJKAVt7YWbmygMIkjqd/jw+m3aSh
         rTKfl8nie6ICik27D9SRATCSpFvmCfduUdVHiRxU3KduZ2eTc34wyDgru5NMvEqpV8Ue
         8xYKFjVFnjk96R6MUfxTBIlDjYnLGSIzSovJ2jXY7ebaFFtLzXpLzlhSZkHfyq64T3xz
         5KWA==
X-Forwarded-Encrypted: i=1; AJvYcCVHPREgYy7buN1ds5VERzS2PVOGUwWkiFUmX7smFGa3kxQGhJTuUnEJmGwp8cvdub1EC1i4jCzwtlr6@vger.kernel.org
X-Gm-Message-State: AOJu0Ywct6CSNBtCTqwMHM6kqJAUke41/ev/aoiMqOOmMuBxFhfFKz4z
	6ge1iolWIITOdcNDBKMHKSFeILVbvaWnJ3bDerUZxQ7v+crcetSnw3mQGfMXDATPZKJ5zLy6WCW
	29ct7e0c=
X-Gm-Gg: ASbGncvDrOMN48DCygLNFqPIr47Br4LD88kjMohTDAYanAFF7HZATPhPUGQqdumjivv
	xVx0tVrRhNxerL0nEUK3+8La4FNPUHTPuROTCnvR8hqEceenLjxvllbWojrxX1jpLhX13DkB6s1
	eeAfLg3KSOjmsR76IrfNh7wGJS1/WSFNAJ3SjBvuCd+wvHco/knJQb4wxNnL0zu3+ufMyCKX2S9
	9GQKnKRt/xDf31leIypLEdyurCN89L0Dtc9ryanmC9xObAbA2VOXjog4U16HTUxtersIzOJ/dWK
	pl+VXhycD9J7P48534Yxsqt35eo18fE5QkMhZSLijVhwMcjJWyLfgg32/ryEPOv/ivL8F0u/4sK
	/UNnD3Rb/QpK1+FMuLxVMUg==
X-Google-Smtp-Source: AGHT+IGK7N5pQ0+Y16nUh78stgbWDqftcQGNI/Gok59MRheVUKxpWDHp9OeWD2BQW29JilRfDWRv4w==
X-Received: by 2002:a5d:588e:0:b0:3a4:eed9:755d with SMTP id ffacd0b85a97d-3b768caa1c0mr1809547f8f.3.1753259299570;
        Wed, 23 Jul 2025 01:28:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:34cd:b1d:d4f9:be03])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4d7efsm15696894f8f.67.2025.07.23.01.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 01:28:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	m-leonard@ti.com,
	praneeth@ti.com,
	jcormier@criticallink.com,
	christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH v8 0/2] Add TI TPS65214 PMIC GPIO Support
Date: Wed, 23 Jul 2025 10:28:17 +0200
Message-ID: <175325929438.26908.5347574022964000296.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250722181609.1541739-1-s-ramamoorthy@ti.com>
References: <20250722181609.1541739-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 22 Jul 2025 13:16:07 -0500, Shree Ramamoorthy wrote:
> The related MFD series was integrated in mainline during 6.15 cycle [0].
> 
> TPS65214 is a Power Management Integrated Circuit (PMIC) that has
> significant register map overlap with TPS65219. The series introduces
> TPS65214 and restructures the existing driver to support multiple devices.
> 
> TPS65215's GPIO specs are the same as TPS65219, so the "tps65219-gpio"
> compatible string is assigned to two devices in the TPS65219 MFD driver.
> No additional support is required in the GPIO driver for TPS65215.
> 
> [...]

Applied, thanks!

[1/2] gpio: tps65219: Update _IDX & _OFFSET macro prefix
      https://git.kernel.org/brgl/linux/c/8206650c604687687bed5898b3bdb90e5d361ed4
[2/2] gpio: tps65219: Add support for TI TPS65214 PMIC
      https://git.kernel.org/brgl/linux/c/1b6ab07c0c800ed32ce417b71b32bb1baa91b493

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

