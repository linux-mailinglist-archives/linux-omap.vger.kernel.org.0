Return-Path: <linux-omap+bounces-4855-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7550EC37C40
	for <lists+linux-omap@lfdr.de>; Wed, 05 Nov 2025 21:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8299F3A42A7
	for <lists+linux-omap@lfdr.de>; Wed,  5 Nov 2025 20:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ADBF3446DB;
	Wed,  5 Nov 2025 20:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CRx1kpfu"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCE1334C0C;
	Wed,  5 Nov 2025 20:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762375174; cv=none; b=fYoeFrMZggZzpDpdhgDA5DP42RJ1OxmuvXJvndQV4vOxrn/8bKZZr7esynXHu6BEBL35xcDKQMUK+cBEC1U/zD3wiaKQG7B+h4XFTY2Ui+ABgpnikjcWkPpNnl6QvaDV/VIal2U4PRU0ObyWZm7Duj0vYzh5uwgHvgPJSNIKD0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762375174; c=relaxed/simple;
	bh=VeD7/sIL9vvxRSIrjqnecFiFKg8r8Rlrga1oknXgzZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RRnCBOEkn9VDtdRUclihvFV8kj4JAIaqDQ6K0xuj+bOWysTQxFMIsQO7Dy3sMvzCc7/wOUzMa90y63mK/OSRjx3l+EfNmR9UMdzHFienNuSDZp6FgJ2NbComu2zvm7pqBqhtOOJmat4KnTDSwv/Q/DqMMpAFnBgFRdrwC0kxhFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CRx1kpfu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6B1C4CEF5;
	Wed,  5 Nov 2025 20:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762375172;
	bh=VeD7/sIL9vvxRSIrjqnecFiFKg8r8Rlrga1oknXgzZo=;
	h=From:Date:Subject:To:Cc:From;
	b=CRx1kpfuRLvTb92OJtPdNRBlofIP6YrRUXZTXe0QWZ4WRMtfFpyrY2SHRzKkjPRaJ
	 LuOvgP/slx8L2U9ioqKWFFod99YODiDt9bUMJvNyi3v63aaO9pSF6LQZJWEFu6EfgR
	 fUg92mjJb8TcGbof3lMlaEG3XDqz7IN4CThPRtQe71jqTvxtWAVlaHDtvmucp32OCD
	 y4owBuCESjiVa0w6M6SUf+yu0/xTfKrCtYKfS3RKqBGJHD7tmBz7aPv1vM5vsuMUDN
	 YKeJwfxuWlh0A2bsCJjfwEv77fD6EP/M2VERhIFFTMTRFwoGiTkhMtIgteyi5lsEI/
	 MJnTnPcG+kpEQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 05 Nov 2025 13:39:22 -0700
Subject: [PATCH] ARM: dts: omap: : Fix stray '/*' in comment
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-omap-mba335x-fix-clang-comment-warning-v1-1-9b671ee2cb93@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPm1C2kC/x3NQQqDMBCF4avIrDuQmAalVyldjMlUB0wiibSCe
 PcOXX7w894Jjatwg0d3QuWPNClZYW8dhIXyzChRDb3pvbXGY0m0YZrIOX/gWw4Mq2YYSkqcd/x
 SzaKmyNN4H8i4OICObZU1/h89X9f1A09xXCl4AAAA
X-Change-ID: 20251105-omap-mba335x-fix-clang-comment-warning-adeb847a03d7
To: Kevin Hilman <khilman@baylibre.com>, Tony Lindgren <tony@atomide.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Schiffer <matthias.schiffer@tq-group.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, linux@ew.tq-group.com, 
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1886; i=nathan@kernel.org;
 h=from:subject:message-id; bh=VeD7/sIL9vvxRSIrjqnecFiFKg8r8Rlrga1oknXgzZo=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJnc2xjbe60PLfgWlhiyr+N5z4UJ1w8HNwRFMM/VtskOb
 ji4L2RlRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZiIw06Gv2J3xEy3Tb/bLXEw
 /eG+bRN6tmjeXS13db78ztvuBxoniFswMvz/Ynyh7LzEoa9XitVLWuy2Vh4+FTarw6Y03Ydhs3Z
 SIjcA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

When preprocessing arch/arm/boot/dts/ti/omap/am335x-mba335x.dts with
clang, there are a couple of warnings about '/*' within a block comment.

  arch/arm/boot/dts/ti/omap/am335x-mba335x.dts:260:7: warning: '/*' within block comment [-Wcomment]
    260 |                         /* /* gpmc_csn3.gpio2_0 - interrupt */
        |                            ^
  arch/arm/boot/dts/ti/omap/am335x-mba335x.dts:267:7: warning: '/*' within block comment [-Wcomment]
    267 |                         /* /* gpmc_ben1.gpio1_28 - interrupt */
        |                            ^

Remove the duplicate '/*' to clear up the warning.

Fixes: 5267fcd180b1 ("ARM: dts: omap: Add support for TQMa335x/MBa335x")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/arm/boot/dts/ti/omap/am335x-mba335x.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-mba335x.dts b/arch/arm/boot/dts/ti/omap/am335x-mba335x.dts
index e51a8a17e74c..f05e5a8c2d61 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-mba335x.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-mba335x.dts
@@ -257,14 +257,14 @@ AM33XX_PADCONF(AM335X_PIN_MCASP0_AHCLKR, PIN_OUTPUT, MUX_MODE4)
 
 	expander1_pins: expander1-pins {
 		pinctrl-single,pins = <
-			/* /* gpmc_csn3.gpio2_0 - interrupt */
+			/* gpmc_csn3.gpio2_0 - interrupt */
 			AM33XX_PADCONF(AM335X_PIN_GPMC_CSN3, PIN_INPUT_PULLUP, MUX_MODE7 )
 		>;
 	};
 
 	expander2_pins: expander2-pins {
 		pinctrl-single,pins = <
-			/* /* gpmc_ben1.gpio1_28 - interrupt */
+			/* gpmc_ben1.gpio1_28 - interrupt */
 			AM33XX_PADCONF(AM335X_PIN_GPMC_BEN1, PIN_INPUT_PULLUP, MUX_MODE7)
 		>;
 	};

---
base-commit: 25e10e2c94da2c7d18d72bd32d60d26d0c29232e
change-id: 20251105-omap-mba335x-fix-clang-comment-warning-adeb847a03d7

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


