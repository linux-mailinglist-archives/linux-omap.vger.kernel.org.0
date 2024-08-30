Return-Path: <linux-omap+bounces-2065-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C380C96688D
	for <lists+linux-omap@lfdr.de>; Fri, 30 Aug 2024 19:59:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01E871C239BC
	for <lists+linux-omap@lfdr.de>; Fri, 30 Aug 2024 17:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03CD51BBBF4;
	Fri, 30 Aug 2024 17:59:28 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8B61BB6BA
	for <linux-omap@vger.kernel.org>; Fri, 30 Aug 2024 17:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725040767; cv=none; b=dtIGt+xBBNRYt+pqKU9jgzBm3Q9Rof+17+uZgkZCMNg3FQNXD+YVZ2wQiCnxNnxwHrI/JSxq7VfG3lcDjQzxjOyrO9NrXFfcTJ8H7Vkb6dvNSNjXkkV1ujtZZH5H5lAqoBLdpWr0kELs7yfFq1vyF3pRnFn+wtTAfR9XuZ+xuLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725040767; c=relaxed/simple;
	bh=uqNNpVMf8T+RMH5/FE8Yq3sy1hJAlrYNUThmGNqb/Sk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a/EMAT5MQds2ZVDW/Ax/54gCwagzir0kkn5ldA31qSHqm1qS5Xa9R7gb2NrtxdGs/iprAjy3wfxrlKvaB50oh9KzpWPjarqik5w8elpWIDlzuRcd8MYi3+EIgBvkazNN7mwHcTbF6hSz6AdUrldBL4OlX7nMk0HnB4FrgQ54xjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-714262f1bb4so1748730b3a.3
        for <linux-omap@vger.kernel.org>; Fri, 30 Aug 2024 10:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725040765; x=1725645565;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uqNNpVMf8T+RMH5/FE8Yq3sy1hJAlrYNUThmGNqb/Sk=;
        b=OhU4LHal/Sa0P0jNVK96w8ZZyaVyCGEsy4tNsx+bbQkxaSeVvrxwm8gwwi0v00s+24
         vTIXuqAHD/wfOpTO5WxRRW4oux96gJUHfXtdmiKYfkLHYHIcdq3ApUsnl3arK85j/0y+
         NXWF4q3/ccd74yzGp0iTlI2qrlCxJ4XG4YNWkKilrPDbjiFgZAUg+9MqkL1bQkbMLfaO
         OU67HBdIFH8Z+QG79IVqNCqbAE/qC6p2mtyN726M6KZG2PVyW79KcjcgC9+JKeEyIuHW
         k5Sbg+FpgXNKlqLfHkT9PKB7hpaQLVo5ZvIuJREvvovU2whFCPLSzBM4O1Db+VknuIvp
         u8DQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1z8rNfgJhAMTy2NFN3qGWwB7NRxW05RWtljhX7CXr4qzVWObl3bEwTqSx9Ik4QrWzYsTJfWJ4WkRi@vger.kernel.org
X-Gm-Message-State: AOJu0YwkZpxBj+hpkLydjARkPdtV3crEvex3Wr5NpckiRDpHEowTwr5X
	X0OmFWbtbRJrFvcCXwE3e6oHedkDuZ+9UMV0IFL6+zwD9PFuVJ0hSwZ2GIZQ/f4=
X-Google-Smtp-Source: AGHT+IFFlZgugvq1wKksGfIalTYQouMqa+FlAvXZoVmgoJEv1R3TuN28RgGuwEgfM0n3Xfl45ubesg==
X-Received: by 2002:a05:6300:44:b0:1cc:e069:e937 with SMTP id adf61e73a8af0-1cece502344mr386419637.16.1725040765324;
        Fri, 30 Aug 2024 10:59:25 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d85b141fc9sm4189612a91.30.2024.08.30.10.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 10:59:24 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Nishanth Menon <nm@ti.com>, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, bb@ti.com, d-gole@ti.com, Nishanth
 Menon <nm@ti.com>
Subject: Re: [PATCH] cpufreq: ti-cpufreq: Introduce quirks to handle syscon
 fails appropriately
In-Reply-To: <20240828131915.3198081-1-nm@ti.com>
References: <20240828131915.3198081-1-nm@ti.com>
Date: Fri, 30 Aug 2024 10:59:24 -0700
Message-ID: <7hjzfxx56r.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Nishanth Menon <nm@ti.com> writes:

> Commit b4bc9f9e27ed ("cpufreq: ti-cpufreq: add support for omap34xx
> and omap36xx") introduced special handling for OMAP3 class devices
> where syscon node may not be present. However, this also creates a bug
> where the syscon node is present, however the offset used to read
> is beyond the syscon defined range.
>
> Fix this by providing a quirk option that is populated when such
> special handling is required. This allows proper failure for all other
> platforms when the syscon node and efuse offsets are mismatched.
>
> Fixes: b4bc9f9e27ed ("cpufreq: ti-cpufreq: add support for omap34xx and omap36xx")
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
>
> NOTE: this combined with https://lore.kernel.org/r/20240828121008.3066002-1-nm@ti.com
> has created a bunch of un-intended bugs on other TI SoCs such
> as seen in https://lore.kernel.org/all/20240826-opp-v3-1-0934f8309e13@ti.com/
> https://lore.kernel.org/all/20240827131342.6wrielete3yeoinl@bryanbrattlof.com/
> etc.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

