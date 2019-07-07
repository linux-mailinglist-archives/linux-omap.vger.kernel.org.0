Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C35360E37
	for <lists+linux-omap@lfdr.de>; Sat,  6 Jul 2019 01:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725878AbfGEX5m (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 5 Jul 2019 19:57:42 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43767 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbfGEX5l (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 5 Jul 2019 19:57:41 -0400
Received: by mail-lj1-f193.google.com with SMTP id 16so10629800ljv.10
        for <linux-omap@vger.kernel.org>; Fri, 05 Jul 2019 16:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FOOdXogZL2vDHEfOpwyLAfpnSunCRf1ktSXTScEaYbc=;
        b=e3kBZcgE4AAfwzUSIJXnvpmBp0um3fKmC8Po2fg5Y7z3/zUCBkazsNoPuemPp90sHI
         L0/qrEQcN+M2DqMKs4AQzR3TkxvFWxMq+KaupBzzrGMJdHfdxqB/4adwbodSfroEhopY
         kk9vSXdOcZVhduFnRkyP1SBq7rwvNDEOlS1j9luEBCB+OWIMZvpNUddiFK1q0p7+jOXd
         25a3iYl3kgxBY12bW0mqqIq/iy+dlflZ76kjd7rX0Z1RRT3LafMliwGQtI1xFeau8LbN
         6igetIBmn+Dey/Oq7QUVG2rcAdwZrwQQyR5AFTU02F+UlX7pxyioJa8HIPBokpJjohE9
         v/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FOOdXogZL2vDHEfOpwyLAfpnSunCRf1ktSXTScEaYbc=;
        b=f/fPV6sF0kG0BakPKtd6KtNRaxB2Tcs2h6yM7QPxf56reZIezf+i3D+0pykUzph25F
         PpozayDuE/qbqyLQ2kexjIIj75QhgGMI/Seilt1QbD7BF5xwqocwydukd4BSnVSNe8qy
         DlMnPSlWR0WJwNEFOlUrQaB9LXFVYZkKHVcvICP2ILeAFONQOCmb5wEMw82rFr3Alfvk
         8vmXXTUyXLqV4za+CjdI+jk88B3uoZ6pOOchEn6c1a3K82uMGCbM8kL/MWJnDpF9jFU2
         KOTna4MdypJ/fxKE0pV89grAFIQJBoq9HheXIVLOgFwnipTlKWJbrM6A/7coro8dNtCI
         99dg==
X-Gm-Message-State: APjAAAVsypXRutZkTt9eVRJRihemhgs9IQzt6SET1o6MmkhE8wZZ+ARa
        0dW0Iv5BsyhfMwhQ++7JIkoXdQ==
X-Google-Smtp-Source: APXvYqxe0w5H5Lbp3dMEIZwHUQGUfuP7CAE1qp4H3oP/Way0mfB+mOYm7wPaWPRw3rhpzwkBl3uYMA==
X-Received: by 2002:a05:651c:92:: with SMTP id 18mr3575260ljq.35.1562371059181;
        Fri, 05 Jul 2019 16:57:39 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id d7sm263922lfa.86.2019.07.05.16.57.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 05 Jul 2019 16:57:38 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net
Cc:     ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
        daniel@iogearbox.net, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v9 net-next 2/5] net: ethernet: ti: davinci_cpdma: add dma mapped submit
Date:   Sat,  6 Jul 2019 02:57:34 +0300
Message-Id: <20190705235734.10776-1-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190705150502.6600-3-ivan.khoronzhuk@linaro.org>
References: <20190705150502.6600-3-ivan.khoronzhuk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In case if dma mapped packet needs to be sent, like with XDP
page pool, the "mapped" submit can be used. This patch adds dma
mapped submit based on regular one.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
---

v9..v8
- fix potential warnings on arm64 caused by typos in type casting

 drivers/net/ethernet/ti/davinci_cpdma.c | 89 ++++++++++++++++++++++---
 drivers/net/ethernet/ti/davinci_cpdma.h |  4 ++
 2 files changed, 83 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/ti/davinci_cpdma.c b/drivers/net/ethernet/ti/davinci_cpdma.c
index 5cf1758d425b..4e693c3aab27 100644
--- a/drivers/net/ethernet/ti/davinci_cpdma.c
+++ b/drivers/net/ethernet/ti/davinci_cpdma.c
@@ -139,6 +139,7 @@ struct submit_info {
 	int directed;
 	void *token;
 	void *data;
+	int flags;
 	int len;
 };
 
@@ -184,6 +185,8 @@ static struct cpdma_control_info controls[] = {
 				 (directed << CPDMA_TO_PORT_SHIFT));	\
 	} while (0)
 
