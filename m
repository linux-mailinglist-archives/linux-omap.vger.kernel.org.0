Return-Path: <linux-omap+bounces-4851-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0782C378E5
	for <lists+linux-omap@lfdr.de>; Wed, 05 Nov 2025 20:52:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD7BB18811D2
	for <lists+linux-omap@lfdr.de>; Wed,  5 Nov 2025 19:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A83A6344057;
	Wed,  5 Nov 2025 19:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rTJv6PKw"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBA6344030;
	Wed,  5 Nov 2025 19:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762372369; cv=none; b=E+vv7fL5yI2R5vxvW/70GOrErltdYklkCHcRGcoccSLg0L5k67/1iG6KifNt8ENO+vC3Kw1pBSXJ3WAb+KYnbePHm6nH/XaZiyfHLZ2xe8Y83IsnMUxPWIFrhdV/872jYy5IhIWSvkxwMglfuTNyoPSTBb+XCiobh1GWyjdYolw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762372369; c=relaxed/simple;
	bh=2Gd4bL1SBDUivBOmoFrzqDCjyb7m9dtwkO2F4EvzbII=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Wah82bv4x0VJLlSLkOG9GlybxpQu8xeVXEjL6LL/WRNl4M5q9wyiyFvRImKiVI+AEgoU6xUtFomSinb6yJKVJTaCJXcDSodNt4ZJMKebRyf9/H7YjLAH7Rq7k2OWxK/wpA/5wqbFOPItFJf2IXIGP3/4/WOWQDchKbtHJUVnquI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rTJv6PKw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0259AC4CEF5;
	Wed,  5 Nov 2025 19:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762372368;
	bh=2Gd4bL1SBDUivBOmoFrzqDCjyb7m9dtwkO2F4EvzbII=;
	h=From:Subject:Date:To:Cc:From;
	b=rTJv6PKwb5YInAQVdLAEHkhSo1VCLYTmmgXIMD1TQAj5HME6ygowiTUlxzQSoYCU9
	 4XmZZhTB/5ooBhqK8vv9YKrvK9HLS4ElznROmhVwnM1vBgrk/CEomVz/WXvTVoqq8g
	 E+GWemsGv5veZIaAlvbNteYMlsDDa/1Q4q7PfclA79CZioKiUuC8QQ4Rrx6/4Fl+fZ
	 Y5G7Fw/qun+GywvDgv+PMJeTTDS3RXQWExmIOAquZvWM0vykWbL+3qVkPgYbMFlk+Z
	 WXx7rVTJcNDcWMTjOiYU8bCpep3Iou35rHN1fBAouVp9kmMO/ecqBC42kgsdOr5KYB
	 2c8Tf7mFv3cyQ==
From: akemnade@kernel.org
Subject: [PATCH v3 0/3] mfd: twl603x: add power button
Date: Wed, 05 Nov 2025 20:52:34 +0100
Message-Id: <20251105-twl6030-button-v3-0-9b37eb2b0989@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAKrC2kC/3XMSwrCMBSF4a2UjI3cPGscuQ9x0Me1DUoiSYxK6
 d5NO1LE4Tnw/ROJGCxGsq8mEjDbaL0rQ2wq0o2NG5DavmzCgSsGHGh6XDUIoO09Je/oTvS1Mi1
 oQE0KugU82+caPJ7KHm1MPrzWfmbL+zeVGQVqBEotZdOZWh4uGBxetz4MZGll/uHFr+fFg9FK9
 KAa3rIvP8/zGwsFepjtAAAA
X-Change-ID: 20251020-twl6030-button-83d759b060e6
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-omap@vger.kernel.org, 
 Andreas Kemnade <akemnade@kernel.org>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211; i=akemnade@kernel.org;
 h=from:subject:message-id; bh=2Gd4bL1SBDUivBOmoFrzqDCjyb7m9dtwkO2F4EvzbII=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJncq7lcra5m10m8UFa0mCV/IWJBPrNKo5+UTfESO1PZs
 3LrXz3tKGVhEONikBVTZPllreD2SeVZbvDUCHuYOaxMIEMYuDgFYCISXxkZtv7j77dlDvvAvXZn
 gNURrm/n54kuNp/iN53HcVmA96sj3Az/1PPNnJpnnDxRJ7Fizcfi5I2SAbO/NXItrN01dfoD11O
 fWQA=
X-Developer-Key: i=akemnade@kernel.org; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

Like the TWL4030, the TWL603x also has a power button feature,
so extend the TWL4030 power button driver to support TWL603x.

Signed-off-by: Andreas Kemnade <akemnade@kernel.org>
---
Changes in v3:
- static definition of chipdata
- stricter rules in common part of binding
- Link to v2: https://lore.kernel.org/r/20251030-twl6030-button-v2-0-09653d05a2b1@kernel.org

Changes in v2:
- integrate driver into existing TWL4030 driver
- improve commit messages
- Link to v1: https://lore.kernel.org/r/20251020-twl6030-button-v1-0-93e4644ac974@kernel.org

---
Andreas Kemnade (3):
      dt-bindings: mfd: twl: enable power button also for twl603x
      Input: twl4030 - add TWL603x power button
      ARM: dts: ti/omap: omap4-epson-embt2ws: add powerbutton

 Documentation/devicetree/bindings/mfd/ti,twl.yaml | 40 ++++++++++++---
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts |  5 ++
 drivers/input/misc/twl4030-pwrbutton.c            | 61 +++++++++++++++++++++--
 3 files changed, 96 insertions(+), 10 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251020-twl6030-button-83d759b060e6

Best regards,
--  
Andreas Kemnade <akemnade@kernel.org>


