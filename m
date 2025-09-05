Return-Path: <linux-omap+bounces-4585-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D16DB46691
	for <lists+linux-omap@lfdr.de>; Sat,  6 Sep 2025 00:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58C78A44C2C
	for <lists+linux-omap@lfdr.de>; Fri,  5 Sep 2025 22:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B9728726F;
	Fri,  5 Sep 2025 22:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="coBs6dh7"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8694D280309
	for <linux-omap@vger.kernel.org>; Fri,  5 Sep 2025 22:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757110934; cv=none; b=ejDSwoYs9r+3WYGz0dyAB6HcEXnjx7bhNcZFqaVqekkHWhCUvXVZ5x/xc/Eu6mYplgExFsZ85D6l5ZzEvR/GpGbgutJu5VsG9+brVoaVkwPcKmEuWDcoarb1mNX45cR4+wKTsVWi81X2uBgwLOkmjNobmikxtjnlBeV9Tz+0UAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757110934; c=relaxed/simple;
	bh=CLtBTRODHOtRfKtljROOY9At9iB558qJn+zs0E4D0mc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BE0yaE0FlnHS/9UwFHntNCrezbAg/B5B1W+f6DBCfSeHujLD0K4rfJX+E3laoR+fH0TNdot3TSk++7Y/MB6f7j+zGz60vjX8gAcLZ0e41aw9pjshwTbQAUB73G9qjbkkBjDLClSgFHnA2Xhktt6MPaQTIX3pQy1eKee0HwXTTyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=coBs6dh7; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-77251d7cca6so2212684b3a.3
        for <linux-omap@vger.kernel.org>; Fri, 05 Sep 2025 15:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757110932; x=1757715732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYJbNr/FzY1+zoA5tKpao01rUyzDVS9XAIWE0H2pjng=;
        b=coBs6dh7266sH809ep8IUCA9DQjOonHOS4bH2hQ53K3IasIQSf1eucUEQr54iFk0o2
         06lChXDb1G6Sp/IS4x8TFwd5ub8Z2WJizyJ2+lh+vES/h7PHbikqIgsb0mV9hmT2kaJu
         kf64i3kJZHM0QI/ZRrRfqxKW7Ut9Mxud8W/qjXD5uuHBZcvaDjf/0YoeT8Jz+D6A7spK
         rTSkaDJNbevXuWZ3IC4mxJskbZfkhE/VVU1WDQv1sSssHMFkfPhTjeu86I5dGKxkJMU+
         Bu5DvpUj1Bkg3NtZuBV0ljNTv3bEGkqkD0ZNPMUK42UW0eZ5Fd7YV/zjyRMV1UmaWX1O
         JSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757110932; x=1757715732;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYJbNr/FzY1+zoA5tKpao01rUyzDVS9XAIWE0H2pjng=;
        b=VFYK3v+94kCZvj9p3riYdmfx30xLXXzT2Op6FMkR9jWA/ByOj7qnJ6hrNUhH99hdFv
         OHgAMAv4qD3Iph17lY07GJXvnbSXIrk7kk/PsAGSwxBC64Esxar7r+5/8NvJ+BBN343U
         uddqTL51EdLstGbCsb7Xmz5EYRi/grPdmzifVuBNuGJf/kNFNueW1iy8e+/rZ99CB9os
         M/Fev/lOJS42UOlzQ9VQb0FIGBAbf7IDaZMzf8LHn5qU5hUCIuSgy+WouYiEIuoVPAuV
         s7Lcrs64TAmkhn71yiL+U4NaXfqcuLw32vWhwN++V4/pWJusxV1IVaWwas4A9WbWTSc+
         urBw==
X-Gm-Message-State: AOJu0YwyVBtxLdFjmbl1nb5dhN3Avj7UyPwi3xaBabuC3UHRos2l9IdX
	ILCsln3tPDkh54wGtndhy6Lx0P7Pej5kVTuqycKAVPjzk17RF6dCXwYHTCnR1tIhBVE=
X-Gm-Gg: ASbGncshXykM5oSz63flt6XitmYxQs3zPdkOK4GqwuYpXkElcqpOQWHJ5txhMzuSBHW
	aavruwCGfl4S8r1f7dw49e7dHoQf1i1upY5g7064RvCUUoOc/gKEJ1ji22fmvFCCmKGRUCUWOd6
	Y7mKPMq6PAXFW+3D95Gl+QStt3ZC1kMJaV1O0zV5Z+OsqKwskcckjZjM0G2LanVd6aP04B/4G4+
	oK48RuXbY8bvdc3YPmbO/KLH2Ui9Ljzlh1P/CEjB8I1FJ3du36noOO5WrPTYFBaiRyJRu3J1F4a
	Tiancd8yaSPCAq3Gjh+F5Uc5lyUjwCmhJynVEsK6slNwCfZPbuziXQALnuiUaxkEMPwG7TiIw7J
	M6DElv7sX8Bi4oP+2JMe1RswcR+Pqks92DEt3qmZ7GQ==
X-Google-Smtp-Source: AGHT+IGaXEwoc7ILB2arBg0Y16+KGjCnlIvUXKnnyBv3PESilhG49cI++fLCWMv8Z7e3a6gXIMXVhw==
X-Received: by 2002:a05:6a00:17a8:b0:772:5165:3f68 with SMTP id d2e1a72fcca58-7742de615c8mr302181b3a.27.1757110931832;
        Fri, 05 Sep 2025 15:22:11 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77274171cf4sm11008985b3a.76.2025.09.05.15.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 15:22:11 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-omap@vger.kernel.org, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Matthias Michel <matthias.michel@siemens.com>, stable@vger.kernel.org
In-Reply-To: <20250717152708.487891-1-alexander.sverdlin@siemens.com>
References: <20250717152708.487891-1-alexander.sverdlin@siemens.com>
Subject: Re: [PATCH] ARM: AM33xx: Implement TI advisory 1.0.36 (EMU0/EMU1
 pins state on reset)
Message-Id: <175711093087.666031.2909646610138285182.b4-ty@baylibre.com>
Date: Fri, 05 Sep 2025 15:22:10 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477


On Thu, 17 Jul 2025 17:27:03 +0200, A. Sverdlin wrote:
> There is an issue possible where TI AM33xx SoCs do not boot properly after
> a reset if EMU0/EMU1 pins were used as GPIO and have been driving low level
> actively prior to reset [1].
> 
> "Advisory 1.0.36 EMU0 and EMU1: Terminals Must be Pulled High Before
> ICEPick Samples
> 
> [...]

Applied, thanks!

[1/1] ARM: AM33xx: Implement TI advisory 1.0.36 (EMU0/EMU1 pins state on reset)
      commit: 8a6506e1ba0d2b831729808d958aae77604f12f9

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


