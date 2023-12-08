Return-Path: <linux-omap+bounces-150-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E68AA80A2F9
	for <lists+linux-omap@lfdr.de>; Fri,  8 Dec 2023 13:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 150E31C2093C
	for <lists+linux-omap@lfdr.de>; Fri,  8 Dec 2023 12:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 474811C29F;
	Fri,  8 Dec 2023 12:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="KRpHL+Q0"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A7A41989
	for <linux-omap@vger.kernel.org>; Fri,  8 Dec 2023 04:17:34 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 11F38604F7;
	Fri,  8 Dec 2023 12:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1702037854;
	bh=ip5apwLCtoYaykxE0u+f3XZdrrwqs81PIFoPcqzPK3I=;
	h=From:To:Cc:Subject:Date:From;
	b=KRpHL+Q0s2rNTlPqFa759Vj114dHohYtAnU35w6R7wwz7Jne3MTk1wzEQKILjUoeS
	 Lr5lZ6lb9auZmX3sbNLLf6Ttc1KBAN3zXq5lhZYiBOgmzzXw7kmrZ04v9QnN0YVfHX
	 4cWjbYktbRJn29Y82sgvO4jGQ/gZgNAujeOSoqlgxuNQSxs8eOQuDrSR/t+zYogB7W
	 rPFWc2YcHWU0jkWXB1/z3XfLdRTpewLoCDegZrgDJfIUQLgB4rjNzvhGf+CjK75hfg
	 6drYrMab5r9WwYle3kCdj4HHGxBpfQkF3ld0K6JKVAW/wIgJ2oi5jn+OBQVfSIOtff
	 +ZyX44OpjcX4A==
From: Tony Lindgren <tony@atomide.com>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Fixes for omaps
Date: Fri,  8 Dec 2023 14:17:15 +0200
Message-ID: <pull-1702037799-781982@atomide.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.7/fixes-signed

for you to fetch changes up to c72b9c33ef9695ad7ce7a6eb39a9df8a01b70796:

  ARM: OMAP2+: Fix null pointer dereference and memory leak in omap_soc_device_init (2023-11-30 13:57:00 +0200)

----------------------------------------------------------------
Fixes for omaps

A few fixes for omaps:

- A regression fix for ti-sysc interconnect target module driver to not access
  registers after reset if srst_udelay quirk is needed

- DRA7 L3 NoC node register size fix

----------------------------------------------------------------
Andrew Davis (1):
      ARM: dts: dra7: Fix DRA7 L3 NoC node register size

Kunwu Chan (1):
      ARM: OMAP2+: Fix null pointer dereference and memory leak in omap_soc_device_init

Tony Lindgren (1):
      bus: ti-sysc: Flush posted write only after srst_udelay

 arch/arm/boot/dts/ti/omap/dra7.dtsi |  2 +-
 arch/arm/mach-omap2/id.c            |  5 +++++
 drivers/bus/ti-sysc.c               | 18 ++++++++++++++----
 3 files changed, 20 insertions(+), 5 deletions(-)

