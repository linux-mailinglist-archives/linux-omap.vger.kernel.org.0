Return-Path: <linux-omap+bounces-2362-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C863996B9E
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2024 15:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AECB51C21A7B
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2024 13:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31051991D7;
	Wed,  9 Oct 2024 13:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QlrD6Tbl"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8036A194AEB;
	Wed,  9 Oct 2024 13:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728479831; cv=none; b=ZcoSLLZyrMfXDYIhxS03CVjhYaihBcQwnCkC4gnpiw8X44zJsOWW5j8mJrrXxz4CyWS7G1qQ7atIlcjcXmn8nFswvPjbw1woB075X0JHeiH6fPukaZeO/f7MxMBKRtxeHEUf8wEiWPSOUu3o/CbnYjPHBKs87uBEThT9qn/tRvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728479831; c=relaxed/simple;
	bh=Qr7Url/mb0mK21tX1t+cC/RoMrS9jXIGVxVS5zSRJv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DVPup/GdJEvu3bJ2U76aItR8HnsIk9EOnipG0ctyU7QoYi7jbWthEKnJDhPwRjRsyjruD9lqISL7pmsWK1F3HI+eZNED/l0/7V6WN1aCeZWRxTzEq75Krtw6X1YUUlqzTnAv73CW/Ti8c9z0F+Q9q/Iaht9OphMQx1yXJlRU6M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QlrD6Tbl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 167FBC4CEC5;
	Wed,  9 Oct 2024 13:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728479831;
	bh=Qr7Url/mb0mK21tX1t+cC/RoMrS9jXIGVxVS5zSRJv8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QlrD6TblYsphtYFpllbVXWppdquTpdrZ/+Ftdc2yZxQ5kdozpkO9muIFla9xhp2E+
	 Yh351Z0i1SlZ6F5I23caCQDBgSNzIBikowqyc+6Kck8h7wY8tkA4sHHsXiukpXbiSh
	 IWIBQHU3Jei2SlI7u//yUMVYBzthynWCR2CGwKgfnLUfwi0lwVG9EUoA7Yr/lZrdbD
	 jBCn+/IBUaI9dnp5Qhp3RGpAexgPlPuBnFy3Audaa6uEGwNSLYfLvo/VeW5ipmFHxY
	 ESQs3RBrzwHvkHKsOWJdOgMWuIr0wexg4YJufTH3Kqbl7G5EuqZQVDCyT+84N4Z4lP
	 3rle93N9odihA==
From: Roger Quadros <rogerq@kernel.org>
Date: Wed, 09 Oct 2024 16:16:55 +0300
Subject: [PATCH v2 2/3] ARM: dts: ti: omap: am335x-baltos: drop
 "gpmc,device-nand" from NAND node
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-gpmc-omap-dtbx-v2-2-fc68124a090a@kernel.org>
References: <20241009-gpmc-omap-dtbx-v2-0-fc68124a090a@kernel.org>
In-Reply-To: <20241009-gpmc-omap-dtbx-v2-0-fc68124a090a@kernel.org>
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
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBnBoJMARqTg722SPrtWvE6WiX+9O604547MkyBP
 nGYn0ePdRaJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZwaCTAAKCRDSWmvTvnYw
 k6/nEACIH2U7qaqB+bfBv04qNUhqJgFVChixdr7Fil4lBIzJ+123cakr89eMldxydw5N+Zfq9m4
 R6lyleYptveP+h7y95KaUpWOkkkVxwtBGTig2xldgsD0/rtWRUW1hPuZJVhrKKWHOUBsVPf9+zM
 vN9UFhwmVFCD8jbI/27e8DZP4c0WWgbZXNhELom8e6Q2bbvCAGZ6fiS3nrElODicFdp3F/CqxDU
 Xa7hg7yn5NyRWx6iVOzkiCrppR/ZCcvdLKg0oOEV8jie8lS4Eu1OdxTyToMig8hpeu/F9liMdZN
 HiMiPFlSmHQ979yubt9yNl049Cs4R8vCKHB2nhxq++BhgasWuuXOy2OsN/HODdXizHq3Q/NHzQc
 WI1udFsBQ2TiFPwtJjGI2krAIDDurjh1OrnRd7R8lvRMSY6DBDI9NDMX1DLSOxtMX1gpzKGazAc
 YUPY5ROEMZv+YJlxRPXEZNxjkX+XkKP7YFXBuIx8KFMa6C5teJgFkzqcQ2lZ7UUe/QXlz3IBgmu
 CLVwjM4M8OYIbGhsVlID2xSUcbsJuDK9pV6hYuW3I+P71U/TyJIJ9IcssmXoD3I+yJ5bGzIIlz6
 CEC7M5lqGJHCmKebddNf3u15YSPJLL4BzcAOaJADphDtgApuCVads/WZXUOV7PPrazQHUzDYFG0
 7mGDtB7VvDfZzjg==
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


