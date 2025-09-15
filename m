Return-Path: <linux-omap+bounces-4639-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3259B58828
	for <lists+linux-omap@lfdr.de>; Tue, 16 Sep 2025 01:21:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0B491AA7D56
	for <lists+linux-omap@lfdr.de>; Mon, 15 Sep 2025 23:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369322D8382;
	Mon, 15 Sep 2025 23:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="D7h5B75/"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF1428CF5D
	for <linux-omap@vger.kernel.org>; Mon, 15 Sep 2025 23:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757978479; cv=none; b=LZ3d1tR52kV06P5BObUVOT1OxNNKi8QrKE9z3wykVKTrT6TMD72N8IWDQvwAg0fgul++EFuYk/DSGjJgOLqKid/yBpa46c4dVYNpb6ltPjfIX7lWlUmz4F3nD9jG/qx13R7jG/kKwwFkIpGOMlDptTGx8hHuki606kAonNbG2hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757978479; c=relaxed/simple;
	bh=QjptKauox/zh/yVRJgItfD+1SMNcMuOHhIn0e1+Z9Mc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BLnx/JR7llDMDuOu7za+81ft7kFLvCBIVe04JnPBRZj2r4DntdcHYPrPIWgdIhqGTrSKSORmwgJvxxi8xuzsK2/D/LRsp1ysJ8H8K1Z/3KcmPULY2EZil+6TanIW8f2ADMvyr+PBeTHIQ4jSHiTy1bfeIIsS/5HSnrqZlhMWRCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=D7h5B75/; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b522fd4d855so3709810a12.1
        for <linux-omap@vger.kernel.org>; Mon, 15 Sep 2025 16:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757978477; x=1758583277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgsUeyln5jHJQtg6nGIuuJa3omU5ijeYPDC8tIR2gz0=;
        b=D7h5B75/JCdJbzyIf9m3bofYjEMIvzT38rcyTG2tKOWMIB829e5ldJZMKo8cizLcul
         okswZh/T+GMZ1IeMF0Gs+S2yQ6M/zMI5AXe5tlLAE6D+Jfm3Qz+mZkL7PwOvNUD0zbwg
         1xKmiTdN4EZIY0cooT+st3eRNp568XFIVFtAjvWapjh1yGFlHSkEcJBm5jNPuD46DK7C
         JaOm9QJH7vLQB1bsRFa8Lqx/ZV54LxTKERel0yTI+L2wHU+2+wk8U6b9ty+Sytx0lxZt
         l2RPuOyPsn4EOQAZ0usjyGrmfOarWsLUX0KeSE8Rfx4XbRUx6umdgkT9k8RHnjX2z31Q
         A9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757978477; x=1758583277;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgsUeyln5jHJQtg6nGIuuJa3omU5ijeYPDC8tIR2gz0=;
        b=v+5o7X1z0+9RCh5xm8pqtILg+fOlAzvuOIK5W27YEVDAJu5IXPFmAHlaG0fP8IGmpd
         9eRFDp+xKePqDcAlsXdFmj6KvISigljU790d/L/5nDYp9s0cm2ejEVo6g/wJ2XHePHli
         ajyFGMFtS//uoIiaAXZ+Nd4/6FYQx7P6reWh5VmO695Iht/IygirjvL5YprK+RSqHtJO
         XwtX2aYstQGyeFblNCNluMEP/6fcrv5lLiIcTXuWuQYKW3MXpOOOaWrTvbiYA2IMcik+
         07eAk82aB8ENdoMtQSDr9HiOYzFB0iZK/AZdaigAsHs34VpnehdowQffz3pXBEUD9Mrm
         WfQA==
X-Forwarded-Encrypted: i=1; AJvYcCUsH142kVnyW0mDY42f71+M0C7tnxL6mW2ad4VOGG/i6Zr54Y/APOxUpoHJF3hn6ncmY3B0PYDY/wTV@vger.kernel.org
X-Gm-Message-State: AOJu0YzH0jKLaOiEkYKyrGwTSrH++jdAERYrIAWUrwJ+ZPtCiXvcsqk9
	xgy9sEIEiDIJU6+luJd8R4cbHvBB6IwI1rSKS1uMgb/OMKgf7ijvsOEKVI/WPCpdAOE=
X-Gm-Gg: ASbGncs/522c86lYSDXbMXVMDubRn71qo+9sUzbsCeIQUp1F9+v7kn4KEaIaJh/s+bY
	0rOG+eRlsuMmaXq8cKIWDj7mYFSdKSW9YXJM4xlCvsfWai0MQrne5BvM0D1bWqvknUdq+iEq4mc
	7TiXCjLdrFLnWJtg/9rGBojpPS1jqzJhsV9NNTn+0X/VIp308WaPI5Mb4VElkEHxmVGS7nbKtHV
	gSJAXHA0pNwrb7yvgVbXo+gPdNq4a4M5AQGcKl518FNh2uSaRrakbNGyXR9uTuOtUhHsLBOTvGY
	ZlW69foaZM/1K6SN47RLBivns+bMoKi3qNtynyJbRNpe2j50/4ggbMq8tuMifSqMTzVwPoRSjYF
	8ukhM2zrCEBF2rVxZuepyFX6QCUVniXM=
X-Google-Smtp-Source: AGHT+IEMv8jBnfBFpzOj2tDIE4OBC2iZqPmVd1ibS2mAaD25rPyFSdy7EKxeRUd8V1wYJ+kr0edLjQ==
X-Received: by 2002:a17:903:3888:b0:24c:cc32:788b with SMTP id d9443c01a7336-25d243e7b4cmr166970205ad.3.1757978476693;
        Mon, 15 Sep 2025 16:21:16 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607b17c78sm14543629b3a.50.2025.09.15.16.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 16:21:16 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
References: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
Subject: Re: (subset) [PATCH 0/3] ARM: convert from clk round_rate() to
 determine_rate()
Message-Id: <175797847576.2104956.7606973558357095186.b4-ty@baylibre.com>
Date: Mon, 15 Sep 2025 16:21:15 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477


On Thu, 10 Jul 2025 19:42:15 -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the arm32 subsystem using the Coccinelle semantic patch
> posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.
> 
> Coccinelle semantic patch:
> 
> [...]

Applied, thanks!

[1/3] ARM: OMAP1: clock: convert from round_rate() to determine_rate()
      commit: e2c0510935c5485a2dacfd13af3958536b9d138b
[2/3] ARM: OMAP2+: clock: convert from round_rate() to determine_rate()
      commit: bb676996ed583464504123721195e98a708fbba9

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


