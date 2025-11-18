Return-Path: <linux-omap+bounces-4946-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9034EC6A6FB
	for <lists+linux-omap@lfdr.de>; Tue, 18 Nov 2025 16:55:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 17B3A362C1B
	for <lists+linux-omap@lfdr.de>; Tue, 18 Nov 2025 15:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B618369979;
	Tue, 18 Nov 2025 15:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="S+gHBF3r"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx-relay84-hz1.antispameurope.com (mx-relay84-hz1.antispameurope.com [94.100.133.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2241836998E
	for <linux-omap@vger.kernel.org>; Tue, 18 Nov 2025 15:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.252
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763481008; cv=pass; b=FbAnbhW33GHSVuby5TOPxV+G+ilyDqgE728Bk3VuXo1WSNzicnGGbJAvjlhwDn+BdXnk8Oz6IqiTyDMLxDcQsEdPSZ8KiPPux508qVk77eVF+bb73Z0M4mhA3KUVZTJxCCvvCUEgiHuArHZUC+sqJg/aMbOCrbn+MuxoveAv7aE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763481008; c=relaxed/simple;
	bh=NCgOxXeaqSvkKMo9PdehRkjYVUxEsYk+B4MjN7gs+zE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SnRMlBV64qR/Jp5ZS7gMBv7xozdTHDRDldWC35c26k+3VjWoSIbw0PJdRdwFqECRc10FjFuQknRhbHUxNxLVZtKAA0pdtxtYzsEtRflOdI5MjoLhOV3oU5K2zJGX5Yz9GsFe/53qL7JqCUELggBojcdwT7UIezXCMVhpYAIEK8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=S+gHBF3r; arc=pass smtp.client-ip=94.100.133.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate84-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=OShmrYnXHG4AXV+3bUtrYLXK0OQmV7Q4Y7V3jIT8co8=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763480951;
 b=Q9PRZW0jR7Xw3VDqNmkzT5QWKfgFZnQRicEqYbmCBF1Xh13YXsHxpLTFpAKGkww7YiD1qsJn
 vNg9A+lNGfswXcX8pVr7G6geBZiJZQS8lNdwdTmVvQVSvZ0VVz/zwrESYXylJgVDe2c5turl0UH
 VmEDxGtN9cSHR0Vn+jvteUAfduVGCP09GgAhI2WD0G2hZpRoon+00X/F3aO2hzuIAQH/QKFTDlk
 MqdtXssM5Reu9m0wUdL+P2FJPJvwpVjVeuIMayDpPSgUYZiYT5m+n/Vi6v7p/xs5vmkNu+D8N3E
 cYXmWoLIIY1uVxlLo+44n0lKWmdkLGiGaP/s+7cEIJANQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763480951;
 b=sudfawMbEIK/Sm+tnuJ3oCyJsqp8SYnZY56MqeUSYGNLi0lx9eIHjri6M8Gbz3gkp5ux9G0u
 Bl0GzpFHmOs9ujkijiJNxBBaYsFK+9pgp5+vy010ehNIyAqND0Lbz2suLII10c2racXAY937tZk
 OBMX2GzmmRH1EN/xNZk+8ugLTemkr6asXLx6ohfMfbws0s7PB8vQcwXG72/rWYmgYJUplz5o8yb
 Ux3PJYk+aYgkryOPxnHEvB0t0cEZ8SApsKDZkE4tURgzcdv+Z/w+W2MLP8QQ5WxE4f+apvpsgFD
 EhTugH90xNakpmfjaFpo1RyX7F6hpnNtrlwbr/rXpfs2w==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay84-hz1.antispameurope.com;
 Tue, 18 Nov 2025 16:49:11 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 41238CC0E89;
	Tue, 18 Nov 2025 16:49:00 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v2 1/1] ARM: dts: tps65910: Add gpio & interrupt properties
Date: Tue, 18 Nov 2025 16:48:55 +0100
Message-ID: <20251118154856.2015184-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay84-hz1.antispameurope.com with 4d9pv04njnz3Yptg
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:828a65d2f40b52c2195059fddb127b0a
X-cloud-security:scantime:1.895
DKIM-Signature: a=rsa-sha256;
 bh=OShmrYnXHG4AXV+3bUtrYLXK0OQmV7Q4Y7V3jIT8co8=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763480951; v=1;
 b=S+gHBF3rk9IK3yO38awOKi6E5wrayGJjq+Su7yS7wtKzkEx7gQ7fIo+1ERXf9oryiiNhjvqf
 Hd0TpsroNMmXlzN8SND/t7lvJpV+etrcWHzPvccMby06v9S1XOgxfx5L+eokUMDAjmtIxynsdaQ
 Q7hD1Vj0L1Qzxb+Ecy9cT8UC79dCYaBJ49MLVGOEHd7vGXHOeQ8AGXW86GDV+1DCQ/18gFc88gY
 dSKjWGV1ur/zwustg5r9LiGtBpkfDGUjYQFEWwoZLNKESbeU35U19POdcmcCkP8FnhhyIaY0kVQ
 jjQAmPRZeCyAsn1yt8FuYO48F5ALeRSKVb4nKduVPCpIQ==

The binding document ti,tps65910.yaml requires the controller and
cells properties for both gpio and interrupts. As they have const and
fixed values a default can be provided for all users.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Set #interrupts-cells to 2
* Drop patch 2. Similar patch has been applied

 arch/arm/boot/dts/tps65910.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/tps65910.dtsi b/arch/arm/boot/dts/tps65910.dtsi
index a941d1e623280..f5a776229023c 100644
--- a/arch/arm/boot/dts/tps65910.dtsi
+++ b/arch/arm/boot/dts/tps65910.dtsi
@@ -10,6 +10,10 @@
 
 &tps {
 	compatible = "ti,tps65910";
+	interrupt-controller;
+	#interrupt-cells = <2>;
+	gpio-controller;
+	#gpio-cells = <2>;
 
 	regulators {
 		#address-cells = <1>;
-- 
2.43.0


