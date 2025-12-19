Return-Path: <linux-omap+bounces-5231-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D9ECCF850
	for <lists+linux-omap@lfdr.de>; Fri, 19 Dec 2025 12:04:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74A52301738D
	for <lists+linux-omap@lfdr.de>; Fri, 19 Dec 2025 11:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB223002DD;
	Fri, 19 Dec 2025 11:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K3v4V654"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF46D1B4F0A;
	Fri, 19 Dec 2025 11:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766142186; cv=none; b=ig6TQumpu4ABGUwE9qvVEwgPJnYWKzhpp1sVUQ+uKjGyv5azCSZUJboGmT6zYDfuzXXl4dsf9Bl3txTLjh91iTDPU8psdtG+6rAB1Nm9YfpizYcbV4ARlwj2GIrah2Ycd9ixuj8xVMKgBqYw0a5L3pg+KxfX1I5DS53kILZdpBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766142186; c=relaxed/simple;
	bh=6INTDsR9BdK+v43EIj38/TA8XJ5fylT499/B4YCLaOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P1GpaFUgWilA3L9seR0QI0bREAjrItdDm6oYhDF8/6MGghL/UpGNSlQhtmQsdz4QIVh46498ilKW50scbhx/poyvbRM+wg1ElEnQoQ5zfuPp8X9exm8jQsp5V4GTJDSV2RavFkfQDIurtKz5YSP9nPsoa2SNgFlKwiKxZiEQ+zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K3v4V654; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA05C4CEF1;
	Fri, 19 Dec 2025 11:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766142185;
	bh=6INTDsR9BdK+v43EIj38/TA8XJ5fylT499/B4YCLaOQ=;
	h=From:To:Cc:Subject:Date:From;
	b=K3v4V654p7+l40Y6Zjf5TTk+u0ztaz16caan5ENortFUKAnLG2kZFQBeRlX7LKcWj
	 tKlFY12BBtSOPXqJfp6r0hA23rsVPZ7IFBlCbUvUiCioPXPXQnWDnKKFXuSwInjhkx
	 fv/yrmbkVao+UEPyEALGOu7GOUWtak6cYQ+LGv5AYmRtwPnYmz907Z49V19Q09GZFB
	 4ySF7YYYqTmxSx3wsNR0Es4c/VVuqDc0jeUEIpx54u6KVFNhxE+tvZnVMO198RnM/R
	 Dcas2ZaPJ1k6xaZ3xdFqezP54pBBWc+7t82bSRqxrY4pqHkv8aDae9qqVUGXneW4Jt
	 mlDD1sqKY1hzw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vWYGG-0000000069Q-20BK;
	Fri, 19 Dec 2025 12:03:04 +0100
From: Johan Hovold <johan@kernel.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] bus: omap-ocp2scp: enable compile testing
Date: Fri, 19 Dec 2025 12:02:59 +0100
Message-ID: <20251219110259.23630-1-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There seems to be nothing preventing the driver from being compile
tested so enable that for wider build coverage.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/bus/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index fe7600283e70..2a1b46f07080 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -141,7 +141,7 @@ config OMAP_INTERCONNECT
 
 config OMAP_OCP2SCP
 	tristate "OMAP OCP2SCP DRIVER"
-	depends on ARCH_OMAP2PLUS
+	depends on ARCH_OMAP2PLUS || COMPILE_TEST
 	help
 	  Driver to enable ocp2scp module which transforms ocp interface
 	  protocol to scp protocol. In OMAP4, USB PHY is connected via
-- 
2.51.2


