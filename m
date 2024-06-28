Return-Path: <linux-omap+bounces-1609-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A7A91B579
	for <lists+linux-omap@lfdr.de>; Fri, 28 Jun 2024 05:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E824E282BA6
	for <lists+linux-omap@lfdr.de>; Fri, 28 Jun 2024 03:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA74200C7;
	Fri, 28 Jun 2024 03:30:00 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEC01C6A4;
	Fri, 28 Jun 2024 03:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719545400; cv=none; b=QCyaCD5NVLlLjfxDVRBAaSvk3sPqmTselQqHjhT0eWQAr7DKpDI8DViIAx0cXLNSH1g4z0zVCjCQN4wTYfyGSU6JztEd/5EHe5D2LlC3rxqYODGE3KxB0R+xGujM+Tn2Tzpl2g5w+yXCQ+6zhpAhHKc/GAlrhf43FRn6It0A8FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719545400; c=relaxed/simple;
	bh=X8j+d7Ppn01ukU2yrL8s3zRacqDFRpKXE/Iqg1qpifw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hevr+Ifm4axU0xtoOmWpTnI5jkglJ9W4ly0nNTYsfw2SSBsmYc50IQ2p1g/tN5s5COAjNb30hEwc8cdNDm0tRDxz+4XcI3XACaTJFgu88BWG87rISt33GV6oiZjQn+gS6I4MQ5zFLJ310u+7KE9xQ4nr9a+eC/lCZpCzhLvUBsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowADn7tYoLn5mB1vZEg--.9834S2;
	Fri, 28 Jun 2024 11:29:44 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: deller@gmx.de,
	laurent.pinchart@ideasonboard.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-omap@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] fbdev: omap2: Return clk_prepare_enable to transfer the error
Date: Fri, 28 Jun 2024 11:28:12 +0800
Message-Id: <20240628032812.280895-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADn7tYoLn5mB1vZEg--.9834S2
X-Coremail-Antispam: 1UD129KBjvdXoWruF1DuFyDCw4kZw1kuF4rZrb_yoW3Arc_Ca
	nrurZxGF9xtrWvk3Wrtws8CrZ2y3WIqFyfur92g3yfKry7Cr1fXryDZr13A3yDXr40yFyD
	ur17X340yr1fujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbckFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_
	Gr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUShFxUUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Return clk_prepare_enable() in order to transfer the error if it fails.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/video/fbdev/omap2/omapfb/dss/venc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/venc.c b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
index 0bd80d3b8f1b..d13ad00d353b 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/venc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
@@ -903,9 +903,7 @@ static int venc_runtime_resume(struct device *dev)
 	if (r < 0)
 		return r;
 
-	clk_prepare_enable(venc.tv_dac_clk);
-
-	return 0;
+	return clk_prepare_enable(venc.tv_dac_clk);
 }
 
 static const struct dev_pm_ops venc_pm_ops = {
-- 
2.25.1


