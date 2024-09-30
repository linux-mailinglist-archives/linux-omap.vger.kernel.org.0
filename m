Return-Path: <linux-omap+bounces-2273-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E48DB98AF22
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2024 23:31:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82607B2431C
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2024 21:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5567F185B78;
	Mon, 30 Sep 2024 21:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="p0sKP8z+"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C2F757F3;
	Mon, 30 Sep 2024 21:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727731823; cv=none; b=WqMm5Cg9nfWs61DF8iOPqdSynGVnF3e7ROmigm8VJm9cnGp/j5LGQPOSxvaA1VSbPM7SNHJfDlHRGKRPNwjYCmMEGUwK9waXw1H1OoawZodqdRRAwXXJRj2+zKQMr4RjGvWm8sAEmJU2XVku1JdxmfWfLWDErdUWOZxygXJ4Eso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727731823; c=relaxed/simple;
	bh=W9kPStMhxuMN1l+50l26PjocU3X7bY/V5pfcm47zt5E=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=HrBjAIY7pv+zaJU1BEYnOlpTjNtYWvMJLpXvkKKbo5zslu70F9WOL9rPcVr1n2ORISdiCg+hk/wPCpi2IiI7dfi9NPPJAFpOKCTHrXOAzJjBpjlGUNpf/MFrJOLzGDsCQaflkV8nD0wrsxMAhzxksbRv//u/b6ugZ4tmbXgS+to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=p0sKP8z+; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=MuZ91d0h5jn4rLO43VLQpaQFMhTgc777z4OWfcdwA7M=; b=p0sKP8z+BVxCHCu+A2q+44yBkH
	PduRMcR6we34tFiiDBxz35OKpGwzZxTQQGpgytqs9ShKwWXSS3Bx9kTaJyD3iZai/gmYOBpmfgV7E
	qpCFiHdd52SaS362QCrPy0kz07wJ11n0E6Cfm7yGeV5mfrZOdNQUf4Y3JdXoATqIrjLoww3snI96T
	3+tkyt+h28VTO/Etn6/s1V6OabLDIExKbc+dzA762b3vsNmt6O6N7t+XdCBGNkXpLFZdB+VTFv1g7
	9LELvyib+61qc2wuacppyZcbwIxZH0C/RpnEdVfIS4zr8FxS6nRzWosXhuAtkyBzPMDw2JLCGVoe6
	DQ2pAMIA==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	khilman@baylibre.com,
	devicetree@vger.kernel.org,
	tony@atomide.com,
	rogerq@kernel.org,
	aaro.koskinen@iki.fi,
	linux-omap@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 0/4] ARM: dts: omap: omap4-epson-embt2ws: misc gpio definitions
Date: Mon, 30 Sep 2024 23:30:04 +0200
Message-Id: <20240930213008.159647-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bring the system into a more defined state and do not rely
on things being initialized by bootloader.

Andreas Kemnade (4):
  ARM: dts: omap: omap4-epson-embt2ws: define GPIO regulators
  ARM: dts: omap: omap4-epson-embt2ws: wire up regulators
  ARM: dts: omap: omap4-epson-embt2ws: add unknown gpio outputs
  ARM: dts: omap: omap4-epson-embt2ws: add GPIO expander

 .../boot/dts/ti/omap/omap4-epson-embt2ws.dts  | 175 +++++++++++++++++-
 1 file changed, 171 insertions(+), 4 deletions(-)

-- 
2.39.5


