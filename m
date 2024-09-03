Return-Path: <linux-omap+bounces-2091-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 140A996A44F
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2024 18:30:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46E211C23EBC
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2024 16:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4986718BBB0;
	Tue,  3 Sep 2024 16:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="obYyIdBi"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92EB18A94E;
	Tue,  3 Sep 2024 16:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725381005; cv=none; b=lwscdmrWhaVNOf3wsAX4ZoR6uildN6iFy6G1a6plCR/inbwzw7KkMvG4cqAaSc9gudvyE/Odxpcl5mS2lj5iK90rtnPdoPwYJRS6GbjFl1NCXHj8GAeNn4kxtRGRs1Fdb8tVOCfvm+rfmXo3xjdjtgLyrVuRmgylpeV9KjDcVRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725381005; c=relaxed/simple;
	bh=ZB0ZGid7oYvX+NEZ2K4bE2HWU1BmgbIDt4uG0XbOQ00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TtbNDjkIHuRntod45Cwbp+0Vx0bZ7GwSbuZkz8AH0lFE8XH56Pw9ocq//GWcOuCZZyHN59P/xVD+UIYCbyvOrkuKmHkxKwGZJ7CDyf6bY7GY60bcr80uK7miUdv1O8dql70xCq9FCf9boea36fCH1seXlJtV+6n6b9w6NISLTRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=obYyIdBi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C65EC4CEC4;
	Tue,  3 Sep 2024 16:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725381005;
	bh=ZB0ZGid7oYvX+NEZ2K4bE2HWU1BmgbIDt4uG0XbOQ00=;
	h=From:Date:Subject:To:Cc:From;
	b=obYyIdBi0lHyyRze0F9LXfG3EYfQ3K2Ec2vQyalVmEezN0wqQ645aFB/1OqMgJle1
	 O2TpvXlGt8N2LpVsrG5vH2y6JCNTNhPIek2dVQHOhCWATjfGLXCtwxvSanqPh/sAyj
	 nHd4J7n5SxJLL0vo34KObKKHHH1x3jFl0WD4u+V13WC3uHLoXuxZXX+6eJMFN00kEn
	 gCSkyTbUiA+HJRqKe4r272tzHMsttb/Xcm81pKSNsderfddwX2XHWpNJI2NCqrs7Xf
	 gPZv+s8FORKHdv2tJXoFlnlBd+CdIo/vbOO3tLLxndb61nmLQgg0WzJyvwWGa95D+D
	 f4QzY23Lpn6wA==
From: Roger Quadros <rogerq@kernel.org>
Date: Tue, 03 Sep 2024 19:29:57 +0300
Subject: [PATCH v2] dt-bindings: mtd: ti, gpmc-nand: support partitions
 node
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-gpmc-dtb-v2-1-8046c1915b96@kernel.org>
X-B4-Tracking: v=1; b=H4sIAIQ512YC/23MQQ7CIBCF4as0sxYD1Gh11XuYLugwUKLSZmiIp
 uHuYtcu/5eXb4NEHCjBrdmAKYcU5lhDHxrAyURPItjaoKU+ya6Vwi8vFHYdhSWNpDuDbjxDvS9
 MLrx36j7UnkJaZ/7scla/9Q+SlVDictVoUJFrEfsHcaTncWYPQynlCyBjt9WhAAAA
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Nishanth Menon <nm@ti.com>, Enric Balletbo i Serra <eballetbo@gmail.com>, 
 Javier Martinez Canillas <javier@dowhile0.org>
Cc: srk@ti.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1396; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=ZB0ZGid7oYvX+NEZ2K4bE2HWU1BmgbIDt4uG0XbOQ00=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBm1zmJbaVP/ewIJ9pyrYDtWXsaHySvmZFudVp4y
 qiaMKE3kUKJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZtc5iQAKCRDSWmvTvnYw
 k921D/9P8/VEILXiD9ZI1cn1LOZMD27ku1ZqmP9k0r3XFDDrmuuJhm7DKSetMG6jU7HEVEEDYvU
 qIjK5KlIY6XJfWcrvo5eVhPXrUD3NChWFYdOz8Os1TIxlsP153tC50xZ7vJ/1HtHJk94zR6cYhX
 wZ9zB9aWQqe8u78Fn9KFovJlmpmn2ABDIbNBuW/l6nljG9QOwWhNRm8KgcmcERfIkof0RQUl6st
 oni8LAqlLfaUkH69B0nd/PotqKpvGsr5xv0/W5TDvqLLj4WtFBMEVk/9dzxm0MUqnxm1czWtezT
 Y47sbwzn9gCcgBEV/ZJ9vpxCJalNnAa3kigTmf0Kr/j/8ptmsNYVo46CQrxFbbqXxfvLMjSZ/dA
 WT9zLxy2ji0hCHYBl6h80EiwfijSLT0Dx7yCz/PYQFLV10WOr9UiHJIDqY9o0RRw3oXkZj/JpBH
 Ygeo0wpv5+fbxUx8igsC5Z2oa/PXzfsnw5EEGtz2gY5gU1Y2gNMXfcwXglIq+AHx3CoMJJvUbsu
 foZkWHPL1OXkIf6tTEb0WeEeehAzYrJ2ggLBWGk13hzqth0WWBYKyMqugAsLXCK8fQ3TtMTILw+
 SuMa1Vyks4q9F60ELtKmqK0yXbO1gtC1G2kxDbuLpJO/u0wofmC3eEpKyiOrAdch1gyyVlQhxzV
 I+QnRMJUTQ1DEJw==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Allow fixed-partitions to be specified through a partitions
node.

Fixes the below dtbs_check warning:

arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: nand@0,0: Unevaluated properties are not allowed ('partitions' was unexpected)

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
Changes in v2:
- reference mtd.yaml for standard mtd properties like partition as
  suggested by Rob Herring.
- Link to v1: https://lore.kernel.org/r/20240830-gpmc-dtb-v1-1-792cac1ef3cc@kernel.org
---
 Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml b/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
index 115682fa81b7..00540302bcae 100644
--- a/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
@@ -61,12 +61,9 @@ properties:
       GPIO connection to R/B signal from NAND chip
     maxItems: 1
 
-patternProperties:
-  "@[0-9a-f]+$":
-    $ref: /schemas/mtd/partitions/partition.yaml
-
 allOf:
   - $ref: /schemas/memory-controllers/ti,gpmc-child.yaml
+  - $ref: mtd.yaml#
 
 required:
   - compatible

---
base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
change-id: 20240830-gpmc-dtb-de2ce28acfb6

Best regards,
-- 
Roger Quadros <rogerq@kernel.org>


