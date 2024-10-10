Return-Path: <linux-omap+bounces-2386-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22900998603
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 14:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C36C1F24F58
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 12:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F411C7B78;
	Thu, 10 Oct 2024 12:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="0WRlaLW+"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81DD1C462A;
	Thu, 10 Oct 2024 12:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728563409; cv=none; b=ExyYK7R/COksY9AzGpc0dY9wQCdO1fF8K4OEpyxoDt1u7cDDfzfZ55wkyfqEMhEAE9qsBNsb+vIXzySAS2zv1CknwQq4bamd0NuR3vVeahCJJCkM20UYcautXRkjDknJiYQDFauvKqCHvtO3k4VW2+YZhEZ5qiJAIWSd004zyvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728563409; c=relaxed/simple;
	bh=JWXg+Ubk4qve2mWsXaskRMHHJ/AwpTpHGviQ7FBTz7U=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=h9/59zoNjjE5VKUu37fy2/smF7qQ8mTTrXUM0KHQRDQGHo7Nfnrf3RbEPtcdS9LZPmx9TuINICfvYVfVAAq/19Ho0TIhwFAFpZsjM09v+lywwcr2tAJcd/uS3ddpi1yn8q8c5abOkwZlvvBW/xVSgJ720jIIz/Rw9vRennRWyfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=0WRlaLW+; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=cx5CrLKNKJqqRncSO8lH+4+XhRsA7iIxOG9ymt9XpPQ=; b=0WRlaLW+TsDc/xQzIfc4IGG4UM
	cQs5gZCLok5OqDyWx4AFN1Q9K4xyhZKPnltzsczhjBh3Nw0LPyMvLmyrvWnmCFVXvtn/rI1TZC6Zo
	lWqq8pvYmfw2hTD3IaWsxhxnMsQPkh9pJ/5wEsnCIdFn0OPvdzhF4tAruevBW9cYCNjNGPeA+qdN7
	M9mT5Xz9NH6s3I9pVGbHYjs0jMHOwaCK2+fIRpF/oegKpc1hJtuq5TcWPEzOgoFw3I+MXowDPqlt9
	OlYBNDuborhahlNU/9CM5tNsQ4CrMSdCJ1Rvx7xrDy3q7WR8xV7OiiBzOSD2yaqSYqvtq+zy3mUH0
	nEZXvyDw==;
From: Andreas Kemnade <andreas@kemnade.info>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	rogerq@kernel.org,
	linux-omap@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	tony@atomide.com,
	devicetree@vger.kernel.org,
	khilman@baylibre.com,
	Conor Dooley <conor+dt@kernel.org>,
	aaro.koskinen@iki.fi
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 0/4] ARM: dts: omap: omap4-epson-embt2ws: misc gpio definitions
Date: Thu, 10 Oct 2024 14:29:53 +0200
Message-Id: <20241010122957.85164-1-andreas@kemnade.info>
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

Changes in V2:
- better comment strange GPIOs
- proper names for regulator nodes

Andreas Kemnade (4):
  ARM: dts: omap: omap4-epson-embt2ws: define GPIO regulators
  ARM: dts: omap: omap4-epson-embt2ws: wire up regulators
  ARM: dts: omap: omap4-epson-embt2ws: add unknown gpio outputs
  ARM: dts: omap: omap4-epson-embt2ws: add GPIO expander

 .../boot/dts/ti/omap/omap4-epson-embt2ws.dts  | 183 +++++++++++++++++-
 1 file changed, 179 insertions(+), 4 deletions(-)

-- 
2.39.5


