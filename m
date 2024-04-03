Return-Path: <linux-omap+bounces-1109-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 567DD896A68
	for <lists+linux-omap@lfdr.de>; Wed,  3 Apr 2024 11:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 880181C26184
	for <lists+linux-omap@lfdr.de>; Wed,  3 Apr 2024 09:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C37737172B;
	Wed,  3 Apr 2024 09:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="OftVuP1l"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45D845008
	for <linux-omap@vger.kernel.org>; Wed,  3 Apr 2024 09:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712136174; cv=none; b=h3FzDMq/91uuhRptzfPGwDvs5q3BKaFv+Ic0FKlQJo+fAxlYC4YjYiNxIZyBUYOQFTeotW0jOVXQP1RIEBIVrZTcGQkujjVrrihcEu5WjckB+81S3xOj7VYLF8zhdFmX+n150rEzAVhjNBzKZ3oSbrg5RLd1Ec+pnBghpl7iRZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712136174; c=relaxed/simple;
	bh=8HTgpvS7aR8i8Ht7gH/5QekuK2QNK6oKHuzOKRu0yNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rP8Y+PozADQuW3rYg95ZJLxwuZzE5hVDV8Vp8HZ7yjWn9M/o8XZyodbvtFB/URLAFWeXBn3Awnl7xPG8qbdW4lqkrNdAPEXaT/kfIwazxrRho8sf2926os288rQCOhzrIgS0oVf6QFkuyktFybiAUpua8nuXiarohG2miZbVGYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=OftVuP1l; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 40AA460339;
	Wed,  3 Apr 2024 09:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1712136172;
	bh=8HTgpvS7aR8i8Ht7gH/5QekuK2QNK6oKHuzOKRu0yNs=;
	h=From:To:Cc:Subject:Date:From;
	b=OftVuP1lwHnTsflTNlSSM64Y++CnQsjbpGynqKAHjdh/joCszijb2XknrN3jm0GYd
	 TT970gWiZVIMC9eoEDfKAi0AAYBD7E7ri9BtRdR0TR33f3nrWO3zPE/UJmDEJGU1bM
	 g74MnWWLMAcu1q5RZVIxX90fRwpx5wRUa54vANDvAQWavghG/dD59i0GxDGeqZaAXp
	 68Oy0kOfImk8cmH+z328F5Pv7OaJlHyLS9QA2fQlWWjkzgTUcjXOmWArB/8JI/PvwO
	 qZtKb3oJqt4FEdv1sF87BHtdvcMjcLUnnewlZ8hwvxDKcW6Y9daDldC0xWf+VO2b5H
	 8gy4WlZwacdxg==
From: Tony Lindgren <tony@atomide.com>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Linus Walleij <linus.walleij@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [GIT PULL] GPIO regression fixes for n8x0
Date: Wed,  3 Apr 2024 12:22:29 +0300
Message-ID: <pull-1712135932-125424@atomide.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.9/n8x0-fixes-signed

for you to fetch changes up to 4421405e3634a3189b541cf1e34598e44260720d:

  ARM: OMAP2+: fix USB regression on Nokia N8x0 (2024-03-08 11:02:38 +0200)

Sorry this got delayed a bit as I had some SSD issue, please feel free
to merge whenever suitable.

----------------------------------------------------------------
GPIO regression fixes for n8x0

A series of fixes for n8x0 GPIO regressions caused by the changes to use
GPIO descriptors.

----------------------------------------------------------------
Aaro Koskinen (6):
      ARM: OMAP2+: fix bogus MMC GPIO labels on Nokia N8x0
      ARM: OMAP2+: fix N810 MMC gpiod table
      mmc: omap: fix broken slot switch lookup
      mmc: omap: fix deferred probe
      mmc: omap: restore original power up/down steps
      ARM: OMAP2+: fix USB regression on Nokia N8x0

 arch/arm/mach-omap2/board-n8x0.c | 23 +++++++++----------
 drivers/mmc/host/omap.c          | 48 ++++++++++++++++++++++++++--------------
 2 files changed, 41 insertions(+), 30 deletions(-)

