Return-Path: <linux-omap+bounces-2940-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A60FF9FFDEC
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2025 19:20:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDB587A18FA
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2025 18:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6816D1B4236;
	Thu,  2 Jan 2025 18:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="DNOM6WDa"
X-Original-To: linux-omap@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDB8183CD1;
	Thu,  2 Jan 2025 18:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735842012; cv=pass; b=QirUh9oabIuDzHZa1D9lcbnkgACbsdLvoe148fdfG8QQh341NYZgshlE1MjtEkSJHWkbXDAn8X19Bz7+TNXkWlcbQ+nsvXWgdCt7XUeshv/meK0mterqRy8oxbw7l8/4tJGJkTDLG+qFRklRb+ySQrKi8AZ5sncbq/vF3Kg9N4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735842012; c=relaxed/simple;
	bh=8FeQra9PsVnQRAPLj3xPytubGD6J8WzWhWdUfrITMu0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fj7pME56NUJkKakeoV8GviocR24/215MyWBa4zDEvjpivPy+3l6MGD8PAXg7Tb/3wGmG56tLdpIbrtkFME5ivv/9xCBUWb5qNcdpz59+CyD7frOsoXj5+9XJlvsuB2GF4thYtzVJxY1+X9GAHa+xWrzdqKeIveGvYKLp3Zencf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=DNOM6WDa; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from darkstar.. (85-76-116-195-nat.elisa-mobile.fi [85.76.116.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4YPFNw5Vz6zyQw;
	Thu,  2 Jan 2025 20:20:00 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1735842001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=exZa0cSK0p8myy1tfLFAxCcr9av1i6WVSCZIQYJwPuw=;
	b=DNOM6WDaERQjAUBF6vv5/3bIuRLYA1K7pCg6yAzfOhLDye2fbKsKWiwUJ/rM02hEruF4Sz
	U84LbSTu30X1UFCZl+A9l3VCxO6zL2YjeqNOpGNewmhYiDM7kKRcRiXXNkURY/1/wNffjQ
	1aQEaoWru+qoss7kLsj/U7HuuPLkZs4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1735842001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=exZa0cSK0p8myy1tfLFAxCcr9av1i6WVSCZIQYJwPuw=;
	b=h4kw9+4VcapxeVZtowg2UTW/F4HwsfbLqkFEM+UlAlLp4RKKpKYny1PSrnSCx5hTO6eZ9v
	W/paYKKdW09NxPGTbWFscQAzna5SxZAJGTe6M4dOCdxpAHEnGswFqfSw+3Y9W0stJ5mpNt
	8JduaVAFtfcNDKtLhaqWPIPpgAFtaQw=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1735842001; a=rsa-sha256; cv=none;
	b=N0r8l0vhoDwD5ZUxFaUMdlc7gBzfrulqeVpcCsgC5kokSJu3q44/dR+5KcgqPw9ERa3j5B
	d1ZP29jJc85Ubuh/SEcMSFRsEXuDBcZ/6RPSrhvYXGhtCEVnkdvHnO7pS3pCdVjiQEsW0K
	Kk+D7Afdk9QA5LHKA5hKObgk2cBdIAY=
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-fbdev@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: [PATCH 0/3] Input/omap1: fix touchscreen functionality on Nokia 770
Date: Thu,  2 Jan 2025 20:19:50 +0200
Message-ID: <20250102181953.1020878-1-aaro.koskinen@iki.fi>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series restores the ads7846 touchscreen functionality on Nokia 770
(and maybe on some other older boards using half-duplex SPI). While the
performance might not be optimal, it's again possible to control the device
using the screen, for testing/development purposes at least.

A.

Aaro Koskinen (3):
  fbdev: omap: use threaded IRQ for LCD DMA
  Input: ads7846 - fix up the pendown GPIO setup on Nokia 770
  Input: ads7846 - restore half-duplex support

 arch/arm/mach-omap1/board-nokia770.c |   2 +-
 drivers/input/touchscreen/ads7846.c  | 171 ++++++++++++++++++++++++++-
 drivers/video/fbdev/omap/lcd_dma.c   |   4 +-
 3 files changed, 171 insertions(+), 6 deletions(-)

-- 
2.39.2


