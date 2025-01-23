Return-Path: <linux-omap+bounces-3192-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7143A1A318
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 12:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9E2D188C24F
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 11:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1341220E6F2;
	Thu, 23 Jan 2025 11:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m1XJP3g8"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAAC20E336
	for <linux-omap@vger.kernel.org>; Thu, 23 Jan 2025 11:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737632283; cv=none; b=tu5YokAH6OHFybsnqzfemMjqTiUqyGsP5Vv+ybsTVrZnIPQPdYTSfG/p1opAA3TgB5WBT9C4pFYC9eMMz23MsR5jukcpJkv+qlXMBoikAU9JV4023AoWsLs3RdnwGD2yxlCvkhhyVS2lqqGCpYykvtKflRgKJ66LHYGRZDQGbAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737632283; c=relaxed/simple;
	bh=1elHtZeKz6sg8Ec3OUJiSdayZG26nY1iLQravuemXyc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kFoDXUDd7ajqavycH0qeirzRrAoUC+VsndgOXNs9XkbZFlIJued20cDGtP+yPFQ9HaJkBuZhRh07oz4VdQp6zsbdtAr62Zqzotji5696izZqWAynWAGlNmXNblZmdN++4B3HJhcWlbBcRNVyfqw8a/qiF5INafKuODN1e/Yy2oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m1XJP3g8; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2efded08c79so1225099a91.0
        for <linux-omap@vger.kernel.org>; Thu, 23 Jan 2025 03:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737632281; x=1738237081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G5e0D4ceKro9Yb8N26UgxQagAkkEg3LLRP/2T93ftQc=;
        b=m1XJP3g8AzZ+JeuIq516eVik7b+vYL/DqXlz1JIXdBftZgozqxIxxIdWj4ASSnF3KB
         12OlgDhHktPFBSdLAL0l0hIBNIl126IlS8f4I3hg3nvZa5h5fOKB9yUxN+pNHtDZgqDB
         0d6kRXrxqDWoUY4YoWL95lElfifjOAdRCDB2W6XTB8DAy3PGVFQ2N/zY3LYnu7/GlVSw
         wJSbrxeCkPpJIyTPuvjx8W8mznwaexFyvMKg6Ueg9f4KSur9/RYXg8oas4g7YM55wYIb
         rB5ZgyOuohcQ4oevLgyTJS/VZ1/dQ7cMFOBOaNR0TrsuiteCCdTMv/QeXduRLpOWhgtd
         /W0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737632281; x=1738237081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5e0D4ceKro9Yb8N26UgxQagAkkEg3LLRP/2T93ftQc=;
        b=iDfsQyNvvTXPQ/M0npmgaiGjsKDf/fQLZsr1SWD57SiRovotFqVdpYhHeX6kyIQlWq
         PcrcYX59opV6HxxVvBie8mNxCnubgG3bCwUAyazu2MFnVFTo9t3AIa7uFt3MIApSnJM4
         2Y+2aNsLOG4d7rZ2ldtrWFus3POsveDuqiHAZPqg2Bu8QrFzftr35LnrP7472aIjyFK1
         UdmNgImfkOvA8D2JYPPxkgTfKGKuz0plAUcAL+eutsyOA0RycQmSfGgy8/+cYyZiIOAw
         jvFliLo3NKx1TcXv78XhbPdBF51xgFFNPSem1eA8YD+ngPQDQCzoC0w4iG+IjCoSLmx7
         VXVg==
X-Forwarded-Encrypted: i=1; AJvYcCWhBL0fuEWluMvjcQuZKok+PKe+W1A2PThoCy5lGKAwTGWINRB8oq0jHeuceuLfjsWtFQV5HboNZ79v@vger.kernel.org
X-Gm-Message-State: AOJu0YzH45EVQS2MPt7fM+/tFT0Mmla1a25ccInTcJ2E38j6NG1W/Vsd
	fMXp0CTQDnfW79Is7P7jmrQLY7OAxGxDXSoqxZ6JR2v5VSL8DeGKVhVCQpFP7V0=
