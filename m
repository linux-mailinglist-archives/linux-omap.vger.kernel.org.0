Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E58D7B4C2F
	for <lists+linux-omap@lfdr.de>; Mon,  2 Oct 2023 09:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235626AbjJBHFI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 2 Oct 2023 03:05:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235600AbjJBHFH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 2 Oct 2023 03:05:07 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1FDFAC
        for <linux-omap@vger.kernel.org>; Mon,  2 Oct 2023 00:05:04 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5048156976cso8775794e87.2
        for <linux-omap@vger.kernel.org>; Mon, 02 Oct 2023 00:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696230303; x=1696835103; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p3WSZwdkcjvjhe/gpQ76zvJY2T86inbO4LfRqWd0a6w=;
        b=ksWP/7+mKfoT3XgCC8dSHq1yVW+YAzhXLiSqv+lFg+MMbnn8OoaZaFeasaC/YQY0GX
         hCJA0/c8c+uEXLGcyGd/sTf0lBfqdhQ9h6HgkOjefqvO0D8fHnE6hf95oSKZ3vtY+cTy
         vAYFa9mGRieVXYt6VsYeiWmrh1jXhmxahpeCnsdtbbMauvip132/ePrXm6VaxDHC0OBF
         rhM3tuNRyPv4BCczZMWYekwiA0JXo8omg0KamZyhydAGH8u5dNvzM6WSXJPygcHB4Yj2
         DzhO5DThzqRomVA5Jp2baM+AsgEkfRBv1AqoZdHmf7uaQWfgL87aq1BNfA5rDuKLJ7RP
         O7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696230303; x=1696835103;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p3WSZwdkcjvjhe/gpQ76zvJY2T86inbO4LfRqWd0a6w=;
        b=Hnf9oTxqzqa13CfCG5KC3V+pFxnp56DkxcsIHRq6P1P6vstgUvDXLpVpEM8hU5VdQa
         KFvBp3dtqNBhiYLpa1l+fpNQiMdnye1Su1fj1+bET1eEwy5uVG72CQpH/Y/k1HxaBOcu
         zai8OoEQKrO94B5alzNHjgvxvC382PI3/IZ1w6FAd8dP/T3Hoepyy6PjCoItd5nikEMM
         jrE7r9Z5PZExF35K5Y62qbe8rgQp9Y8noeNS3n+Y9GelhSpp4VRx7BizrmpoHurFkrDW
         xThGv9jGnx1fYqIy9VBqHQly1sZdWpNQYcS8SbIw3ZJ/DHf4TFLsp5rMNCMES+zCDzd1
         L6PA==
X-Gm-Message-State: AOJu0Yygc1MxCBfuPtMOKKBo1TFzHQ3nHbu9ELMv5XPi8M0LLDdUVr0W
        Tdn4+gEyrSPHgEzAsgxaAJTBsQ==
X-Google-Smtp-Source: AGHT+IGwerErhtnDVzz1WhrfkBcTpmotFSKxSZgpYhF5J+JqODTofqGXeokFOz10GvBV3SwrupD0uQ==
X-Received: by 2002:a05:6512:691:b0:504:7ff8:3430 with SMTP id t17-20020a056512069100b005047ff83430mr9907489lfe.10.1696230303039;
        Mon, 02 Oct 2023 00:05:03 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o14-20020a05600c4fce00b00405d9a950a2sm6256010wmq.28.2023.10.02.00.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 00:05:02 -0700 (PDT)
Date:   Mon, 2 Oct 2023 10:04:59 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Paul Walmsley <paul@pwsan.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] ARM: omap2: fix a debug printk
Message-ID: <c126dc33-233a-4776-806f-9dff0e73a181@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The %pR format string takes a pointer to struct resource, but this is
passing a pointer to a pointer which it will print wrong information.

Fixes: c63f5b454885 ("ARM: omap2: Use of_range_to_resource() for "ranges" parsing")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 arch/arm/mach-omap2/omap_hwmod.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
index 1e17b5f77588..ba71928c0fcb 100644
--- a/arch/arm/mach-omap2/omap_hwmod.c
+++ b/arch/arm/mach-omap2/omap_hwmod.c
@@ -2209,7 +2209,7 @@ int omap_hwmod_parse_module_range(struct omap_hwmod *oh,
 		return err;
 
 	pr_debug("omap_hwmod: %s %pOFn at %pR\n",
-		 oh->name, np, &res);
+		 oh->name, np, res);
 
 	if (oh && oh->mpu_rt_idx) {
 		omap_hwmod_fix_mpu_rt_idx(oh, np, res);
-- 
2.39.2

