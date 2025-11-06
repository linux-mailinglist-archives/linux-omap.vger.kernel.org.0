Return-Path: <linux-omap+bounces-4862-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A30C39B38
	for <lists+linux-omap@lfdr.de>; Thu, 06 Nov 2025 10:00:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0A60B34F891
	for <lists+linux-omap@lfdr.de>; Thu,  6 Nov 2025 09:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FCA23093A0;
	Thu,  6 Nov 2025 09:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRmM3Hmh"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0300C2A1C7;
	Thu,  6 Nov 2025 09:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762419642; cv=none; b=jOxSO/9cW7aG7k3IvhxNYE6u2nRaXPEp8/OtEUa1W7p8SSZamKqBENNRcdEjPUjdS1HRw9J/XsvAUdgSpkKf3iJzLmibDdy3e5Gch761rqL6mLgPORg9UElGpEdV0R4kNEP4ytjtU2PYvLvKNkZJdIzihP6Ap0icFjU0Q6cdNfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762419642; c=relaxed/simple;
	bh=tVUjwWb1CfWgeIFxeXGVCyzPXpJMgM4oRKMCYqPVFbY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YXFfJFPcETnEyRSQeNcINF0L7iQFaOKe+D7Qv9TQSk0bUQXhwGVUajm9nQhvE3QzXAFoR4/CY6wSNzTdsH2vbH3WQznHbEgE+a9UdsS1U53kpFZDPJeBESwO7k/YPYOMy/c4GmucLS3PH+maDmRltAyuKYEanphoofC/J5owpWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRmM3Hmh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F41A0C16AAE;
	Thu,  6 Nov 2025 09:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762419641;
	bh=tVUjwWb1CfWgeIFxeXGVCyzPXpJMgM4oRKMCYqPVFbY=;
	h=From:Subject:Date:To:Cc:From;
	b=VRmM3HmhKTac01dyBAFzh10jmu3qUT/qNnzzwmY36iyIFGwMG4rJiaqvImFhgkeUi
	 lr3AjCmqYu5g+SLprrcP0MF19A2K1QZYUVu1htQ675EIZMXyerJiItqeyK0Lk28iOC
	 kCNB4z43SEwl0gNmqwqC7znVk48z8soyUFTPqIzBTMO6CqNWN64jCa6AzF1VN6RF5S
	 lX6SD1BM1Re+pfvKZDJtKo7iF8C8ge2p/GzqkiTT1pe7URoSQmjFmkPy5CUzDPYnlI
	 9ot5mFFN+7Bf0YaEVmLCmSoicYV1/tOnrT3Kp0rTmbMRexadJcDx5pDxjp7O+B2XNA
	 UN3Unp/xUv/5Q==
From: akemnade@kernel.org
Subject: [PATCH v4 0/3] mfd: twl603x: add power button
Date: Thu, 06 Nov 2025 10:00:24 +0100
Message-Id: <20251106-twl6030-button-v4-0-fdf1aa6e1e9a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKhjDGkC/3XNTQ6CMBCG4auQrq2Z/kJdeQ/jgsIIjYSaFlFDu
 LuFjRri8pvkeWciEYPDSA7ZRAKOLjrfpyF3Ganasm+QujptwoErBhzo8Og0CKD2Pgy+p4Woc2U
 saEBNEroFvLjnGjyd025dHHx4rf2RLde/qZFRoEag1FKWlcnl8Yqhx27vQ0OW1si/vNh6njwYr
 UQNquSWbbz4eAZq48Xy34ocLbdgCvPj53l+Azwsb84tAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1399; i=akemnade@kernel.org;
 h=from:subject:message-id; bh=tVUjwWb1CfWgeIFxeXGVCyzPXpJMgM4oRKMCYqPVFbY=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJk8yevfr0tz7k/xWmUalsD2oHdqTW280alJl/Z+Pr5ba
 tVx86nVHaUsDGJcDLJiiiy/rBXcPqk8yw2eGmEPM4eVCWQIAxenAEyE5zfDX7FrqtrWOWXVecz3
 cr8F77p0KODwz+siS+akfZIwLdtgOJ2RoeVadI/eojXbv94W8LhyuKGmeyGj6bGq52b6LN589/3
 PcAIA
X-Developer-Key: i=akemnade@kernel.org; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

Like the TWL4030, the TWL603x also has a power button feature,
so extend the TWL4030 power button driver to support TWL603x.

Signed-off-by: Andreas Kemnade <akemnade@kernel.org>
---
Changes in v4:
- reorder includes
- use register numbers in struct initializers directly
- Link to v3: https://patch.msgid.link/20251105-twl6030-button-v3-0-9b37eb2b0989@kernel.org

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

 Documentation/devicetree/bindings/mfd/ti,twl.yaml | 40 +++++++++++++---
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts |  5 ++
 drivers/input/misc/twl4030-pwrbutton.c            | 58 +++++++++++++++++++++--
 3 files changed, 93 insertions(+), 10 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251020-twl6030-button-83d759b060e6

Best regards,
--  
Andreas Kemnade <akemnade@kernel.org>


