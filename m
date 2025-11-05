Return-Path: <linux-omap+bounces-4849-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F387FC347F6
	for <lists+linux-omap@lfdr.de>; Wed, 05 Nov 2025 09:36:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B12D83AB6CC
	for <lists+linux-omap@lfdr.de>; Wed,  5 Nov 2025 08:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB5D28D836;
	Wed,  5 Nov 2025 08:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="rShTuIEC"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx-relay177-hz1.antispameurope.com (mx-relay177-hz1.antispameurope.com [94.100.133.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F27221CC6A
	for <linux-omap@vger.kernel.org>; Wed,  5 Nov 2025 08:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762331766; cv=pass; b=d/MVbbZT8GNtT3UJwhhAU/JcNWsXt5RYWFfWxoqdikaIkXUgIPN/kCYJhLQKGg2newyjlC6bShWgRIb7H2rXVcnXjFrQKNZ5a/A6WQ7Qre/wWgwcqmOIRan4MUTYr5LlepAoq4S0RfaHJCPorE+m9P5Y+WA+Ur7jYSWndHnHRcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762331766; c=relaxed/simple;
	bh=97ZxDtQ0n1JfB9JvPKPCcMdcLdBgllBUufOXYGcroo8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rmomMNI/d5yyFnPIQ3vkb02GkWJeGi19hFt++DrQ/MBEPervhA3XZxRtdVrvJrjfDxcWnzGkp8f7A7A03ZzC9vIrgN/KvZOHa21gwoK3jCa5aefvpLZEt8f6QQiMGSlntLEOZzBzpZHkndj3rVNKfT/3meMWGM/XWwR5O/P+XxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=rShTuIEC; arc=pass smtp.client-ip=94.100.133.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate177-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=M69bDo94SwBC5FFrocC4elBa/SG32/tKazGnJ/ycIZk=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1762331686;
 b=f37zz3IJphwxQHXfgYJM+6+ZQ0Sb5BVr5fqfoUZ1QY6rJ4YiVs9bLbBNpHPwovI67JZw5ys3
 ngqZCCTpKqIdopI80HwVyyLcdgBw17g5L9DElaxw3smn9APfuYJUrhuunSJd9npbA6VOaJjiYR3
 suvz241gKBut8jUmDDnHY4Zpq4fwBFTfMrvxP94FOZSNqXsKLMH6F6VqrLrlxSXx63PePNvInrM
 04Geq5lhyN34TasBq2XK9FGOsNcdWp7yfN4D+4rbTFGFxmtoCh9YllCWzQyUhMott8F+gCsGZ+v
 s86iJ0So8F/EP6exnwwh572HztaOowENAh6Np9glKsZpQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1762331686;
 b=HULOkkWbqJTvEygr6Tea4Pe8LaCf3tzeC+o5MsGngC5eXEDFu8w5icXsdv/o6jyKH3yq7IPl
 u3RAi7/aISD28cos+LK62IjRm94Rt6vYnLtaxqcfcJSFUCbJPSj+5Y8u76LC6qEOXF8N/Z3KriV
 0r2d95K75tGYaaRPvxz420oixcf4heIGuLTJgPxhBUsU6aE0Y56y/WZydCnwu5zp6PhBmxx7v/z
 AoRUwtjWyZGhOO8rHVVbr2EclpYgtIuD2V3st/nRVaDbTT2AsCTkx7uq1857+/FVeTCUSHgmd2J
 0wgkZbWiTdyoKiE+NU3UuMZwf9XssgTcKpcebgTipI+RQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay177-hz1.antispameurope.com;
 Wed, 05 Nov 2025 09:34:46 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 7D195A4118E;
	Wed,  5 Nov 2025 09:34:28 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	Kevin Hilman <khilman@baylibre.com>
Cc: linux@ew.tq-group.com,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] ARM: dts: omap: am335x-tqma335x/mba335x: Fix MicIn routing
Date: Wed,  5 Nov 2025 09:34:20 +0100
Message-ID: <20251105083422.1010825-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-omap@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay177-hz1.antispameurope.com with 4d1dsd0w8hz3kgK6
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:ee6cc2dae69e292d8830ae36f3bfe5c5
X-cloud-security:scantime:2.208
DKIM-Signature: a=rsa-sha256;
 bh=M69bDo94SwBC5FFrocC4elBa/SG32/tKazGnJ/ycIZk=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1762331686; v=1;
 b=rShTuIECLbjJhjIxLWH/LPENYT5OqwZzHi82r/fH2YYvwNHiUKhjcc4nvnzjnHiBIz6pbD6q
 5pdHsq3ZGQhlQpCLM0PtCxRwcweYwC+EZ+/QjXoBp2dL+fjXGM6hqetiJ5DKF2uDgfNFkpYBp9Z
 pqogxyQ4k4Ci2qIg3BqcHKKMytj0d/dlH76Cp70xmspcm1/1aaQP5SNHPYLpae/5e0s/g2hL773
 wagxm4RW+x8ykMEXoUvY9prP95/j9B8WIKEQ4qOiCUIbgLZeiQovkuE+vpCIlYLabJ1+1vw03jw
 B3wac8v8qXvnI8UK2/BSeaTAdmiuGUAxFnsbUJ5CCfpSQ==

'Mic Jack' is connected to IN3_L and 'Mic Bias' is connected to 'Mic Jack'
Adjust routing accordingly.

Fixes: 5267fcd180b1 ("ARM: dts: omap: Add support for TQMa335x/MBa335x")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/ti/omap/am335x-mba335x.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-mba335x.dts b/arch/arm/boot/dts/ti/omap/am335x-mba335x.dts
index e51a8a17e74c9..84dd35aeb1143 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-mba335x.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-mba335x.dts
@@ -81,7 +81,8 @@ sound {
 			"Headphone Jack",	"HPR",
 			"Line Out",		"LOL",
 			"Line Out",		"LOR",
-			"Mic Jack",		"IN3_L",
+			"IN3_L",		"Mic Jack",
+			"Mic Jack",		"Mic Bias",
 			"Line In",		"IN1_L",
 			"Line In",		"IN1_R";
 		simple-audio-card,format = "i2s";
-- 
2.43.0


