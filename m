Return-Path: <linux-omap+bounces-5399-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B4CD06043
	for <lists+linux-omap@lfdr.de>; Thu, 08 Jan 2026 21:17:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72EAD3033D6E
	for <lists+linux-omap@lfdr.de>; Thu,  8 Jan 2026 20:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1703D322B7B;
	Thu,  8 Jan 2026 20:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OuJyDc1N"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D76C272E6D
	for <linux-omap@vger.kernel.org>; Thu,  8 Jan 2026 20:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767903372; cv=none; b=h1J12VoKV8y21oK8oAoKNigDOEffGLSWXO9lrfXFP2e+hYuNFaMbELsVnjt1fBLW1IneaNQxkQX06yiff3Ej+4tiNbRZdNc0jOYtNXxhkYGvNen/QXw2ycn/c2hCDiepYZeH9m7C/zxkO2vK18oPJLBLThAEBNVqxDWePAKFm4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767903372; c=relaxed/simple;
	bh=a/+cPvIJX94uGRv1+YvfPX7h8IidmOsGYVouQwyP1U8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bKqtizZE2MsQkHp7yEI0IpvpoxcP6mtO3+hxEg5V0OUd+GjtHWKXvuQbKIFXWrsT+HH5LOQXO7XMfxMoN6/KdLkojL1fX8XlyMKCqNxSXBMJG+vjCo7mtRRMsFJ3P3Oea8Ha8HL1BzDrdzC4jS1y6B+IrA3A7N09O7WZTLW8Hp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OuJyDc1N; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso2589965b3a.2
        for <linux-omap@vger.kernel.org>; Thu, 08 Jan 2026 12:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767903359; x=1768508159; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=a/+cPvIJX94uGRv1+YvfPX7h8IidmOsGYVouQwyP1U8=;
        b=OuJyDc1N2F9gbm3/SdbtD5d0Jn73k06UKtJNYrEtRKjYTRvmwjABfexecr0eFMawMl
         E/+THkbDVaw4XCftwSQG5hNs8nb2/QrCamN0GAs9yTx/bNwDyBquML2dWIdbnw1wDGmE
         jlpQ6EivyFSU+K/eqw3Ui6n1ALolnZUDhO39T1oDs57jAaBwc2rjqfIDfXvSca7OzLD5
         atmXOhJskVVRqrQuPpm4HnFBOMrm1Fh6FSBkmPZjO2o2hOEEOSIg8oQROeikjmWP6pWM
         mINxZvnEnMYxsNgeknmi9mA6xwF0npTYt+snnpwDlGyM7DLUxwK/79Nr6ddpwGGfI0nT
         6F/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767903359; x=1768508159;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/+cPvIJX94uGRv1+YvfPX7h8IidmOsGYVouQwyP1U8=;
        b=G+SABVyQQE2hvyIJB/0gwrzF77BpSIvHa8lZv0g8wZ1+kw3l/t2jdn6dgmepKIw9fB
         aC7feDL23sC4nxYaoQKsowmaV8LSsg2APItO8n3cVUOKGknehJfkjK8IklIMKbCZ5cK2
         /6Yj0xxhGHKKipXvESUAIupxXKcSs5qIk8+m9Z3GBFsuDqw6tw4Ylce2rWxZWo1cGl6j
         CFCxdAptkm+aCBIR3YvAPhXhMGKsnE7cOawNYefDtJVFkfJ2uvYfXYzGYQR1muSGiWZr
         NYoC8E8B8J50xwQuBmlRc7MH/wBieVz+LNnAzMA1Z0I4cKmbKb+PUv/uQiAIJXqA4IC6
         xLtg==
X-Forwarded-Encrypted: i=1; AJvYcCWG7QozoqoEvwSDOKebnbLV0RuW0x+/yToFI/FE4s9AluvbXUBriVGA6DS1B+eLOjBm/mBvt0DGVP/S@vger.kernel.org
X-Gm-Message-State: AOJu0YzE8EjPEqo3Dz0N1rp2YaNCyoFBY8XcEVJPZDbeFeGdAKsZbzXt
	FFtFryqgpz8mZfF+pQyJms/UGWOPE8xi8oSx5lyhTTwdoytjas1hX9QT0+VfbhCsjoM=
X-Gm-Gg: AY/fxX52/C+MIciaXerafQSjVbRwgqgdl9fWeSS0eNtQIRAsUVeTNiRGcd8+8pJ/Zu0
	ovNvOMlgicYYF2LhGMNIaRpqlzW81tjHg8oAPHnHEkrdwKJddJ0dylN6yIXaMXqsRp46y90udlM
	mbbPQAxtOjxUcmKfrUx+XWzQSGUB+2EjwWw7wQ+l9cZLzToNCN3WpVQB3lmjcJLAxykf7N4HRHX
	j1l4Pwv+TbiXd9UciYABx83sbgLHJgVPbNXHNyI2FR/bGHf05C6oBLdACZCFD3BX5YpkcgHnzpl
	wb5y+sSddAmcxE7wzz5uE7pxHIR5NCZTnGZLC2BxLR0zCufbwqEmEP6nlwWbWdsTC7dh8nYnBCg
	qOWnpGgSRCtmNhGA1pGhBE1fhcOPhXBslWgrDfUsXuDfWXhbqMML8IopiUEArvw/1aFXyKl4zEK
	zJt2viVHHp
X-Google-Smtp-Source: AGHT+IGEyNFxCYg+mz/nYXiyeR6SQHeALYFtxCcsGh7BEUBtCA+13vI7tMziVphvGhB+YDfWmtgivw==
X-Received: by 2002:a05:6a00:2c85:b0:7e8:4398:b352 with SMTP id d2e1a72fcca58-81b7f7e28abmr5865999b3a.37.1767903358688;
        Thu, 08 Jan 2026 12:15:58 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c52f90c0sm8425980b3a.41.2026.01.08.12.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 12:15:57 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Andreas Kemnade <andreas@kemnade.info>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Roger
 Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH 0/2] cpufreq: omap: remove driver
In-Reply-To: <20260108-omap-cpufreq-removal-v1-0-8fe42f130f48@kemnade.info>
References: <20260108-omap-cpufreq-removal-v1-0-8fe42f130f48@kemnade.info>
Date: Thu, 08 Jan 2026 12:15:57 -0800
Message-ID: <7hcy3j6ete.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Kemnade <andreas@kemnade.info> writes:

> The driver is not useable since 10 years, and the affected
> platforms have alternative drivers, so remove it.
>
> To: Rafael J. Wysocki <rafael@kernel.org>
> To: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: Andreas Kemnade <andreas@kemnade.info>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Roger Quadros <rogerq@kernel.org>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: linux-omap@vger.kernel.org
>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Acked-by: Kevin Hilman <khilman@baylibre.com>

Viresh, this is/was technically maintained by me, but feel free to take
this via your tree, or let me know if you want me to queue it up.

Kevin