X-Gm-Gg: ASbGncuA/IlftqtgcXuLhlkp3W8h4QdwjjcGFf3kwKnVFHBCtNrfqx3IF3P2kmV2p8t
	iFOy2/RCkQPow0jvfHKw4J5Mr7SXBPnbOVX4kQqdc+THWIFBnxWs2KxUOkJejX7EUcoRiQyX3hk
	MSUkscGRLh7+rHxDqw4ar3OqgaSdH/r6nYjRBlH41EFJKbsQ6sM0oAVfn5d0BE20yzgGl31cJ2T
	vxLYETgtFQQ45tHdjO9mX1I70SHr0v9ydo+nTXWKsl5eaFqIh0csaSCPiU7/RTyHPoH3UeoVy+m
	hTQu0/8=
X-Google-Smtp-Source: AGHT+IGtsIzzGfAcKL/PEpiuES32TcQcp9F7OLmJOeJMP9wYjML8Ng6LAzORWCaFKdsDKOmTsmrEHA==
X-Received: by 2002:a17:90b:5206:b0:2f4:f7f8:fc8b with SMTP id 98e67ed59e1d1-2f782d4ed77mr37302192a91.27.1737632280204;
        Thu, 23 Jan 2025 03:38:00 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7e6a5e2b2sm3705966a91.3.2025.01.23.03.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:37:59 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Hector Martin <marcan@marcan.st>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Hilman <khilman@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Markus Mayer <mmayer@broadcom.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	arm-scmi@vger.kernel.org,
	asahi@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-tegra@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH 00/33] cpufreq: manage common sysfs attributes from core
Date: Thu, 23 Jan 2025 17:05:36 +0530
Message-Id: <cover.1737631669.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

Most of the drivers add available and boost frequencies related attributes. This
patch series tries to avoid duplication and simplify driver's code by managing
these from core code.

A quick search revealed that only the drivers that set the
policy->freq_table field, enable these attributes. Which makes sense as
well, since the show_available_freqs() helper works only if the
freq_table is present.

In order to simplify drivers, create the relevant sysfs files forcefully
from cpufreq core.

Pushed here:

git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git cpufreq/core-attr

--
Viresh

