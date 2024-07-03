Return-Path: <linux-omap+bounces-1682-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1066926237
	for <lists+linux-omap@lfdr.de>; Wed,  3 Jul 2024 15:51:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83ED32832E6
	for <lists+linux-omap@lfdr.de>; Wed,  3 Jul 2024 13:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54DD417A5BF;
	Wed,  3 Jul 2024 13:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PsZs6EG3"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DED17083F;
	Wed,  3 Jul 2024 13:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720014699; cv=none; b=d96Zj/z4oI+z3/iuSZ9s5FUTzChiFqUgMkmk1iK5nrJVzN2I+dZBePlu6zXu+kSBAedMDSqDf+mNHhxOTWmBAYYp1M42/wKtNjrD6/MEHuO2R9MEFgTWnad3agxhmnwGOS0i6hqLRSSdjr9nEJK/JuYI01sWiCCzVtYiYwe40Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720014699; c=relaxed/simple;
	bh=UgHw0fspErskzZG7rx608DUD/GEVtKpXweEkADVYY/o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UcRkUPgnZQuAZH9M+W5IZ722QbdaPEQfLlvX0OmQE4h4zv7YgIJILvdOMK9FxGuLKh4kEXDcgHZT/AIkf0uXSt3QL708sLR6BqZR6leSYICj8M9wJiSTXFZ1MHa70N17i/V0A5jbEayJUntjuXSPgQq2yOejYnjVgkuT8kcuH5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PsZs6EG3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2515C2BD10;
	Wed,  3 Jul 2024 13:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720014698;
	bh=UgHw0fspErskzZG7rx608DUD/GEVtKpXweEkADVYY/o=;
	h=From:Subject:Date:To:Cc:From;
	b=PsZs6EG3z2CJ0lV7521+FU0QVZdYa0fqsQq4TaASX710l/pJK2nxTsH9lx++pYefE
	 qHWOwHKoNIkaD6b82NddL8ipgY467HyFIZ/WjUR6HHhVXYAz10lrceapHwL/3jTMyZ
	 +A99H8xIzWKgBssK08NQYDbk5N3i9wgvEAkeKe0QIfNnnwoqa0lx60gKACLaIr7hvV
	 O/tNwSczJFaPrnrsXaKc/6CRKR8ESK0YdD50pjqpvLZWtQrRFh0whTr9corE+p4Qmi
	 qtwq+GQ/Nnsq1CH2u/w7UbMAEtyi6jWdwDC+zrdsV1N+GonhGGP4oYSNppuQYrbemn
	 HAGYsa64aC70w==
From: Roger Quadros <rogerq@kernel.org>
Subject: [PATCH net-next v3 0/6] net: ethernet: ti: am65-cpsw: Add multi
 queue RX support
