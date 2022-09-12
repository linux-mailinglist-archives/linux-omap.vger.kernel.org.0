Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B2765B61E4
	for <lists+linux-omap@lfdr.de>; Mon, 12 Sep 2022 21:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbiILTu7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 12 Sep 2022 15:50:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiILTu6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 12 Sep 2022 15:50:58 -0400
Received: from mail-ua1-x949.google.com (mail-ua1-x949.google.com [IPv6:2607:f8b0:4864:20::949])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EAB3476F5
        for <linux-omap@vger.kernel.org>; Mon, 12 Sep 2022 12:50:57 -0700 (PDT)
Received: by mail-ua1-x949.google.com with SMTP id o43-20020ab0596e000000b0038421e4c7deso2995479uad.19
        for <linux-omap@vger.kernel.org>; Mon, 12 Sep 2022 12:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=gQRJcVGVry+O+rO0ClNB2v9fZHzTw/QBigbLMMx2lx4=;
        b=qL4m/RexaXk1mzhmuPHOla2wkRlr9DJpg+3jV4dsmZ4U/uKncjqKf36W4zf52rWGz7
         xV3j0xkv+Jl1prJK4yrGOiITEqwx6kaQBAdfsaLTg5/6aoljklvy6PJeNIdNToEaLn53
         We4o9T+piGhVRQAqwAOvF7xgsCwdLNNO8nyjtml9dw5YN7Uz//YhsMDiwjVtQ5KcArV9
         Wxv1Ost1gpBOfJaTjtuJXcwooKsvoKn8Lw51HtNkr7NE8V1hvETVOKQGoU8vW097dU6k
         EFPClS9vg+5sU33mJ6TzGQ7V1JBAG1oY1RNZelI4WN5jzy7zSsUhbQmAR7FB+SSYSwhC
         82NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=gQRJcVGVry+O+rO0ClNB2v9fZHzTw/QBigbLMMx2lx4=;
        b=3rvMSl3qK8ctaz6GjcIfbamSHES0D0g4yhzDYTZOB2Z4TTAnGXDLwRM5jOt++XN3/M
         AAb2h9Bkdwb08KRyperzq3sMcdTvRhbvLcqyX02ufIxyKY2P3I6YGKi8wmCm1fCe78RE
         WW9aD9M/tZim5T0zxTQ3H/7aDhy1DvHlzw4gSGezbQSS7XoUzOXpOebX7ME0oeHjf1Bw
         qKHeeuB6MvtXImfXVBJyxCHjbShN9Nmo9GWvTBHvQYRhgJwuyFQuZhFiLwCpYp8bFzVL
         H4kP3fBhm+PNj7tIrHpkzBZslUxqOUT5/Rd1VVHYESO6mngQZO1rd/KLnd+IlOZ8i5uj
         UIqg==
X-Gm-Message-State: ACgBeo1MEomWXiNoctSrV/j2hg43DRUCiuStgOLeoZBjas9ydiHpHqoT
        5dy0HdubkT7lqDlOeAL4sL2qT5RsLw==
X-Google-Smtp-Source: AA6agR7rJ+0cHLUZrt4DFI/aWWTLh81TsF5sCMpgejD4ykJrhUmdF8T/XLQdjfvjQq4m/De/l6Eg2aQYPg==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a1f:2a4b:0:b0:39e:8dc0:75e0 with SMTP id
 q72-20020a1f2a4b000000b0039e8dc075e0mr8961536vkq.37.1663012256093; Mon, 12
 Sep 2022 12:50:56 -0700 (PDT)
Date:   Mon, 12 Sep 2022 12:50:19 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220912195023.810319-1-nhuck@google.com>
Subject: [PATCH] net: ethernet: ti: davinci_emac: Fix return type of emac_dev_xmit
From:   Nathan Huckleberry <nhuck@google.com>
Cc:     Nathan Huckleberry <nhuck@google.com>,
        Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Maxim Kiselev <bigunclemax@gmail.com>,
        Minghao Chi <chi.minghao@zte.com.cn>,
        linux-omap@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MISSING_HEADERS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The ndo_start_xmit field in net_device_ops is expected to be of type
netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of emac_dev_xmit should be changed from int to
netdev_tx_t.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/net/ethernet/ti/davinci_emac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/davinci_emac.c b/drivers/net/ethernet/ti/davinci_emac.c
index 2a3e4e842fa5..e203a5984f03 100644
--- a/drivers/net/ethernet/ti/davinci_emac.c
+++ b/drivers/net/ethernet/ti/davinci_emac.c
@@ -949,7 +949,7 @@ static void emac_tx_handler(void *token, int len, int status)
  *
  * Returns success(NETDEV_TX_OK) or error code (typically out of desc's)
  */
-static int emac_dev_xmit(struct sk_buff *skb, struct net_device *ndev)
+static netdev_tx_t emac_dev_xmit(struct sk_buff *skb, struct net_device *ndev)
 {
 	struct device *emac_dev = &ndev->dev;
 	int ret_code;
-- 
2.37.2.789.g6183377224-goog

