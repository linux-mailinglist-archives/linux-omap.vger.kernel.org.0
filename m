Return-Path: <linux-omap+bounces-2094-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EC096A4BD
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2024 18:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 659031C23AC6
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2024 16:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A58518EFC5;
	Tue,  3 Sep 2024 16:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ANztZXWA"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3606D18BC12;
	Tue,  3 Sep 2024 16:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725381840; cv=none; b=IaOJ+3DQgYjTzZHM/Cvivzx9lS8nMmm+SUOzItcFwGmLbwxsjlZJiGIJC/evzgIM9tIHEHpXkduWRjIw4H4VDd8WdH1s41drnIQ0Bwgx3wwxXizssNRxzqdz0XH9qvZaZvioiLY0T8i/KDmXVJm+Dof/m0XfhhCrrCUdC/+PIxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725381840; c=relaxed/simple;
	bh=Qr7Url/mb0mK21tX1t+cC/RoMrS9jXIGVxVS5zSRJv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jP1QnF/ZyjN3TFnrroUFMBPrLgWYJiqGmP7oGKqlOdNYjg8Nv/9E1qXpBwnEuLT3+oizXBQHG7577M+0IuHVG/rOxE1qjNJlY8msfVf4je1yN0iI7xJ1viNYFI9WGwu1brVjaitaspqL9uHdqQ4jNGfcSLUcKEQgncmbj/Lkz0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ANztZXWA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6105C4CECA;
	Tue,  3 Sep 2024 16:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725381838;
	bh=Qr7Url/mb0mK21tX1t+cC/RoMrS9jXIGVxVS5zSRJv8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ANztZXWAKuGfQq1kBcj9dJ9OWbjHYsQScRi4xEPHwCszG1BM3eEXFFquiCUuSeszv
	 XdBKsfBdQehmZccAO2fb2l25HzAOz2QcKx1Z0cFTU1Pb4Lz8KwrkBsV0KefDsqYnfG
	 +Y7AJAJmns+dH6erLuDtHkkM/GhyLEo4pJ9XHMQjt2PYcOiqkY85FVBTX1lBbrelQR
	 DRNv1iTyUrpousTJnS+Egthe8zVSnTQSSrBhkP6K9VBSriFS8CKUwbMqf2r9IjDpnY
	 /D10P3y/G19qAkqhzFeb3NZlge+wRhHUAFH3reOn6Yy/2OMJUgwl8BIiC5vwBL0shs
	 xrAqBHOep5iTg==
From: Roger Quadros <rogerq@kernel.org>
Date: Tue, 03 Sep 2024 19:43:45 +0300
Subject: [PATCH 2/3] ARM: dts: ti: omap: am335x-baltos: drop
 "gpmc,device-nand" from NAND node
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-gpmc-dtb-v1-2-380952952e34@kernel.org>
References: <20240903-gpmc-dtb-v1-0-380952952e34@kernel.org>
In-Reply-To: <20240903-gpmc-dtb-v1-0-380952952e34@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Enric Balletbo i Serra <eballetbo@gmail.com>, 
 Javier Martinez Canillas <javier@dowhile0.org>
Cc: Nishanth Menon <nm@ti.com>, srk@ti.com, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=810; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=Qr7Url/mb0mK21tX1t+cC/RoMrS9jXIGVxVS5zSRJv8=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBm1zzEPsXjYV+AlW43ashOz18dtntuZRVZEXNsk
 i5f10rTvSmJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZtc8xAAKCRDSWmvTvnYw
 k0cGD/4h/0/ABit4scJ8zyV8gt4eGNPhoCfZI2k1VqQya1LRmf1Csoedk0GHBOfjlQ/9fVKslXw
 6iC2HUXQn0KRjOq2FDSLxbvLtDmoHp9XLwnfRKEumdWwljDlODbakmED0GgH1Hbo0/u5eFMd/Gw
 3+ySTKffs+tMCnR3G+qK/P+UkLnXyY3uhSObMsQPvpMbt4bZnEZk+Y5zPADNrBLh0hSsRaIvDEw
 jL4TfM8HuP9pU7OI6Wfj+npEd2juA7sHYMbu2Wne1nEgS27H4Amkp5lVdmVb2GBOlM+pjHOOcv+
 iySfZeKM7u7PKswSJK0CFUihzrhJUZ5MG/grp/LL9eU9cI1Zw4ZtQH0f2vXqAdfghodR+2PGADu
 U57NnR1a3l7UZinmmbyZkV3LtYeIOjDjPi+znwGIZx5sFgJcwzWKVy48y1Rre3POxM2kCVLVpUF
 0LjSXpO7ZA2EwGgZEBCX21IbVUVQ+3letBYr3h3XrAz6aGMopkPTbc67oCQ2WCzDnZMFKU6j1oD
 uauYjw/WrJnf7paLSIBwAlCyxb/mtYVHNloaztrtGT3opjIvVsQIArYs64SH9vpe1Nh/2QUbu6/
 I1ukgS87R3nMpUbQwdMRSthfdEj2qUnvyFCKqfWeDCxUrI/Q8SxmOrxQ3XS1Roa0eisiwYTdg9k
 WsB5ifFIUhZfEPw==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

"gpmc,device-nand" is not used any more and leads to below dtbs_check
warning so drop it.

"nand@0,0: Unevaluated properties are not allowed ('gpmc,device-nand' was unexpected)"

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi b/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi
index a4beb718559c..d0efbeadd7d2 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi
@@ -199,7 +199,6 @@ nand@0,0 {
 		ti,nand-ecc-opt = "bch8";
 		ti,nand-xfer-type = "prefetch-dma";
 
-		gpmc,device-nand = "true";
 		gpmc,device-width = <1>;
 		gpmc,sync-clk-ps = <0>;
 		gpmc,cs-on-ns = <0>;

-- 
2.34.1


