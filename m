Return-Path: <linux-omap+bounces-3746-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A6CAC817B
	for <lists+linux-omap@lfdr.de>; Thu, 29 May 2025 19:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02B159E1EE5
	for <lists+linux-omap@lfdr.de>; Thu, 29 May 2025 17:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0400C22E403;
	Thu, 29 May 2025 17:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VFdgZAYy"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD11222ACCE
	for <linux-omap@vger.kernel.org>; Thu, 29 May 2025 17:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748538546; cv=none; b=acNqj93ZvMzmvYtM+nHGaH5gbQsyqlU50NdT45Uv+Lm5y8PxgFCSXNLjhEZRTM+hCOJen52pMLBPbFNGp+xu6Kyf90WUB5kNtsND75q8wBcPackQpIBu9A5t9iDAkTpEe1J0SmN8sW+F41lgnjeVpbQxtZa3tE/lPIDN9MrtGcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748538546; c=relaxed/simple;
	bh=bTCJh7Vs9YYA62uTf9Qa5e5R88sXF7eDOyoY3jHAfms=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SGMvuU93Qvza2IlnzCQ9LRgEv7Qxy4uDb5zflGAOS0tvu4s/NAEWRebs/ll4KcO0MKj3dsmX4Wh6/tfDx0mH4ruQ/oj/4hK9ICEHfxNp2LiZ+g2oHO6xh8xdMKE+uLtcJIhyLzm5G0ut5pBnWbh9mEMSTQFQ/t87gN1XNEtNRBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VFdgZAYy; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-74267c68c11so982889b3a.0
        for <linux-omap@vger.kernel.org>; Thu, 29 May 2025 10:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748538544; x=1749143344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=475QwjMvob141k8a/Wu8TwXkWBwztNaPrC5le4HhOJA=;
        b=VFdgZAYylFU8y6AQEOWhvTM2lqdrEJ1dSxQmIjOsYRUiNwT/l4hFRHjSgLOD/M2EQD
         qihBYlkgFfDhUopSR8LegVYx/BLLWuazLA4pm5JrTzEDNzOd74qG/RNDG90nuNTX0GxR
         tSMo3Ou4X01BtRE7dkKXOS93M2kNDsGGE+o7qhtz733emPXkgp6B3EppLTjmSoyYoOCo
         DxEO/zmoNWqnFUghtqoB74XYgnOhPmVEPcrNYDPr5rPlmCqAGYHDKyQ0iW+Yv31Nc+cj
         BJmzwEHpRW2np4UT6UenDeyXoe+oTvumoVJZ6zKtKzMZjJNgfEUIR5kCW1Nz/JW4ls8u
         Us2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748538544; x=1749143344;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=475QwjMvob141k8a/Wu8TwXkWBwztNaPrC5le4HhOJA=;
        b=fhTSfpycuGatN296JtTGk0+xo1Yu153IWnK9ECwNdrFEG1e3wK0edHrhcVf08oKkhw
         npVyFsEOHMD0vVcmU6phm86zdGhf5NiE6dgdS5ZfokIZUib4VRYZMulOHCbpF2EmHmdq
         2q23lbrtIEbsvBkNQRcYVl3T2Mo/S1d5UpL9SGaCS3RIZFF3ZVSNDxzLQeXf84MtNnpQ
         LPrDLNS9xs8goymQUAksx8rDg6eWoViMe+7CZi10ccjNRYzp0TYsQ2ghRNLwbimYzzCc
         WtOY8B0lIKg3vUcOoh8pbe23eDTDIrywtif5XjxCtvvF4Kmbv2MDbArzzMu3OqXd/iZk
         l2YA==
X-Forwarded-Encrypted: i=1; AJvYcCW3EoB0QQ8wHCZ7dbrcRVG68c088dYG+paPtw3vuIeCUsP80U1+VMKHDGkoH/tKyIvziky1g0XrG3zS@vger.kernel.org
X-Gm-Message-State: AOJu0YwJQ05HqVaKuAWD8OL1vGENbG3VEX1oINNA8R+dkpp7RCFS0ATZ
	NebejcV/lNn/sZBVecyBU4IY+On9OADI1GXjVko0LRP2DNmsUrs01o4Ykdoxh4IEvWPOQg1Gy/Q
	DLO5vpDJO8Q==
X-Gm-Gg: ASbGnctwYstdAZF3II74xABSG897Bl4DSTmDGadwi8nINoenSwqWBgm7VsYilF9xd/B
	S3aVsg2t9Pw+FZPJMNuiqA4bNP6+VEmQfvrvf9OLecGftsu4/R23q9oJIRWAPbeGLMGorH91Vj7
	UnzkiKOonT7WxnWcBdiBU4ZN8f63n7miMyi2LZzfGJv1u5NkkoPlwK8Wh46gmPeF/uSBzhl3WLZ
	ZjnNhiWxOuzWT1Cx3B/qpIyEqQtFoZt8mkntRau15swXd4qy9ffloAIhmr6GEPToRkAZG4f/UAH
	E7fwjXkeQapcl5CbRK6Ltz6XxFIAyDZ6Qj1tRLFR5+Ra0d56Vg==
X-Google-Smtp-Source: AGHT+IFsZkN4U8eseSF5210Vs36avHRe1Pd57NJYh8mHeC8iyOPf69SAlhCzh6rpbhZ6zB7HSxl2pA==
X-Received: by 2002:a05:6a00:4fc3:b0:740:6f86:a0e6 with SMTP id d2e1a72fcca58-747bd96da33mr304060b3a.6.1748538543680;
        Thu, 29 May 2025 10:09:03 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affb01d3sm1559252b3a.113.2025.05.29.10.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 10:09:03 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Mark Jackson <mpfj@newflow.co.uk>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250514125158.56285-2-krzysztof.kozlowski@linaro.org>
References: <20250514125158.56285-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: dts: omap: am335x: Use non-deprecated rts-gpios
Message-Id: <174853854269.3631742.2539937093987304095.b4-ty@baylibre.com>
Date: Thu, 29 May 2025 10:09:02 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477


On Wed, 14 May 2025 14:51:59 +0200, Krzysztof Kozlowski wrote:
> The 'rts-gpio' (without trailing 's') is deprecated in favor of
> 'rts-gpios'.  Kernel supports both variants, so switch the DTS to
> preferred one.
> 
> 

Applied, thanks!

[1/1] ARM: dts: omap: am335x: Use non-deprecated rts-gpios
      commit: 30b3788330e351f0f16d484f0e7b9b816506e444

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


