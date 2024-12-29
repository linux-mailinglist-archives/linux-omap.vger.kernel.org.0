Return-Path: <linux-omap+bounces-2922-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 666579FE0CF
	for <lists+linux-omap@lfdr.de>; Mon, 30 Dec 2024 00:01:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1402E7A1297
	for <lists+linux-omap@lfdr.de>; Sun, 29 Dec 2024 23:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551F419B5A9;
	Sun, 29 Dec 2024 23:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="xBAuF/Y2"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA9B198E78;
	Sun, 29 Dec 2024 23:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735513296; cv=none; b=WaWz/DuNA7E3Nn+bm8rsx7x8Un1aouz46oCFY9sV5wa6uwH9BcVeNJVoHRps0pRPQgvKXmGtaoGvq4C3ADbU/Hf4T6QQjmMri/7j1uHNJdV0j0E+uH0nCPZWBOo6ygRn8/GADhK5avyRJ1TaTt++F1ZVRHZUbuY0VSbMPUMcn5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735513296; c=relaxed/simple;
	bh=Nhj2GmwvYn65dMam/9yrikFtqFAxoDrmk9BnqTDsaIk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=RavpDuDGKrcbXGDwknFRUoOQuRxDdDL8VtMGtOEzOJBPY7NXNYHcTVp6Qs4yOY2gJJEvWNlCvMOapqADAp6bR+hLc8z4hzg97AP2dzKXPovX1rwJ4BRe3bpgLgPVSQSFVW72ngchmfTUbCk1G80jMKmGdv8/iOaVlyBIph0d19c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=xBAuF/Y2; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=YpkmG2o+vRir8a6i/hmCa26gd2mliGG+wyeARxHvBOw=; b=xBAuF/Y2q9FhKxfDC4/ajLUSZ6
	j41bgyQ+UzHb9InmHwdWNx2NJN8DBKlRKzie0PyatuZMyxCr1Kw7wjFJ24lwDhV6uaEo2VO66HC6c
	SXCOyIttDvREWnVq0NzEDZKg5ctc/OVt9JuzhWL2jD1sdawk3hpfVjqs8nPYFAO9Ye7wTwSDrE356
	NDaTa2QV7bpRdKTA9XVZYa0o/OVwGjc7OLIZAkeY7hMBcjkiQ2u7qYzWpmAgg2EsTsEB2t89n/mo2
	8rVgJjUpTehJv+7UHxGcc5dEF/qkpo9XQHKmuXnvXpV+XPTwwy0dfIWlCK8Hp7FK8EwNNSKssa2l8
	pD/iLOBw==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Roger Quadros <rogerq@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 0/2] ARM: dts: omap4: panda: TiWilink improvements
Date: Mon, 30 Dec 2024 00:01:23 +0100
Message-Id: <20241229230125.85787-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add proper definitions for 32k clock and enable bluetooth
everywhere.

Andreas Kemnade (2):
  ARM: dts: omap4: panda: fix resources needed for Panda
  ARM: dts: omap4: panda: cleanup bluetooth

 .../boot/dts/ti/omap/omap4-panda-common.dtsi  | 38 ++++++++++++++++++-
 arch/arm/boot/dts/ti/omap/omap4-panda-es.dts  | 32 ----------------
 2 files changed, 36 insertions(+), 34 deletions(-)

-- 
2.39.5


