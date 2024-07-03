Return-Path: <linux-omap+bounces-1688-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 360AB92624F
	for <lists+linux-omap@lfdr.de>; Wed,  3 Jul 2024 15:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFA981F21B0B
	for <lists+linux-omap@lfdr.de>; Wed,  3 Jul 2024 13:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A06181B80;
	Wed,  3 Jul 2024 13:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZmEWP9j"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7559117B432;
	Wed,  3 Jul 2024 13:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720014722; cv=none; b=r2z9BYjQM2ys0eoSmw/2sIhoBmhEysgsWySs5AkXw50+FVyiq74Z3cwrcqj8dIG0Y7AZYRSnI92oPLlTg7oOZ4RIx09phty8RrBHh+mv7CheBjqEDVrWj6SV4g0X9W58yjaKwIYigyVRrefgmpTfUuB5d03YmBxniqQdjQQ6goo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720014722; c=relaxed/simple;
	bh=8OS3EQTA1nsQoBdqA3J8k7Fv9Yb5rZa160z2POCWKtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D9LkQ5PTGQSeeqHARcotRpLMzxYdwMCPLa8L82lBgexmCQdi88kRKaAKhzx6i77DSpgO+xQEIYpGbhQ7PyCjrLFkC3mixdJG6PY0wjijY5Rspum63fmaiTgfnpF1nCye3/XqBPyVBSSoF2cGxgu3qiA0LC00oPNuLdOCBkVGpKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZmEWP9j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91CEDC3277B;
	Wed,  3 Jul 2024 13:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720014722;
	bh=8OS3EQTA1nsQoBdqA3J8k7Fv9Yb5rZa160z2POCWKtk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aZmEWP9jyupuCkzheaevVIXB2nm4yGoDXZwPomP9xyF9P8+YIfWrq+ozDe4NRjBL2
	 Pib2KO37Qv1EcHUS9dOkLI6+mgkUx69AHIluXHeFXQxs825uzsGr/YrWFDiV4J8bmg
	 qekDTuhS8VPDFOexJ+cZF8xQ6dXeLLh6AjEBhKpUwWieHDQmFRtbJ7jJJN5ddZLO5y
	 wtfM/GrYA3jpIrdf5zGsKZvgY4ZXpQRQlfGU1xnbaqruIQO9Hxe2VqnJn/9ZOTa+Ja
	 yh6g20GRkBEGHODExhGFz+dUF7/LpMeFpO+4wmDVlVXpcAX7kX1WKRoI3QlZro78OC
	 mDKHteIm2Bj6w==
From: Roger Quadros <rogerq@kernel.org>
Date: Wed, 03 Jul 2024 16:51:37 +0300
Subject: [PATCH net-next v3 6/6] net: ethernet: ti: am65-cpsw: setup
 priority to flow mapping
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-am65-cpsw-multi-rx-v3-6-f11cd860fd72@kernel.org>
References: <20240703-am65-cpsw-multi-rx-v3-0-f11cd860fd72@kernel.org>
In-Reply-To: <20240703-am65-cpsw-multi-rx-v3-0-f11cd860fd72@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Julien Panis <jpanis@baylibre.com>
Cc: Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 srk@ti.com, vigneshr@ti.com, danishanwar@ti.com, 
 pekka Varis <p-varis@ti.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1075; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=8OS3EQTA1nsQoBdqA3J8k7Fv9Yb5rZa160z2POCWKtk=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBmhVdm+OKRJdx9lr33jldo0NJ4kivOse5Ni9dtr
 cCQFZvK+tqJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZoVXZgAKCRDSWmvTvnYw
 k7tsEAC9Haw1DbVbwvt7Bfx397ddS5mrCZVd/3k0XTwOxBmM4cpkitCv1f/iuqL4rDDHlI+wPaT
 F8Do25w8YK7xBZDErXxmWTwDVM3CEv1Xv5sPlW4El+UPrWKma32XJEMAmVJ9cgwAgy0iB6+mBLG
 qfqMc0sRwwV5vhR++Vw8n1fP9H4QL4uZkjvVUMAgRg2wFIYjh7FGn0dK8ENwfSl+MFrexALhX3N
 lvatdFMb3kUfJOZ+S0g6JXHfPGHDFI3o4AwCc0dIFHaSVDC/+7ryaCV9n69OuJYkcdOxcXhf9+E
 x9V3IDX8m54rk4uo5kkV4wUFISD8lkLdgsMAwnTaFbDpTtZggcsH4/RSC1ElQw/5ToyGFGaVrfx
 9+Gnuy6XDpoeaTqe1FlmfNpDIXIsMUtOznW9hWnUTr+cVHT04vsD2d6Qw1vd8qAL0cCES+dlK76
 h8/aD60HO7gxI/m/4moZpZACzn0uTRerW1V7Mi8Tugesh1IxiHLNFs2ZXJPTtkfKVH95M2WaSXP
 O1GCr2Man+LQ+a3rVg682qoX4sYvAUpPah0liiNksmDPZtUAV3evrHkmHRthMqS08s7civtVsYH
 J3hKTEGrCPKU9S/QqgqAR9LA+93eg8vrOhM4OPoaoAv944KNXVb7n+SBw0DAn/0mExtaRNAkos9
 qTBmB3J2I2IklAA==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Now that we support multiple RX queues, enable default priority
to flow mapping so that higher priority packets come on higher
channels (flows).

The Classifier checks for PCP/DSCP priority in the packet and
routes them to the appropriate flow.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
Reviewed-by: Simon Horman <horms@kernel.org>
---
Changelog:
v3:
- added Reviewed-by Simon Horman
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index deb8e39e4648..4db03010d234 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -2497,6 +2497,9 @@ static int am65_cpsw_nuss_init_rx_chns(struct am65_cpsw_common *common)
 		}
 	}
 
+	/* setup classifier to route priorities to flows */
+	cpsw_ale_classifier_setup_default(common->ale, common->rx_ch_num_flows);
+
 err:
 	i = devm_add_action(dev, am65_cpsw_nuss_free_rx_chns, common);
 	if (i) {

-- 
2.34.1


