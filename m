Return-Path: <linux-omap+bounces-3361-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F5CA5C115
	for <lists+linux-omap@lfdr.de>; Tue, 11 Mar 2025 13:28:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D78F188B43D
	for <lists+linux-omap@lfdr.de>; Tue, 11 Mar 2025 12:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F78B25A2BF;
	Tue, 11 Mar 2025 12:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mtvS7dUp"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E6E25A2A2;
	Tue, 11 Mar 2025 12:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741695552; cv=none; b=cSmM4l+C2e9IZvcLmNcoS3byIBU4pOiG6mgNvU7eeg06oRRITODgs63XDjF/6oThNDK/M8jL12qULSxhVoQrhs138x0HwqQZFLplkYDD6Za2uYIJUZ03gNA5w1NcDdQnGAOtqo8CcqpPxn3af+v3IU/4fZfPbiSTzNlkF9WaGI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741695552; c=relaxed/simple;
	bh=hM+Tb4R5v8bLINi/KffYzAfj9nxBFX9y1AOJMkEpWCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SdY+xQvB1Xkq5RkLxkqZTE4CBP4LT0BRhLYTwPa3iWR9OfLly4LiX3JVLKqsRinFIG9iN/k7cmE2bkJIAV3C3RbiXDZeC2KXdhAhcbmfjo9chGyiT5Qvj+NRSzPECt7vA0hYTmmG+1MX6j/FFzAqLr4aGf861Bf/qu7nAIkaOGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mtvS7dUp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21D98C4CEEE;
	Tue, 11 Mar 2025 12:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741695551;
	bh=hM+Tb4R5v8bLINi/KffYzAfj9nxBFX9y1AOJMkEpWCk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mtvS7dUpX92xO/aWwKdRelwCLf5IKHFEHhw03H4yOPk+kGjXEOcMTnCxn1TIufoAR
	 rbgN+CEuyzxrB9DFcjJnx6d/ZQpl7GRZbtQ4DE4L3TdbeNWcK4xMDzkEdGzWi4L8Fh
	 GhnOsn8oFwdtku8OaN0lCJJhsK12LBxr3IYkrO/nZceHeVqRgKm5dRA+pzfq0amITL
	 kh3cnGnkwpR2x9J+1p6bid8s0c5as08d1IOWundV5LmNn3pFMssapMIndBtG+8XNKV
	 h8X+6fxlSOT6lyAjNXzkA93+kujQQUHn6XWPkoJ/NzB8ADekfC34H0+XNA+AYavzW6
	 uQou4/yOIttSg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 11 Mar 2025 13:18:37 +0100
Subject: [PATCH net-next 5/7] net: ethernet: mediatek: Add metadata support
 for xdp mode
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-mvneta-xdp-meta-v1-5-36cf1c99790e@kernel.org>
References: <20250311-mvneta-xdp-meta-v1-0-36cf1c99790e@kernel.org>
In-Reply-To: <20250311-mvneta-xdp-meta-v1-0-36cf1c99790e@kernel.org>
To: Marcin Wojtas <marcin.s.wojtas@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Masahisa Kojima <kojima.masahisa@socionext.com>, 
 Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>, 
 Subbaraya Sundeep <sbhatta@marvell.com>, hariprasad <hkelam@marvell.com>, 
 Bharat Bhushan <bbhushan2@marvell.com>, Felix Fietkau <nbd@nbd.name>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Roger Quadros <rogerq@kernel.org>
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-hyperv@vger.kernel.org, linux-omap@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2

Set metadata size building the skb from xdp_buff in mediatek driver

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 922330b3f4d70421276ecd3f4ab175b3ae263f71..43197b28b3e745319e974c6022a6a51b6953f60a 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2122,7 +2122,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		if (ring->page_pool) {
 			struct page *page = virt_to_head_page(data);
 			struct xdp_buff xdp;
-			u32 ret;
+			u32 ret, metasize;
 
 			new_data = mtk_page_pool_get_buff(ring->page_pool,
 							  &dma_addr,
@@ -2138,7 +2138,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 
 			xdp_init_buff(&xdp, PAGE_SIZE, &ring->xdp_q);
 			xdp_prepare_buff(&xdp, data, MTK_PP_HEADROOM, pktlen,
-					 false);
+					 true);
 			xdp_buff_clear_frags_flag(&xdp);
 
 			ret = mtk_xdp_run(eth, ring, &xdp, netdev);
@@ -2158,6 +2158,9 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 
 			skb_reserve(skb, xdp.data - xdp.data_hard_start);
 			skb_put(skb, xdp.data_end - xdp.data);
+			metasize = xdp.data - xdp.data_meta;
+			if (metasize)
+				skb_metadata_set(skb, metasize);
 			skb_mark_for_recycle(skb);
 		} else {
 			if (ring->frag_size <= PAGE_SIZE)

-- 
2.48.1