Date: Wed, 03 Jul 2024 16:51:31 +0300
Message-Id: <20240703-am65-cpsw-multi-rx-v3-0-f11cd860fd72@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGNXhWYC/33NQQ6CMBQE0KuYrv2mFCjgynsYF7T9QCMU0taKI
 dzdpitNjMvJZN5sxKHV6Mj5sBGLQTs9mxjy44HIoTU9glYxE0ZZQTnl0E68BLm4J0yP0WuwK3S
 Cy65W2JYoSBwuFju9JvRKDHowuHpyi82gnZ/tK72FLPX/4JABBVrRQlApeKfk5Y7W4HiabZ+8w
 D4MVv80WDRk3jRSVJUSJf8y9n1/A8pXTkwDAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2248; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=UgHw0fspErskzZG7rx608DUD/GEVtKpXweEkADVYY/o=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBmhVdlTR/wnvu7Y5bkQ2eXhaAz4yD+rjGPEF/cM
 8mcAPCqWtmJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZoVXZQAKCRDSWmvTvnYw
 k/3uD/98uPoM1gxC0XHxBMg0p+7NLszrQm7V+bfIL57yv+FP8bHZzkKiVW5qUKRW8ixXUJoghAT
 C6D6eGQklUE4lUre/gREdmnqTbjR+QR4vMRdaZrx7Q3XvLC+olyPc7nS7H/3tSoWM8eCPGZk9m7
 fi4LXwt+a4a9wOzXObD2TY7LYlnqUPw2r80sJgYuPgvp7OYWMpITf79iKTlsv+u9Wk+JPpY2S1E
 LbFzVHnFQ4XudH9fN8rskfgwnvZWMlbXOMosg4GiYXIoOZYcH+TTVEeNr08w6BdjYNk1WblryPX
 VXNqfBVNeqzhP1BiOYH0FjnMBTl1LIfJBWQjRBR7bxeSm/8heO8GvHdT+N/A1vW0EXYDfJMys3t
 Ny2XhoVNDh9Tvci9kwuZc54FxsZ6RtaJwGXdCyD/z9hFt7OP5DswMGnBL6npHN1G9ptqbfXPa7e
 /bKq9AzMGwBZsgBEpwkr9YfJRx4935zqbhxyPU3giHzV8PK2S7dt1FQrcJGl2HMO1ThAUjrI9uL
 XbFLzHU9o25OkVYOE7dw1QcDp0x7C2bEflWJb3T8wcL7nuCDH2NjVn699k3a93kunaywbY+8HsW
 Xc2fbNgE7faGIfWCS8ft6H2FncjOMO1JeoijoX0yCIfbzRXRLzQ7lMwFKP+uGuW89i3t2haEdI1
 Jy0rwa/dwD9pomQ==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Hi,

am65-cpsw can support up to 8 queues at Rx. So far we have
been using only one queue (i.e. default flow) for all RX traffic.

This series adds multi-queue support. The driver starts with
1 RX queue by default. User can increase the RX queues via ethtool,
e.g. 'ethtool -L ethx rx <N>'

The series also adds regmap and regfield support to some of the
ALE registers. It adds Policer/Classifier registers and fields.

Converting the existing ALE control APIs to regfields can be a separate
exercise.

Some helper functions are added to read/write to the Policer/Classifier
registers and a default Classifier setup function is added that
routes packets based on their PCP/DSCP priority to different RX queues.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
Changes in v3:
- code style fixes
- squashed patches 5 and 6
- added comment about priority to thread mapping table.
- Added Reviewed-by Simon Horman.
- Link to v2: https://lore.kernel.org/r/20240628-am65-cpsw-multi-rx-v2-0-c399cb77db56@kernel.org

Changes in v2:
- rebase to net/next
- fixed RX stall issue during iperf
- Link to v1: https://lore.kernel.org/r/20240606-am65-cpsw-multi-rx-v1-0-0704b0cb6fdc@kernel.org

---
Roger Quadros (6):
      net: ethernet: ti: am65-cpsw: Introduce multi queue Rx
      net: ethernet: ti: cpsw_ale: use regfields for ALE registers
      net: ethernet: ti: cpsw_ale: use regfields for number of Entries and Policers
      net: ethernet: ti: cpsw_ale: add Policer and Thread control register fields
      net: ethernet: ti: cpsw_ale: add policer/classifier helpers and setup defaults
      net: ethernet: ti: am65-cpsw: setup priority to flow mapping

 drivers/net/ethernet/ti/am65-cpsw-ethtool.c |  62 +++--
 drivers/net/ethernet/ti/am65-cpsw-nuss.c    | 370 ++++++++++++++++------------
 drivers/net/ethernet/ti/am65-cpsw-nuss.h    |  36 +--
 drivers/net/ethernet/ti/cpsw_ale.c          | 287 +++++++++++++++++++--
 drivers/net/ethernet/ti/cpsw_ale.h          |  62 ++++-
 5 files changed, 609 insertions(+), 208 deletions(-)
---
base-commit: 84562f9953ec5f91a4922baa2bd4f2d4f64fac31
change-id: 20240606-am65-cpsw-multi-rx-fb6cf8dea5eb

Best regards,
-- 
Roger Quadros <rogerq@kernel.org>


