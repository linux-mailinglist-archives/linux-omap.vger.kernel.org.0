Return-Path: <linux-omap+bounces-2365-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C9E997708
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2024 22:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA14C1C22A37
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2024 20:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1BD61E2301;
	Wed,  9 Oct 2024 20:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="dbMHHWHq"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73E6188926;
	Wed,  9 Oct 2024 20:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728507399; cv=none; b=IUHBeapP5vTgtu3HUhYaJlzU+jmXkWwTkSrZM0r1K1w3iOCYNaf2MjrqfC+lnmaJtAA1XT5G9nsosO0BMTKENPOuhFTXtcH3z7BbAwmGTPtAJ5/8whZ5I9+ksYgzAQnfcgTqcJcLxhxRPoQGzCu0j8UZIlOF0qffLKysV/P0iPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728507399; c=relaxed/simple;
	bh=uHecwGZTeAdJYv1+uRlHFdDx0vUd1P+3XExydJncsoU=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Il4SHu3cE2A3HQmPYV9pve7hXKUoRxoVMPBWBz134W3IXnR6Blhxj38DrgTpCWU1rvQIol3VexNAtiqE1PR70krtaxOXgALphqf2gqA/kLA/PC+vsCj2lJJCzay6UEJNdgfpDepC9+SnYFpyR1eadGkWKhNeXUeqZSaSwwpWhqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=dbMHHWHq; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=pcw8S7IZiwFrBBm3SN24yyQYyUIOE4d4lAS5k1CzpUg=; b=dbMHHWHqAZU0hcHHkIX+LRJS1y
	WgIZF/nZFK+CLATPf0ZxBjtBoUg7YN3y3Ieee2SAB7uvObxcFl7MJ5hsM65RlyXvmifXRbfJsdaD8
	hwpNCkSZHzEXIOOzoACcoRm/+5enSoiHLYFtSp6I0zAVEWAGV6VfSf71YYKtbrRQFRMCMN2amqrYy
	obB6maNn464AlbC+nS/uvyx4B+Q8oo0FatVykKuWkk5RnN/Z0ovnx1zoxJs3OK9Cs603mvZwxL7/9
	vm4mAQiQgFGBQS3UbRyY+o8cF+EQGZ6mQicZ4SildBA2HQJMTZ3APJ3N6MBvi7q43kh1kDWqfx/FK
	xKl6XGzA==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Tony Lindgren <tony@atomide.com>,
	Roger Quadros <rogerq@kernel.org>,
	linux-omap@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	devicetree@vger.kernel.org,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-clk@vger.kernel.org,
	Tero Kristo <kristo@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC v2 0/2] dt-bindings: clock: ti: convert to yaml
Date: Wed,  9 Oct 2024 22:56:17 +0200
Message-Id: <20241009205619.16250-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert some clock schemas to yaml. These are one of the most used non-yaml
compatibles.

All can appear under a ti,clksel or without a ti,clksel

Reason for being RFC. In the comments for the first version, it was said that
everything which can be below a ti,clksel should be converted at the same
time. But I want to know whether I am on the right track.
I plan to convert the clock things from time to time.
So enforcing certain compatibles below ti,clksel i not there yet.

Open question: I set license to GPL-2 only because the .txt bindings the
yaml binding was derived from were
GPL-2. I personally have no problem with dual-licensing the binding.
No idea about the legal side wether that is possible or who must agree.

Changes in v2:
- added conversion of divider
- require reg now, makes sense after
  https://lore.kernel.org/linux-omap/20240213105730.5287-1-tony@atomide.com/
- clean up of examples
- improvement of documentation

v1 is at https://lore.kernel.org/linux-omap/20231127202359.145778-1-andreas@kemnade.info/

Andreas Kemnade (2):
  dt-bindings: clock: ti: Convert interface.txt to json-schema
  dt-bindings: clock: ti: Convert divider.txt to json-schema

 .../devicetree/bindings/clock/ti/divider.txt  | 115 ------------
 .../bindings/clock/ti/interface.txt           |  55 ------
 .../bindings/clock/ti/ti,divider-clock.yaml   | 175 ++++++++++++++++++
 .../bindings/clock/ti/ti,interface-clock.yaml |  70 +++++++
 4 files changed, 245 insertions(+), 170 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/divider.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/interface.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,interface-clock.yaml

-- 
2.39.5