+#define CPDMA_DMA_EXT_MAP		BIT(16)
+
 static void cpdma_desc_pool_destroy(struct cpdma_ctlr *ctlr)
 {
 	struct cpdma_desc_pool *pool = ctlr->pool;
@@ -1015,6 +1018,7 @@ static int cpdma_chan_submit_si(struct submit_info *si)
 	struct cpdma_chan		*chan = si->chan;
 	struct cpdma_ctlr		*ctlr = chan->ctlr;
 	int				len = si->len;
+	int				swlen = len;
 	struct cpdma_desc __iomem	*desc;
 	dma_addr_t			buffer;
 	u32				mode;
@@ -1036,16 +1040,22 @@ static int cpdma_chan_submit_si(struct submit_info *si)
 		chan->stats.runt_transmit_buff++;
 	}
 
-	buffer = dma_map_single(ctlr->dev, si->data, len, chan->dir);
-	ret = dma_mapping_error(ctlr->dev, buffer);
-	if (ret) {
-		cpdma_desc_free(ctlr->pool, desc, 1);
-		return -EINVAL;
-	}
-
 	mode = CPDMA_DESC_OWNER | CPDMA_DESC_SOP | CPDMA_DESC_EOP;
 	cpdma_desc_to_port(chan, mode, si->directed);
 
+	if (si->flags & CPDMA_DMA_EXT_MAP) {
+		buffer = (dma_addr_t)si->data;
+		dma_sync_single_for_device(ctlr->dev, buffer, len, chan->dir);
+		swlen |= CPDMA_DMA_EXT_MAP;
+	} else {
+		buffer = dma_map_single(ctlr->dev, si->data, len, chan->dir);
+		ret = dma_mapping_error(ctlr->dev, buffer);
+		if (ret) {
+			cpdma_desc_free(ctlr->pool, desc, 1);
+			return -EINVAL;
+		}
+	}
+
 	/* Relaxed IO accessors can be used here as there is read barrier
 	 * at the end of write sequence.
 	 */
@@ -1055,7 +1065,7 @@ static int cpdma_chan_submit_si(struct submit_info *si)
 	writel_relaxed(mode | len, &desc->hw_mode);
 	writel_relaxed((uintptr_t)si->token, &desc->sw_token);
 	writel_relaxed(buffer, &desc->sw_buffer);
-	writel_relaxed(len, &desc->sw_len);
+	writel_relaxed(swlen, &desc->sw_len);
 	desc_read(desc, sw_len);
 
 	__cpdma_chan_submit(chan, desc);
