Return-Path: <linux-omap+bounces-2989-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4A1A01AC2
	for <lists+linux-omap@lfdr.de>; Sun,  5 Jan 2025 18:09:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A668916191D
	for <lists+linux-omap@lfdr.de>; Sun,  5 Jan 2025 17:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B2015ECD7;
	Sun,  5 Jan 2025 17:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="n26Dy9sG"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BC514B955;
	Sun,  5 Jan 2025 17:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736096948; cv=none; b=orV74xZ4/35vR4ZdaN0pckC+HCTtPfZ1yAUGYPDZiP83OJwjFarOqyDCYJKpX9ATnKMAGBkK8t35KcVmQMassxxR72LcRRxhnqVlm7aVW896L6mK3pVE05TPeXgmK8/iZO0iLJi42NgFfW7URBzNx50uDmG1bRHmZHid6y+uMpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736096948; c=relaxed/simple;
	bh=NIKllt68xjnihHqTzhRz0Lr78zysa0CIQZSH7xr4Vro=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=q9zpoNjOGRcoH7MA15llTjdm7EANV/O4xB625pj4H0+F98GmywTNVjwunhDYiJclaoC0hB6XGjW6BPeANE8cumDCV28TH3b6u82GGjLy9AHGLaQZOO1rwK95havdJgGuEHBBR95MPZMOKx81lC+zQl+AY88RplbvJXTJLYIgSIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=n26Dy9sG; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=J6Fv4Vv6fK6uR3quq9YmN7vL6K1RuS5zWkg1sJW1LqU=; b=n26Dy9sG8R/9EB3Hi08BlSxYvJ
	PPytCFP4ewy1deHElKfI+HNYmOpJtAeP9ZgPC0ggaIUVT200dyRzFiZWsiprHMk2Z/qwiJxVJ7iTU
	foXfPKoveWOGLyVrpqsL3u9Qjjy8idgQ80T4zqDnyBsIsWfFiGQNPYd4e8nNG+D+8vb/0tTuKjmKt
	xDGolKRCHa4H55DL8UjqyiL3H1cpTyEWHaCVrtmNQK+vHx9oIOyhJm1rNEUi2lmcKhm+90wHIjbft
	a1aJNSSWjWiGcEL+FAFXHHNvOMTzZRppp+gPjoH1Leas/p77XKVKHmozXeU2nCimWt1547GSnFF+2
	/AY0omuw==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	Andreas Kemnade <andreas@kemnade.info>,
	Tony Lindgren <tony@atomide.com>,
	Tero Kristo <kristo@kernel.org>,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-omap@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 0/2] dt-bindings: clocks: ti: Next round of conversion
Date: Sun,  5 Jan 2025 18:08:52 +0100
Message-Id: <20250105170854.408875-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert more TI clock bindings to json-schema.

Changes in v2:
- comment about design pattern
- fix example to use an existing compatible
- some formatting

Andreas Kemnade (2):
  dt-bindings: clock: ti: Convert gate.txt to json-schema
  dt-bindings: clock: ti: Convert composite.txt to json-schema

 .../bindings/clock/ti/composite.txt           |  55 --------
 .../devicetree/bindings/clock/ti/gate.txt     | 105 ---------------
 .../bindings/clock/ti/ti,composite-clock.yaml |  82 ++++++++++++
 .../bindings/clock/ti/ti,gate-clock.yaml      | 125 ++++++++++++++++++
 4 files changed, 207 insertions(+), 160 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/composite.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/gate.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,composite-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml

-- 
2.39.5


