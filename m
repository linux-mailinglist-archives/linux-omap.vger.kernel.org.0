Return-Path: <linux-omap+bounces-726-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBA38671F6
	for <lists+linux-omap@lfdr.de>; Mon, 26 Feb 2024 11:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCE8A2899A4
	for <lists+linux-omap@lfdr.de>; Mon, 26 Feb 2024 10:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A012D5675D;
	Mon, 26 Feb 2024 10:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="QyhzL5YS"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C0E56746
	for <linux-omap@vger.kernel.org>; Mon, 26 Feb 2024 10:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708944343; cv=none; b=AJbJZ7owr7jBfd0RSUxXN3JPE0nG3LtDz4Yy14QhXptFLFE20RxYEAC3FGpaMNhAITgagFYdy1U12RRHgofbMcp9CREilKiJ3bWc/2C/WIP3kV/zYGJzkWiZ/gHsQwWwbq5g2l+tLgYO4/tlGX6MB7CwCo1q6N5NysmFOoGcYqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708944343; c=relaxed/simple;
	bh=oYT/HiK94SkFdce/HNd/VrIiwY34Ea01L0AEBbrybCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jcZCdCg3YFC0ibstaAuxUgUVpH7eyJX7NVVuw1EXkxhPR9YSLYy/oH2XiOvV/jqZg19DXyW1fMd1nwSh6Ij8/HzGjtRM7X5FR31v7GJ48RfuAxlTGxZ1xOdaQyB8c27RJemaTlrYjxV6+n3eJ/hxJUnKMzTSEjM31y/TYQbr71I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=QyhzL5YS; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 26C4260462;
	Mon, 26 Feb 2024 10:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1708943818;
	bh=oYT/HiK94SkFdce/HNd/VrIiwY34Ea01L0AEBbrybCE=;
	h=From:To:Cc:Subject:Date:From;
	b=QyhzL5YSf0CH02td46MD2M7l5wTIr+W1Rkl0vvKX6NWyvhBBRCzbT+R8+jrwl/dbu
	 /k5XVnxdPLWphk5w9JCNisk5UrlF14m8qlsRIncdRY9GA8riO27JhQJVYXlzIHATob
	 okha8QqxVHDHCkNINZPcm1S8S5F6vZQUw9rnS/giTCImU35v+TgTZrX07ub7CadiMm
	 sthr0mYOwieOgqBe41yJ7mdwHoLGznermZhjhmL5X7ooZD35KTPZzP9Bdwns5C8SvE
	 D0U5z8AByBq1Yma/ZMSAefCFrS5wt72m/J0b9InQB6XxfiYKDgr3qHRTmVW3dNT2pT
	 i8Up2FzH+SQZg==
From: Tony Lindgren <tony@atomide.com>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
	"Rob Herring" <robh@kernel.org>,
	"Nishanth Menon" <nm@ti.com>,
	"Vignesh Raghavendra" <vigneshr@ti.com>,
	"Andrew Davis" <afd@ti.com>
Subject: [GIT PULL] Add PowerVR Series5 SGX GPUs for the TI SoCs
Date: Mon, 26 Feb 2024 12:36:12 +0200
Message-ID: <pull-1708943489-872615@atomide.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/sgx-for-v6.9-signed

for you to fetch changes up to 21cfb2ba471bde8fefc327f4c8e2af9499f5173d:

  arm64: dts: ti: k3-am654-main: Add device tree entry for SGX GPU (2024-01-26 09:43:23 +0200)

----------------------------------------------------------------
Add PowerVR Series5 SGX GPUs for the TI SoCs

With the Imagination Rogue GPU binding added, let's also add the devicetree
binding for earlier SGX GPUs. Let's also patch the TI SoCs for the related
SGX GPU nodes.

Based on the mailing list discussions, the conclusion was that we need two
separate device tree bindings, one for Rogue and upcoming GPUS, and one for
the older SGX GPUs.

For merging the changes, I applied the binding changes together with the
TI SoC related changes into a branch leaving out the sun6i and mips changes
as suggested by Rob.

These changes are mostly 32-bit SoCs, but also contains one arm64 change.
It does not cause any merge conflicts.

----------------------------------------------------------------
Andrew Davis (9):
      dt-bindings: gpu: Rename img,powervr to img,powervr-rogue
      dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
      ARM: dts: omap3: Add device tree entry for SGX GPU
      ARM: dts: omap4: Add device tree entry for SGX GPU
      ARM: dts: omap5: Add device tree entry for SGX GPU
      ARM: dts: AM33xx: Add device tree entry for SGX GPU
      ARM: dts: AM437x: Add device tree entry for SGX GPU
      ARM: dts: DRA7xx: Add device tree entry for SGX GPU
      arm64: dts: ti: k3-am654-main: Add device tree entry for SGX GPU

 .../{img,powervr.yaml => img,powervr-rogue.yaml}   |   4 +-
 .../devicetree/bindings/gpu/img,powervr-sgx.yaml   | 138 +++++++++++++++++++++
 MAINTAINERS                                        |   3 +-
 arch/arm/boot/dts/ti/omap/am33xx.dtsi              |   9 +-
 arch/arm/boot/dts/ti/omap/am3517.dtsi              |  11 +-
 arch/arm/boot/dts/ti/omap/am4372.dtsi              |   6 +
 arch/arm/boot/dts/ti/omap/dra7.dtsi                |   9 +-
 arch/arm/boot/dts/ti/omap/omap34xx.dtsi            |  11 +-
 arch/arm/boot/dts/ti/omap/omap36xx.dtsi            |   9 +-
 arch/arm/boot/dts/ti/omap/omap4.dtsi               |   9 +-
 arch/arm/boot/dts/ti/omap/omap5.dtsi               |   9 +-
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi           |   7 ++
 12 files changed, 195 insertions(+), 30 deletions(-)
 rename Documentation/devicetree/bindings/gpu/{img,powervr.yaml => img,powervr-rogue.yaml} (91%)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,powervr-sgx.yaml

