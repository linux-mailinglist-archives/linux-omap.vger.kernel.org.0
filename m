Return-Path: <linux-omap+bounces-3963-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2719CAE6EC6
	for <lists+linux-omap@lfdr.de>; Tue, 24 Jun 2025 20:43:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8988F176300
	for <lists+linux-omap@lfdr.de>; Tue, 24 Jun 2025 18:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3FD22E62A5;
	Tue, 24 Jun 2025 18:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cX+EZDo9"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014BE23E336;
	Tue, 24 Jun 2025 18:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750790598; cv=none; b=nHXwu5ZbN5Wn8nA7H1S5dft8tjSEkTI8Sm+jiYua3dIl8pumH7jG2x2nc3NQ/+64zMOXFQASaXFx4whw1Qh01zo6eP1z+JUnolOJNTWtU3s1TdYzDMsK5ke1d/L9KuUMjf5Po+rtCjZRr66OKUCnlV8B1nn98H0okxRH74Ad7H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750790598; c=relaxed/simple;
	bh=Y8uetc/l6Yo9r1gQ3WM1s9uM4dXQFdBZqDFLLWz1HZc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jcEBd/YWH0SWIXiLI5VgwCtIDS4S03MG5SUU2nTMECBkIJM1jXtEsT77r1IXztoME2nJAirzbR9pWTK6Xx6HjnzZ6ZGAaM1VkxhRbBz4WWcTFLi3PxIiVglo9ch1r7z69hFROwcmgEFA/ZipO98lxBVL6ka4asGB5Em3dX9NBEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cX+EZDo9; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55OIh5Yu1931905;
	Tue, 24 Jun 2025 13:43:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750790585;
	bh=6HDzsSj8clkMH6rJzicxNla6A2ITDCMSWqNF1pdoY+s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cX+EZDo9LGanEgCMfbHE+QMXMjx5anTWXre2gynTIl3gQfYkOTpLhQAWhRYz+1cu2
	 r8gAQD5WIIZD0h3gGE5ctMcOyK5eysHOLy79kyf7Ip5Re37yUaxRlrYa3e1gdtvLrH
	 Q1evsxDl0iIM693nVvmKDLsRvRMBhcREUzUt7BWk=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55OIh594262823
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 13:43:05 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 13:43:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 13:43:05 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55OIh1YP1990105;
	Tue, 24 Jun 2025 13:43:02 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Nishanth Menon <nm@ti.com>, Guillaume La Roque <glaroque@baylibre.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Andrew Davis <afd@ti.com>,
        <vishalm@ti.com>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: Kconfig.platforms: remove useless select for ARCH_K3
Date: Wed, 25 Jun 2025 00:12:49 +0530
Message-ID: <175079051631.1872397.9030558754679240250.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519-kconfig-v2-1-56c1a0137a0f@baylibre.com>
References: <20250519-kconfig-v2-1-56c1a0137a0f@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Guillaume La Roque,

On Mon, 19 May 2025 10:20:56 +0200, Guillaume La Roque wrote:
> After patch done on TI_MESSAGE_MANAGER[1] and TI_SCI_PROTOCOL[2] driver
> select on ARCH_K3 are not needed anymore.
> Select MAILBOX by default is not needed anymore[3],
> PM_GENERIC_DOMAIN if PM was enabled by default so not needed.
> 
> Remove it and give possibility to enable this driver in modules.
> 
> [...]

I have applied the following to branch ti-k3-config-next on [1].
Thank you!

[1/1] arm64: Kconfig.platforms: remove useless select for ARCH_K3
      commit: 631ce8f743a5c85bd7f0a5e7dcca70566d88f43f

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh


