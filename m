Return-Path: <linux-omap+bounces-4856-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A65C37C3A
	for <lists+linux-omap@lfdr.de>; Wed, 05 Nov 2025 21:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2ACDC18C6240
	for <lists+linux-omap@lfdr.de>; Wed,  5 Nov 2025 20:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828DA347FC8;
	Wed,  5 Nov 2025 20:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oswqbWyu"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1718430F81F;
	Wed,  5 Nov 2025 20:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762375276; cv=none; b=Z/SO4r5vvI4fUxK6v2P8ofb4Vve0SSz5kgxqN9W2iCeAtOM0LpmgQKpUNsvRk1dhEPMFZoZ4iURKbhiiKsvUwaiQDjhA+mQx7FWHC68u0spthnZmibFbMvbnYj50W+Kp5qdq3KipnlOhdwCAlQuAWbfXrl36dUwAOhkr7Yy1tuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762375276; c=relaxed/simple;
	bh=87mU3vLYFFwt9bHWGzOcy2v3ecVuUeRFDLbcEB2bu/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lmybaZDCewKiatoAjZ8ExXb3FFODjomhXRsQ5IY/oUxz4sKkKvKBxAXTB0A+bquCIN56omgjUhKth0/UjoKqGhJCOwvjmg3jG1sOyFcKijbGN9JYR2p9fQisDnbHjDIpVgFVfgmSAfMvmoj/3XK9fMTT0Dm4pqcKeQQRkCb6N4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oswqbWyu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB73C4CEF5;
	Wed,  5 Nov 2025 20:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762375275;
	bh=87mU3vLYFFwt9bHWGzOcy2v3ecVuUeRFDLbcEB2bu/Y=;
	h=From:Date:Subject:To:Cc:From;
	b=oswqbWyuN6UBNAdyC9hDipLDI3cfwlKq6cWR/3h2Qsa+8wSBbluCKbTqybzA+p8d4
	 E0EuUooHj/PFP2TUmmHf1r32d31kPE4+YGFIEa1smtJMYVTvw7wjR0rQ4jhlgimfwV
	 1uSKc/PORHF1tRSBJsS9RUXwmV7m284TK2syVIcCuqelmoQaXADlog+eCcxKFMvNq2
	 AnwREZtI9me5TmwHi2/fD862LExhwcQAstdV6KK7eRQVRu0cj6euNj/WwLBvT60re/
	 KF3QCG7AyCQ+/KsWpQrr5N0/Y2UkyYwpu/97GP+DopNo1z/DLszPGglP2tH9tnUo0n
	 QhAuJ/b3P6Xzw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 05 Nov 2025 13:41:09 -0700
Subject: [PATCH v2] ARM: dts: omap: am335x-mba335x: Fix stray '/*' in
 comment
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-omap-mba335x-fix-clang-comment-warning-v2-1-f8a0003e1003@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGS2C2kC/5WNQQ6CMBBFr0Jm7Rjaiqgr72FYtGWERtqSKUEM4
 e5WbuDy/bz8t0IidpTgVqzANLvkYsggDwXYXoeO0LWZQZayEqKsMHo9ojdaqWrBp1vQDllDG72
 nMOFbc3CZdUvmcqp1qdoa8tnIlOU99Ggy9y5NkT97dxa/9e/ELFDg1ZxrQSStuar7izjQcIzcQ
 bNt2xdEccuJ3QAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2071; i=nathan@kernel.org;
 h=from:subject:message-id; bh=87mU3vLYFFwt9bHWGzOcy2v3ecVuUeRFDLbcEB2bu/Y=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJnc2zKqLFfvfe9ydUL6V5ON2tuaaxUsQxQLN6ap3Ht+8
 sasc8rOHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiVxYw/C9751movvrmwy5+
 b77Lv01dIrutcoN2/Kh83F2//0LrPkuG/6kcl1O46ta0FNXzeIXrp8iFbX2f1Rg+I3fWnCt5rCE
 nmAA=
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
Changes in v2:
- Fix subject (sorry for the quick update...)
- Link to v1: https://patch.msgid.link/20251105-omap-mba335x-fix-clang-comment-warning-v1-1-9b671ee2cb93@kernel.org
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