Viresh Kumar (33):
  cpufreq: Always create freq-table related sysfs file
  cpufreq: dt: Stop setting cpufreq_driver->attr field
  cpufreq: acpi: Stop setting common freq attributes
  cpufreq: apple: Stop setting cpufreq_driver->attr field
  cpufreq: bmips: Stop setting cpufreq_driver->attr field
  cpufreq: brcmstb: Stop setting common freq attributes
  cpufreq: davinci: Stop setting cpufreq_driver->attr field
  cpufreq: e_powersaver: Stop setting cpufreq_driver->attr field
  cpufreq: elanfreq: Stop setting cpufreq_driver->attr field
  cpufreq: imx6q: Stop setting cpufreq_driver->attr field
  cpufreq: kirkwood: Stop setting cpufreq_driver->attr field
  cpufreq: longhaul: Stop setting cpufreq_driver->attr field
  cpufreq: loongson: Stop setting cpufreq_driver->attr field
  cpufreq: mediatek: Stop setting cpufreq_driver->attr field
  cpufreq: omap: Stop setting cpufreq_driver->attr field
  cpufreq: p4: Stop setting cpufreq_driver->attr field
  cpufreq: pasemi: Stop setting cpufreq_driver->attr field
  cpufreq: pmac: Stop setting cpufreq_driver->attr field
  cpufreq: powernow: Stop setting cpufreq_driver->attr field
  cpufreq: powernv: Stop setting common freq attributes
  cpufreq: qcom: Stop setting cpufreq_driver->attr field
  cpufreq: qoriq: Stop setting cpufreq_driver->attr field
  cpufreq: sc520_freq: Stop setting cpufreq_driver->attr field
  cpufreq: scmi: Stop setting cpufreq_driver->attr field
  cpufreq: scpi: Stop setting cpufreq_driver->attr field
  cpufreq: sh: Stop setting cpufreq_driver->attr field
  cpufreq: spear: Stop setting cpufreq_driver->attr field
  cpufreq: speedstep: Stop setting cpufreq_driver->attr field
  cpufreq: tegra: Stop setting cpufreq_driver->attr field
  cpufreq: vexpress: Stop setting cpufreq_driver->attr field
  cpufreq: virtual: Stop setting cpufreq_driver->attr field
  cpufreq: Remove cpufreq_generic_attrs
  cpufreq: Stop checking for duplicate available/boost freq attributes

 drivers/cpufreq/acpi-cpufreq.c         |  1 -
 drivers/cpufreq/apple-soc-cpufreq.c    |  8 --------
 drivers/cpufreq/bmips-cpufreq.c        |  1 -
 drivers/cpufreq/brcmstb-avs-cpufreq.c  |  1 -
 drivers/cpufreq/cpufreq-dt.c           |  8 --------
 drivers/cpufreq/cpufreq.c              | 15 +++++++++++++++
 drivers/cpufreq/davinci-cpufreq.c      |  1 -
 drivers/cpufreq/e_powersaver.c         |  1 -
 drivers/cpufreq/elanfreq.c             |  1 -
 drivers/cpufreq/freq_table.c           |  8 --------
 drivers/cpufreq/imx6q-cpufreq.c        |  1 -
 drivers/cpufreq/kirkwood-cpufreq.c     |  1 -
 drivers/cpufreq/longhaul.c             |  1 -
 drivers/cpufreq/loongson2_cpufreq.c    |  1 -
 drivers/cpufreq/loongson3_cpufreq.c    |  1 -
 drivers/cpufreq/mediatek-cpufreq-hw.c  |  1 -
 drivers/cpufreq/mediatek-cpufreq.c     |  1 -
 drivers/cpufreq/omap-cpufreq.c         |  1 -
 drivers/cpufreq/p4-clockmod.c          |  1 -
 drivers/cpufreq/pasemi-cpufreq.c       |  1 -
 drivers/cpufreq/pmac32-cpufreq.c       |  1 -
 drivers/cpufreq/pmac64-cpufreq.c       |  1 -
 drivers/cpufreq/powernow-k6.c          |  1 -
 drivers/cpufreq/powernow-k7.c          |  1 -
 drivers/cpufreq/powernow-k8.c          |  1 -
 drivers/cpufreq/powernv-cpufreq.c      |  2 --
 drivers/cpufreq/qcom-cpufreq-hw.c      |  7 -------
 drivers/cpufreq/qoriq-cpufreq.c        |  1 -
 drivers/cpufreq/sc520_freq.c           |  1 -
 drivers/cpufreq/scmi-cpufreq.c         |  8 --------
 drivers/cpufreq/scpi-cpufreq.c         |  1 -
 drivers/cpufreq/sh-cpufreq.c           |  1 -
 drivers/cpufreq/spear-cpufreq.c        |  1 -
 drivers/cpufreq/speedstep-centrino.c   |  1 -
 drivers/cpufreq/speedstep-ich.c        |  1 -
 drivers/cpufreq/speedstep-smi.c        |  1 -
 drivers/cpufreq/tegra186-cpufreq.c     |  1 -
 drivers/cpufreq/tegra194-cpufreq.c     |  1 -
 drivers/cpufreq/vexpress-spc-cpufreq.c |  1 -
 drivers/cpufreq/virtual-cpufreq.c      |  1 -
 include/linux/cpufreq.h                |  1 -
 41 files changed, 15 insertions(+), 75 deletions(-)

-- 
2.31.1.272.g89b43f80a514


