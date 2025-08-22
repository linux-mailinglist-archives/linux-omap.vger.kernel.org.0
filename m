Return-Path: <linux-omap+bounces-4311-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4237B32319
	for <lists+linux-omap@lfdr.de>; Fri, 22 Aug 2025 21:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE985627E80
	for <lists+linux-omap@lfdr.de>; Fri, 22 Aug 2025 19:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C392D4B66;
	Fri, 22 Aug 2025 19:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cMb/1Qd4"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842EB26A1B9;
	Fri, 22 Aug 2025 19:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755891884; cv=none; b=Ats7reOkxWPUf1GPtV5rHjdVAc4XBuH1o2hH8AwqBfMMv9x2sAC10QMB5y9HJJmh+yCYheNUqyT6rzJs5TEX0bFoHmZwzaNPKDv0zLd3qMQPVNB4WCTDJRvXNcD04R7NqREXK6Unt209OVAJs353vWQgNfh/dZXihGLcAA2JOSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755891884; c=relaxed/simple;
	bh=HRCJucDAxwR1vzK1TCRotaBhVputfowz8e0wsEsHu7w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D2fE68WpJHK+u+Y8JfJ7deAta2IiMTsyKhr3WbzEmZ9q/KrIrxuKLtBUMgU6bhQHWtgpIxqqEpwGmDCdIVw7+WXgtLqDsaGH/ta7Iqsc1YPGYIXuAky7/LpgGQtCDPAF4mAG5JGmoaFwGMMHPJOT4xC8A/PCvhGfLGiZ2QHIY14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cMb/1Qd4; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57MJiTBu318936;
	Fri, 22 Aug 2025 14:44:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755891869;
	bh=6vynMBNt9zHEV0YaHp/1iQ9KsKnJ3qZTQ8Qg8vs2o7c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cMb/1Qd4ZSGg4Tg4jM3n9AE66JJ0MHb0/GXlTGNueP01q3Sx0yxi8bHjPO9C0Hc0l
	 GDDq9vhU0wSGl9iZBmkwz6mkQ3JYC2SR6SYD3uVRlo4PI8Lp21DykHtwZI8vCrXsnQ
	 ae3yZErzds6H6nlnV9A+PC7ImB5toudFqtvOSHvc=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57MJiTZn3834554
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 22 Aug 2025 14:44:29 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 22
 Aug 2025 14:44:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 22 Aug 2025 14:44:29 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57MJiTXv123210;
	Fri, 22 Aug 2025 14:44:29 -0500
From: Nishanth Menon <nm@ti.com>
To: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Nishanth Menon <nm@ti.com>
Subject: Re: (subset) [PATCH 1/4] ARM: dts: omap: dm814x: Split 'reg' per entry
Date: Fri, 22 Aug 2025 14:44:27 -0500
Message-ID: <175589184750.648983.14374917269820538529.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250819131651.86569-5-krzysztof.kozlowski@linaro.org>
References: <20250819131651.86569-5-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Krzysztof Kozlowski,

On Tue, 19 Aug 2025 15:16:52 +0200, Krzysztof Kozlowski wrote:
> Multiple entries in 'reg' should be encoded in separate <>.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[4/4] arm64: dts: ti: k3-am6548: Minor whitespace cleanup
      commit: 44189ccdfc2c96af4b06303c265030cda0e0bf51

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
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource


