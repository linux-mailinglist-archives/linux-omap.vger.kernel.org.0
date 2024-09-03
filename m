Return-Path: <linux-omap+bounces-2092-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E96896A4B6
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2024 18:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4219F1C2383A
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2024 16:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD5CA18BC15;
	Tue,  3 Sep 2024 16:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lPuBjHbt"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498111E492;
	Tue,  3 Sep 2024 16:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725381832; cv=none; b=WsC+58VsgynnAQawbijlDiJEc3ZVX8xn1/5zmifY1UpsEmtoctN18ZvLdA9pRriWEwmkGa6Z3dFgq1tllbnVQkwe/fGphm9ojtKvlKXEdABrueYtV5A6zyKkkm/fM1PEXjo5SZ9bb8dGeaSm7op726b6fh5qocqHI04mgQqEaUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725381832; c=relaxed/simple;
	bh=+V1VYl4TdFT/MGWYExtwraLuQwaGntiDKAZbA07PKI4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qFqloBRnazPuwj1TcyHbR3HRcQqRMvo/IA/IH71wQ8iQMNPZZ7TDJoOyv7aTgzfIualSePV2sSVLU+qxy0ZHSvY6Qxf7/HZmtaOfMjGPW6KGuBquK0kvXOoqKxtlREYn3RWAiEUHTrYAZhfEgMhO2TD+/Qa5fsUxy9CIRmvIxno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPuBjHbt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E38C4CEC4;
	Tue,  3 Sep 2024 16:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725381831;
	bh=+V1VYl4TdFT/MGWYExtwraLuQwaGntiDKAZbA07PKI4=;
	h=From:Subject:Date:To:Cc:From;
	b=lPuBjHbtqg9wKWacP7uF6QLSfkCXspUb7KQba2TLICOuh5vVyLoS7ubZiXCk5ekOS
	 W3yEUqfHilMXWrS4Qn9axL3OrsCOHroXJQpIvyhN1NYQs3CeHCtRzuVxFW7TsvX5SR
	 IpIlQRGh/57S2TcjvOYAydnsvLnqjzQVY4zlRC4TeLn5llyeMcZxfgVA95NO3Mr4uX
	 DRYC6pyg/Qc+qJB0mgPRR/Np9McR850W7UWqSpFZGwMiIrGU3NzJyoqGmHQ49dqr5B
	 5bjMbe7x7ukpl+qUDbQ4yi85anx0Eit+PlCI5qh1drzxtTk8JT6HxE2KxOL61Azzr1
	 UwPJu5Q33ocCA==
From: Roger Quadros <rogerq@kernel.org>
Subject: [PATCH 0/3] ARM: dts: ti: omap: fix dtbs_check warnings for
 ti,gpmc-nand and ti,gpmc-onenend
Date: Tue, 03 Sep 2024 19:43:43 +0300
Message-Id: <20240903-gpmc-dtb-v1-0-380952952e34@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL8812YC/23MQQ7CIBCF4as0sxYD1Gh11XuYLugwUKLSZmiIp
 uHuYtcu/5eXb4NEHCjBrdmAKYcU5lhDHRrAyURPItjaoKU+ya6Vwi8vFHYdhSWNpDuDbjxDvS9
 MLrx36j7UnkJaZ/7scla/9Q+SlVDictVoUJFrEfsHcaTncWYPQynlC38O9t+hAAAA
To: Kevin Hilman <khilman@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Enric Balletbo i Serra <eballetbo@gmail.com>, 
 Javier Martinez Canillas <javier@dowhile0.org>
Cc: Nishanth Menon <nm@ti.com>, srk@ti.com, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=+V1VYl4TdFT/MGWYExtwraLuQwaGntiDKAZbA07PKI4=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBm1zzE8/hRKzzeU0AYW7wwhf/wgq0xA6CXLpQ8e
 K569VGq+OyJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZtc8xAAKCRDSWmvTvnYw
 k/mtD/wN9ejEFLV8b9OATPr6TDgT5XG72HKE27SekSyTvoQG/oTR7CHm93J3ucumyJ4knLN8JMh
 5iA0VdrGNydz4AO3tdUH2qzLxxLZXkRs4Z0GjXsLNTXDk2iSQV4ixFY2CjQKpcZIOl1ShS6Ecfp
 /ug/gd09PMOcK0R5a6Fx1MomzviXxoI4xxiEIoq/8QWr1atQYEh7pbjAqWCI/TAznhfV/7dveli
 KwdY29g/SzAO8RmRDYV0SBqyA0JbQDJIlluEs2yG7AH8JEFPxBKt0d6qIwFmA15I3UlnOw3l0TY
 rteakO/BmhKgXaPztIgvAkxCGNy7+ylQ9zkN64cjbeqarUnU7oqnXOhQALpvVaQ83xU7v5QqG4h
 hy50NSZ7N9yH1eFMUCJBOO4A3HE3wX8hl3LXRUPSuZjNRkMb9mQjNYpcFIPoycfqiqa//PrfcVb
 7Hw7G9CbG+O2OePuzFRdFd4ePK9G4FTduLkuxr+oCaGH5nezOyXe6k04/++D8SjNPPA6pELgXhX
 +poaC9RfNVEkUTpz6YeVFsMs7FReb8rsuQ4i42jebMx+r6A3PS/IQgkGT6nKT9hTx0LtFR6BESf
 FeeS88aMeM2f2vksHiUNaeTSFisAs5855P7JEvQwGGibktNpZN6R85PuWcGN7b8i4Tvk7TIsTZL
 0l38D8bjccRdq1A==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

This series fixes dtbs_check warnings on OMAP platforms
for ti,gpmc-nand and ti,gpmc-onenand.

The following warnings are fixed
- "nand@0,0: Unevaluated properties are not allowed ('linux,mtd-name' was unexpected)"
- "nand@0,0: Unevaluated properties are not allowed ('gpmc,device-nand' was unexpected)"
- "omap3430-sdp.dtb: onenand@2,0: Unevaluated properties are not allowed ('linux,mtd-name' was unexpected)"

---
Roger Quadros (3):
      ARM: dts: ti: drop linux,mtd-name from NAND nodes
      ARM: dts: ti: omap: am335x-baltos: drop "gpmc,device-nand" from NAND node
      ARM: dts: ti: omap3434-sdp: drop linux,mtd-name from onenand node

 arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi       | 1 -
 arch/arm/boot/dts/ti/omap/am3517-som.dtsi          | 1 -
 arch/arm/boot/dts/ti/omap/dm8148-evm.dts           | 1 -
 arch/arm/boot/dts/ti/omap/dm8168-evm.dts           | 1 -
 arch/arm/boot/dts/ti/omap/dra62x-j5eco-evm.dts     | 1 -
 arch/arm/boot/dts/ti/omap/logicpd-som-lv.dtsi      | 1 -
 arch/arm/boot/dts/ti/omap/logicpd-torpedo-som.dtsi | 1 -
 arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dts       | 1 -
 arch/arm/boot/dts/ti/omap/omap3-evm.dts            | 1 -
 arch/arm/boot/dts/ti/omap/omap3-igep.dtsi          | 1 -
 arch/arm/boot/dts/ti/omap/omap3-ldp.dts            | 1 -
 arch/arm/boot/dts/ti/omap/omap3-overo-base.dtsi    | 1 -
 arch/arm/boot/dts/ti/omap/omap3430-sdp.dts         | 2 --
 13 files changed, 14 deletions(-)
---
base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
change-id: 20240830-gpmc-dtb-de2ce28acfb6

Best regards,
-- 
Roger Quadros <rogerq@kernel.org>


