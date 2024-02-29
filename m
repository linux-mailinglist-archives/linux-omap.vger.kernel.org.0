Return-Path: <linux-omap+bounces-764-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B40D86C33E
	for <lists+linux-omap@lfdr.de>; Thu, 29 Feb 2024 09:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D31D1C212F6
	for <lists+linux-omap@lfdr.de>; Thu, 29 Feb 2024 08:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0B5482E4;
	Thu, 29 Feb 2024 08:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="Zs+vnYIZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA1A45941
	for <linux-omap@vger.kernel.org>; Thu, 29 Feb 2024 08:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709194501; cv=none; b=MCWGZlFZbzEG3B1/tFQNEBt8lFAeespk+aovwRD5yIbtqJFcWAl6gPZd4ncakgMpminMcXwazb/ud+Kwh7PBZ2B1zdt73dG1jutxbY/Up61fRR54GBkLTGtLvKkbJy/2Mhk8md2LUtP6ds/85CBB+/gFZGMEuEM9lTWohRq6PU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709194501; c=relaxed/simple;
	bh=gu1HnfHt+xN6xFKRH6l06ExVCQXu9YfxKm1JsRRvMY4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p9PEwJ9lF9Z6jNge4NvdqhopgFZLxK0u7h1EihWOouE/aUfySBthV+4Yi9zabVr2+eRdp/qT+4NaUPV0AEGgPWXV5NLMBoNZnO85LxvqJvHOVZm+X/eGGI46z7VzKtu/TqXLCvIZtrMr/wkqK40voHi2x2o9N/We5znvxkt9xkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=Zs+vnYIZ; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 8C9B2603C4;
	Thu, 29 Feb 2024 08:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1709194499;
	bh=gu1HnfHt+xN6xFKRH6l06ExVCQXu9YfxKm1JsRRvMY4=;
	h=From:To:Cc:Subject:Date:From;
	b=Zs+vnYIZlLI990w7MXxILCIgaHfgVOmUgB64+6HJ6e79UkfzH3OezgXl2kb2WvvY1
	 gmiXH9MnvOY0rDN6rf8PdsnY2POFuc4nrabI120ZC2UiJ92WVoF8FW23vqJE77FToO
	 s8sMgre/tTP7v0x8ly9oYmlgpQoxgH7tS+DRWxXHwe0vf//AhNvP6f6M+4gy+OVY+Z
	 blH6LhHrrWsBsxl1D0OhPAwykBjrYehiyiVxWbPJJ6k4yLfrIBgYyljq0HMMlWa8xF
	 bQ91Hm+F6fRbPjEsHUjQG/Rgf/NU3R0hiE9EsmBDOUBZ55QUJYiJeaU39lAW/u1yrh
	 fsQa2P5QDFtTQ==
From: Tony Lindgren <tony@atomide.com>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Driver change for ti-sysc
Date: Thu, 29 Feb 2024 10:14:44 +0200
Message-ID: <pull-1709194472-263643@atomide.com>
X-Mailer: git-send-email 2.43.1
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.9/ti-sysc-signed

for you to fetch changes up to 097948afa1c2220609683106c884a3c710e62c80:

  bus: ti-sysc: constify the struct device_type usage (2024-02-28 09:30:25 +0200)

----------------------------------------------------------------
Driver change for ti-sysc

Just one change to constify struct device_type.

----------------------------------------------------------------
Ricardo B. Marliere (1):
      bus: ti-sysc: constify the struct device_type usage

 drivers/bus/ti-sysc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

