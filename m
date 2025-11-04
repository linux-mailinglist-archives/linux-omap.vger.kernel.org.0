Return-Path: <linux-omap+bounces-4844-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F59C3356B
	for <lists+linux-omap@lfdr.de>; Wed, 05 Nov 2025 00:08:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5B8E04F29EB
	for <lists+linux-omap@lfdr.de>; Tue,  4 Nov 2025 23:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D9A2D23BD;
	Tue,  4 Nov 2025 23:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nPXEu8nd"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4112A2D47E6
	for <linux-omap@vger.kernel.org>; Tue,  4 Nov 2025 23:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762297620; cv=none; b=smWhzUBmQfKI0I5CF3WTNs5LMV6hGUz/MVqFxmfbFNfmGHcFKtPckOWum/mnK3DFOq7GAASI6I+wEmTxl/wMwz4i2VweNXCLy3EB9ar3QfpFT+hVj7mHPKNxkKQI5FWVXZiaZNKHb3GvSYFMEjMnxjNlRD6fl/pmrrOEDVBGU7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762297620; c=relaxed/simple;
	bh=RR3IPbYec2NOPFOIfkwk6RSLhVYO7F2PV0hm2oD/GxE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SBEr29G4QxaOGTkFgAizty94CbaJg2L08YQcp9Xq39HnJGPNT9a9jS6IUNwXzagyp8LwNmcHHMk5APzz+9163LzZ1ssJzX9YNHXSsJjd8cRz7D+b75F0MJnZ7vEqm7NKHnJyKOSijq7pE+5vvuMUkftxZLnDlnv9W+H7psJ0sBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nPXEu8nd; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29568d93e87so30799795ad.2
        for <linux-omap@vger.kernel.org>; Tue, 04 Nov 2025 15:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762297618; x=1762902418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n13/8FCJMUqNvbLnkNEFU7zB6WHrbLEegcRPJ27Wm7s=;
        b=nPXEu8nd/TGAzoYXzj1GRLQrphpOHueP72dOh8mZvMFxuik1h1Ix0FijzCdM5C5Q3j
         MoDCSQaPGGHb100NAcVYbWQjMIa9+YWi6TsBDqZwfZULML/FxasfP4A5nT+QuuSM8KRs
         7JnkgRdTHlQ+sP9VkvdlF+kmOqjaUu6BuBO9OABsVgfMCZP6uYmOfkECEXa+kYh8ghWt
         hK5Stl3nPqyc5gMZVgoPMzgTngSnAlN06yFGeDExDooFar+kGpZsbi4DB24Ov0U8Sb/4
         H+MvGm23oiLfPuicJGF1rNxw41XoNNQKkaUwhjWHVFXWfzm57SGzvyPwSq0+cNddp2S+
         VZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762297618; x=1762902418;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n13/8FCJMUqNvbLnkNEFU7zB6WHrbLEegcRPJ27Wm7s=;
        b=HcqOPC4PTluHr5761wCBM//mkWvnNP7tHsYzU3HqAdbVkyIhTlH68bQ19/7oyUKNW2
         i8mYaW2lXeZfXynOwTWW9b9vg8aqN09q7uuT2OI+VgDPvCQCMaLx+mNDXqDSntvd2mhP
         aFpWTW0pfBaxww6RNrBNwqZmoeY+pkSE8OZduwzncjIInLoSeD6baha0G0WmIs28BARu
         v9fTgd5lwuTvHSCnX/IaIE1NhSbiURH9OgW1158YaaA66aEiMMGAP4fx4w8D7jhh3ktF
         FrTEA/Ub5qtSObbIRV2YfP69uCNQU97+3pEl1DBKIlqMI9IPfTGADyt7URUUGAjk6zu/
         eyzA==
X-Gm-Message-State: AOJu0Yy64n+DneVschKfbF/qOOUkBALSzK9HiurrbGDuyho5pk7cLW87
	xT1aCFNfq322JmoHKyn+aXq+5fb+uzz7nfldZMUhX55GffIOD3wdT0p0SaVi4O0AVeM=
X-Gm-Gg: ASbGncvNyfTbrg0BiPNfUOMfpSHp76YZv/VeMthSRq0AvNxKaM2BPZ0UkrdiAS7TsrB
	SM4mAWON5wkRmSwNrua7GxiC/4JosFPTxx7qC9+mqPwQqua7yaFNo2N0FA+KaPVrbx/BfRXfHAn
	PpqwezKfM//xWhbLhA0i9CXKjrsJbSwvxZfGA9P+cUbwLCWjJZ+as8rVZHRLUHc/z3YtcfRhWew
	bG+1w5nCtd4e6BUA2cs3HU9euE1F/YKXcir9f+b1FA20BAagMuDZeHg3ptCnNNRhbwGjS3JCv43
	nzu4nHSEFmhA5xcpQufqnUi5bTNYx5OJRrhA8RJ5z5jeBcD6ABmv3P2mUIIMqt+y6+tXWumvFwB
	vUx8mJDVm256rG1cPmuPXuaX8YoWaU4Wng+KuMmpRsUUneGDsmATYlztf5e/iMseY6i2W+aGc2+
	WDskXRjuPd
X-Google-Smtp-Source: AGHT+IEM+rk86HbN5JMS/+ymFnH1v9sQbDzBl1J+ZxaCCcuJJxl/HfOqx30JVy/lEf/aP5T0291XcA==
X-Received: by 2002:a17:903:1ac8:b0:295:7454:34fd with SMTP id d9443c01a7336-2962ae4cc84mr16715675ad.39.1762297618499;
        Tue, 04 Nov 2025 15:06:58 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a5751fsm39372745ad.82.2025.11.04.15.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 15:06:57 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com
In-Reply-To: <20250826140853.2570528-1-alexander.stein@ew.tq-group.com>
References: <20250826140853.2570528-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 0/4] TQMa335x support
Message-Id: <176229761756.2840692.8952270327048836062.b4-ty@baylibre.com>
Date: Tue, 04 Nov 2025 15:06:57 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183


On Tue, 26 Aug 2025 16:08:46 +0200, Alexander Stein wrote:
> this series adds support for the TQMa335x[L] series, as socket [1] and LGA [2]
> variant. The device tree can be used for both variants, so there is a common
> compatible.
> 
> Best regards,
> Alexander
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: omap: add AM335x-based TQMa335x SOM and MBa335x board
      commit: 6cf18454d7caf5a56776f6011ab9c6bca823c7e7
[2/4] ARM: dts: omap: AM33xx: add cpu label
      commit: c579ced456db4b95c55491574788c03618cf88d1
[3/4] ARM: dts: omap: Add support for TQMa335x/MBa335x
      commit: 5267fcd180b170d39cd2017f62e332a26311534a
[4/4] MAINTAINERS: Add entry for TQ-Systems AM335 device trees
      commit: c8763978aa4f72ededff3adfafd5e35661862168

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