@@ -1079,6 +1089,32 @@ int cpdma_chan_idle_submit(struct cpdma_chan *chan, void *token, void *data,
 	si.data = data;
 	si.len = len;
 	si.directed = directed;
+	si.flags = 0;
+
+	spin_lock_irqsave(&chan->lock, flags);
+	if (chan->state == CPDMA_STATE_TEARDOWN) {
+		spin_unlock_irqrestore(&chan->lock, flags);
+		return -EINVAL;
+	}
+
+	ret = cpdma_chan_submit_si(&si);
+	spin_unlock_irqrestore(&chan->lock, flags);
+	return ret;
+}
+
+int cpdma_chan_idle_submit_mapped(struct cpdma_chan *chan, void *token,
+				  dma_addr_t data, int len, int directed)
+{
+	struct submit_info si;
+	unsigned long flags;
+	int ret;
+
+	si.chan = chan;
+	si.token = token;
+	si.data = (void *)data;
+	si.len = len;
+	si.directed = directed;
+	si.flags = CPDMA_DMA_EXT_MAP;
 
 	spin_lock_irqsave(&chan->lock, flags);
 	if (chan->state == CPDMA_STATE_TEARDOWN) {
@@ -1103,6 +1139,32 @@ int cpdma_chan_submit(struct cpdma_chan *chan, void *token, void *data,
 	si.data = data;
 	si.len = len;
 	si.directed = directed;
+	si.flags = 0;
+
+	spin_lock_irqsave(&chan->lock, flags);
+	if (chan->state != CPDMA_STATE_ACTIVE) {
+		spin_unlock_irqrestore(&chan->lock, flags);
+		return -EINVAL;
+	}
+
+	ret = cpdma_chan_submit_si(&si);
+	spin_unlock_irqrestore(&chan->lock, flags);
+	return ret;
+}
+
+int cpdma_chan_submit_mapped(struct cpdma_chan *chan, void *token,
+			     dma_addr_t data, int len, int directed)
+{
+	struct submit_info si;
+	unsigned long flags;
+	int ret;
+
+	si.chan = chan;
+	si.token = token;
+	si.data = (void *)data;
+	si.len = len;
+	si.directed = directed;
+	si.flags = CPDMA_DMA_EXT_MAP;
 
 	spin_lock_irqsave(&chan->lock, flags);
 	if (chan->state != CPDMA_STATE_ACTIVE) {
@@ -1140,10 +1202,17 @@ static void __cpdma_chan_free(struct cpdma_chan *chan,
 	uintptr_t			token;
 
 	token      = desc_read(desc, sw_token);
-	buff_dma   = desc_read(desc, sw_buffer);
 	origlen    = desc_read(desc, sw_len);
 
-	dma_unmap_single(ctlr->dev, buff_dma, origlen, chan->dir);
+	buff_dma   = desc_read(desc, sw_buffer);
+	if (origlen & CPDMA_DMA_EXT_MAP) {
+		origlen &= ~CPDMA_DMA_EXT_MAP;
+		dma_sync_single_for_cpu(ctlr->dev, buff_dma, origlen,
+					chan->dir);
+	} else {
+		dma_unmap_single(ctlr->dev, buff_dma, origlen, chan->dir);
+	}
+
 	cpdma_desc_free(pool, desc, 1);
 	(*chan->handler)((void *)token, outlen, status);
 }
diff --git a/drivers/net/ethernet/ti/davinci_cpdma.h b/drivers/net/ethernet/ti/davinci_cpdma.h
index 9343c8c73c1b..0271a20c2e09 100644
--- a/drivers/net/ethernet/ti/davinci_cpdma.h
+++ b/drivers/net/ethernet/ti/davinci_cpdma.h
@@ -77,8 +77,12 @@ int cpdma_chan_stop(struct cpdma_chan *chan);
 
 int cpdma_chan_get_stats(struct cpdma_chan *chan,
 			 struct cpdma_chan_stats *stats);
+int cpdma_chan_submit_mapped(struct cpdma_chan *chan, void *token,
+			     dma_addr_t data, int len, int directed);
 int cpdma_chan_submit(struct cpdma_chan *chan, void *token, void *data,
 		      int len, int directed);
+int cpdma_chan_idle_submit_mapped(struct cpdma_chan *chan, void *token,
+				  dma_addr_t data, int len, int directed);
 int cpdma_chan_idle_submit(struct cpdma_chan *chan, void *token, void *data,
 			   int len, int directed);
 int cpdma_chan_process(struct cpdma_chan *chan, int quota);
-- 
2.17.1

