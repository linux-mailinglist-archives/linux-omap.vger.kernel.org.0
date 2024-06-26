Return-Path: <linux-omap+bounces-1591-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 905D4917F97
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 13:27:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39D641F26928
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 11:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 978CA17E45B;
	Wed, 26 Jun 2024 11:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KEDEQ5oi"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25BB148FE3
	for <linux-omap@vger.kernel.org>; Wed, 26 Jun 2024 11:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719401221; cv=none; b=Gwq+Vp+BQaASatfD1SOV00kmJVyDvhOuXgGRBoV0i/kuaqeJv/mTH4mJzK6JE8caPaTm75yMQ0pCUFf8S3s4QbXcEyrSvgp7Ql5jot2EZiSboqS+xedcTl3oAjPfQLBJuObUht5kN8JFj9CbAJOaBjpgmcxV9FTEadeAFn+eytI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719401221; c=relaxed/simple;
	bh=MFKbqkFOpx6Os70/OaWlAEs0Uet5ZGV0bU24x8P2a4w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YfEg7waq52TqhUtEPTnnbTe1OMso8b3uIObj30k5/vyGCtY5LAgVpi/0f+Hv+qTNpT5Mp9092mbowC6Q5Xiwe6QjRp+rT0VFLj2ZE6pJmuUCjhNyZ3m9B5VE8VahEFTnlig3HGh/SyMcrtN0APDJKrobXZSLYXOR5QStgRy9gKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KEDEQ5oi; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a6fd513f18bso607602466b.3
        for <linux-omap@vger.kernel.org>; Wed, 26 Jun 2024 04:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719401218; x=1720006018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RPzARjyIcu6/3pcxRLmvEVtPX6q/rm/cKl2bf9OSfzw=;
        b=KEDEQ5oixMwBTjKuIaXhdGz5PZU+CMKOBf5JiiAmBuGYQS4+GVpeudBVBvVelHhxwx
         7xh4qIQ/pQzjd7VFTklCZJIbBfRAz8t6PAb1hxBqF+MI8b/zHMqOsY7nMqwSLL/tQ0jh
         2Y0mXnebFPq3Mit1C+vRBgNR2Kyeh7exCUzvIXCE0fo8BU+NlpG3P+BjZQo65aJXB+cV
         D1N+V4f1QEegSqRz94dw9osiP2eJbEcXsigUspZtknf44/3ZHEJG/YBcaMC1Q3BtdkiD
         gxiQ7HvN64WRJQNUFsakO4x+auSin20csX4q6SqyvH96/ZFDSjF61QqahXPt5CnhYSm+
         ReYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719401218; x=1720006018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RPzARjyIcu6/3pcxRLmvEVtPX6q/rm/cKl2bf9OSfzw=;
        b=pLv01C+vNB3iEXSMEbmNuwCaXWVWDAKpQ5UbOm7at815UMBbWR7xK1sk4MjPIbTtEm
         0DXZnzvLEYvzFym96wOlhzNgj+nTqLBNHko3sZaavA3t+BD1x0v71lAe5LJvs1E2Xhxe
         AsLPj1834mJAwi3fa/P9uU/7rk/kVs6ncPpt3E8D8Ja57r2eamWLg2Wx1c84Ik5IIiHe
         AFJ7uOMJiG3DKBJUfBrS+nk7vIjthV3b4AMWF2fy99cklL3UB50AN8HAWDzqVoDrKsmW
         biUbGiR9jr+VgxwCApPXbWnT0vVm/GbxrbIwziJhlyFA3GxHGkwhG34P/w6akwtnQn8O
         WCYA==
X-Forwarded-Encrypted: i=1; AJvYcCWeX+Zshl09FPwwHNEWc8aKCYdiAbUXJ5KpHPDeuOlGZn9stpXhGzV2u9BGn5WT6fBUS4V1U4Zzo4ZmdWlLOV2YAo5VUsJHdxyt/Q==
X-Gm-Message-State: AOJu0Yy1kWTQT3urRRHO9mDO1koV+/obTwyr9c6jCxjziETdEz1xCE7T
	isUvPVzjDdr/IAxMvRP4nHcBXENm/SjBxmG93czLCNup2VCO0YAqez24K6hQOEw=
X-Google-Smtp-Source: AGHT+IGmX4T5i4aBGXjrLUHWiDG8K2J37IAuWEsZK9yw8ZP4mEBgzndTO13r0qB2PXPWqZ2u0uRdlA==
X-Received: by 2002:a17:907:d40a:b0:a72:5557:294 with SMTP id a640c23a62f3a-a727f6809c7mr311746766b.6.1719401217829;
        Wed, 26 Jun 2024 04:26:57 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d303d80f7sm7136213a12.8.2024.06.26.04.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 04:26:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: dts: ti: align panel timings node name with dtschema
Date: Wed, 26 Jun 2024 13:26:54 +0200
Message-ID: <171940115812.32431.4234002524799635130.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240509104813.216655-1-krzysztof.kozlowski@linaro.org>
References: <20240509104813.216655-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 09 May 2024 12:48:13 +0200, Krzysztof Kozlowski wrote:
> DT schema expects panel timings node to follow certain pattern,
> dtbs_check warnings:
> 
>   am335x-pdu001.dtb: display-timings: '240x320p16' does not match any of the regexes: '^timing', 'pinctrl-[0-9]+'
> 
> Linux drivers do not care about node name, so this should not have
> effect on Linux.
> 
> [...]

1.5 months on the lists, but maybe I combined too many separate TI maintainers,
so no one feels responsible... then I guess I will take it.

Applied, thanks!

[1/1] ARM: dts: ti: align panel timings node name with dtschema
      https://git.kernel.org/krzk/linux-dt/c/93ba8817f2ea13593d1c43e02a819cb7d9be048b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

