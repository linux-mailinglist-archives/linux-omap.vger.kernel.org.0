Return-Path: <linux-omap+bounces-2363-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3854996BA1
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2024 15:17:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A091E1F233F0
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2024 13:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E562199949;
	Wed,  9 Oct 2024 13:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a05V+9rb"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9CD198E61;
	Wed,  9 Oct 2024 13:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728479835; cv=none; b=DWgxEtHhC2lKkPbYjpknYmzW88Sc2hbp3ZEZvSFqQYgFKa3bWdLUtLZVwG8tbvpFfBnt41/9kIomSB62UuhKzboCTHF57wxyh2hGZLYC9GCT+R/NIX4U6EP0o+RKYQk4xdv+a/EYQsodOCkDsmEEKeEELdkUVeOotcxpv2TxDpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728479835; c=relaxed/simple;
	bh=qabjB5oibBgOuYQ06RZQUBqxaBt1BLUrAcsWFSZ6Tb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JMyn0cadcR1t0yyH/CPMVtPfd8W/tXSvMMNXqLBT5PkLEZIaEE98qmNdgNCniH9U2zgUx1mecdXCd+i8gnh37U7i/otst348Xk+PMa6dz4OMTW79LVZPala8wIvlYjfJGblJsoseZ1ab6fumG+vFxRLgMuxL/yz8qgXXIaN8DJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a05V+9rb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 822CAC4CECF;
	Wed,  9 Oct 2024 13:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728479834;
	bh=qabjB5oibBgOuYQ06RZQUBqxaBt1BLUrAcsWFSZ6Tb8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=a05V+9rb1s+pELwbKiWc4dreO1AdB6/QQrYiXhhS76bHtBrbWLfvZFNDsXNvNTOEN
	 z1WmP9JF+UyEkC3Ws/sqF8PQUyMQACRpiRFMfzmIjdnr3Jf8f72rwOLageEGyhYx/v
	 ChtUEgsUzMIsgW2S6B7zbAobiyR1S+/N5ersyryjXZAGUSzsymPjcrbRDBq8UfARJh
	 4L+NO2wI/Ux35b1hJiQ3i0u5aRcpB+5Z5YByy+VEo8hBfYUb+20SwWBBeZgwwZxqoR
	 W+lhfkYK9pKKKwoYyJoE19DSDa8GTnTkMz8YoPkDd0c3iV4tKoLZzbdXNkseuTg0AE
	 D48HvlQpIb/3Q==
From: Roger Quadros <rogerq@kernel.org>
Date: Wed, 09 Oct 2024 16:16:56 +0300
Subject: [PATCH v2 3/3] ARM: dts: ti: omap3434-sdp: drop linux,mtd-name
 from onenand node
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-gpmc-omap-dtbx-v2-3-fc68124a090a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=823; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=qabjB5oibBgOuYQ06RZQUBqxaBt1BLUrAcsWFSZ6Tb8=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBnBoJMlLFvUib/q7OQiXiXTF0e38wjrIT3PCKuU
 qh/ixB0i5yJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZwaCTAAKCRDSWmvTvnYw
 k8OjD/42GvrALMGM/CBBCWlCcoml/dZ0NHNw4bu3ygSTduNVURvcJ8QNkiMzd9rrPM/or8c2KKc
 KbtJFxEog8W0sdnERmLsz0zK67SIEHPzyxaSbYYLSkt1JWbeZ/YJOPfHhlrEyy76Jn8T0qHsovm
 sTyYM2/VpdgspOShrbSQaByAaLoq9hWE9z+Uh0jIHZhhClxi1811pNXPhNH91VonrhjJJswTwLZ
 SGDyGB8TpmJepuoGoGRVuutJBhnxtp5jE8SirWb1oaOWiz7qWM4B8kq5Lq/uLW5G+k+z76N4PQf
 O056oEfzJYYmA8A+RCN+8JWxvYREMcYGOhOJ9abMGAgRPSQeSN/be8ksKFLuWS0BWGiN9dytH2V
 W9h0j18ReRHIJWLH43ETqF8iKKXqZKCMainiQBSFA9hHdoD3BkFQSQyzG+H9E/Db2lluSOLWmqn
 ajYUDN0vfYQ6PI/L/+aJECxcgnW15S/QGwjktHQBnEovs6aSgxF6YhVv4YY9NpgKT+tKHMGGWsq
 wKHc6MiLlLsN4JD36aX2sQ0xewbw6I4sqJkpQNbj325MDD4t8kiv7tCRiTZC9gMeH2KWVR/3+Sf
 S2jHULyCaWFa8H1+8WXQqmMK5hIxA++pCes/JAeEl2jVBy3hSDQsVr4HQn8jRXXaTu3cU6j9569
 UvDVGO9q+TcJ3PA==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

linux,mtd-name is only applicable for PHYSMAP driver and not for
OneNAND.

Fixes the below dtbs_check warning

"omap3430-sdp.dtb: onenand@2,0: Unevaluated properties are not allowed ('linux,mtd-name' was unexpected)"

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 arch/arm/boot/dts/ti/omap/omap3430-sdp.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap3430-sdp.dts b/arch/arm/boot/dts/ti/omap/omap3430-sdp.dts
index 1454a89aa980..cc5e9035ef73 100644
--- a/arch/arm/boot/dts/ti/omap/omap3430-sdp.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3430-sdp.dts
@@ -147,7 +147,6 @@ partition@780000 {
 	};
 
 	onenand@2,0 {
-		linux,mtd-name = "samsung,kfm2g16q2m-deb8";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "ti,omap2-onenand";

-- 
2.34.1


