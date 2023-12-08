Return-Path: <linux-omap+bounces-152-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3885180A308
	for <lists+linux-omap@lfdr.de>; Fri,  8 Dec 2023 13:19:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E97DD281810
	for <lists+linux-omap@lfdr.de>; Fri,  8 Dec 2023 12:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF50A1C290;
	Fri,  8 Dec 2023 12:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="pcxa3nfA"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC52D1986
	for <linux-omap@vger.kernel.org>; Fri,  8 Dec 2023 04:18:49 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id C3EF6604F7;
	Fri,  8 Dec 2023 12:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1702037929;
	bh=ACweZUEhXFrqtvkmpi3kfh9N6DmnisvMgBTDys7hoDM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pcxa3nfAW3Js7wzzfSzVm42H1Snf6H5gr+AuPJhpdO9qqXlSk7iTwi5bjLndkl+Dv
	 HvCxNbrSv52TFIYzsHefUcAROg88IuxhoddtQaS1pnagWg80cfNqXVzA22mKY4CSza
	 81JD3kk5p51useCYE0+vNBocq+EY1NYeBvy187TewP9AKTD65A+NLBwqUUdr4e+sAr
	 cV8eGdG2IDr4JLfR5+BEcK+GdWx1AIt0EZRZGyN7L9xwMsUpV4yRwT4ZHtMzrEmxUj
	 RAQIA0jctWc7lVNlxir2niMGlvKy5WIiZFILLxCJEo1uGWMKup16NLtaqBWp5NuoM1
	 hR7c+pNSqwU5Q==
From: Tony Lindgren <tony@atomide.com>
To: soc@kernel.org
Cc: arm@kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/3] Defconfig changes for omaps for v6.8
Date: Fri,  8 Dec 2023 14:18:18 +0200
Message-ID: <pull-1702037869-295608@atomide.com-2>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <pull-1702037869-295608@atomide.com>
References: <pull-1702037869-295608@atomide.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.8/defconfig-signed

for you to fetch changes up to ac10d6c3c5f9b85e780ec5cfaf0608ae048c5205:

  ARM: omap2plus_defconfig: enable I2C devcies of bt200 (2023-12-01 08:48:15 +0200)

----------------------------------------------------------------
Defconfig changes for omaps

Defconfig changes to enable I2C devices for bt200 as loadable modules
for the PMIC, sensors and LEDs.

----------------------------------------------------------------
Andreas Kemnade (1):
      ARM: omap2plus_defconfig: enable I2C devcies of bt200

 arch/arm/configs/omap2plus_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

